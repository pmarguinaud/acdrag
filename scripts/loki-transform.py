#!/usr/bin/env python

"""
Loki head script for source-to-source transformations concerning ECMWF
physics, including "Single Column" (SCA) and CLAW transformations.
"""

import sys
from pathlib import Path
import click

print(sys.path)

from loki import (
    Sourcefile, Transformation, Scheduler, SchedulerConfig,
    Frontend, as_tuple
)

# Get generalized transformations provided by Loki
from loki.transform import DependencyTransformation, FortranCTransformation

# Bootstrap the local transformations directory for custom transformations
sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str("/home/legaux/meteo/loki/scripts") )
sys.path.insert(0, str("/home/legaux/meteo/loki/loki") )
# pylint: disable=wrong-import-position,wrong-import-order
from transformations import DerivedTypeArgumentsTransformation
from transformations import DataOffloadTransformation
from transformations import ExtractSCATransformation, CLAWTransformation
from transformations import SingleColumnCoalescedTransformation


"""
Scheduler configuration for the CLOUDSC ESCAPE dwarf.

This defines the "roles" of the two main source files
("driver" and "kernel") and adds exemptions for the
bulk-processing scheduler to ignore the timing utlitiies.
"""
cloudsc_config = {
    'default': {
        'mode': 'idem',
        'role': 'kernel',
        'expand': True,
        'strict': True,
        # Ensure that we are never adding these to the tree, and thus
        # do not attempt to look up the source files for these.
        # TODO: Add type-bound procedure support and adjust scheduler to it
        'disable': ['dr_hook','initoptions','getoption','checkoptions', 'getdata','load','COUNT_ZEROES_NAN','COMPARE_VALUES']
    },
    'routine': [
        {
            'name': 'wrap_acdrag',
            'role': 'driver',
            'expand': True,
        },
        {
            'name': 'acdrag',
            'role': 'kernel',
            'expand': True,
        }
    ],
    'dimension': [
        {
            'name': 'horizontal',
            'size': 'KLON',
            'index': 'JLON',
            'bounds': ('KIDIA', 'KFDIA'),
            'aliases': ['NPROMA', 'KDIM%KLON'],
        },
        {
            'name': 'vertical',
            'size': 'KLEV',
            'index': 'JLEV',
        },
        {
            'name': 'block_dim',
            'size': 'NGPBLKS',
            'index': 'IBL',
        }
    ]
}


class IdemTransformation(Transformation):
    """
    A custom transformation pipeline that primarily does nothing,
    allowing us to test simple parse-unparse cycles.
    """

    def transform_subroutine(self, routine, **kwargs):
        pass


@click.group()
def cli():
    pass


@cli.command()
@click.option('--out-path', '-out', type=click.Path(),
              help='Path for generated souce files.')
@click.option('--path', '-p', type=click.Path(),
              help='Path to search during source exploration.')
@click.option('--header', '-h', type=click.Path(), multiple=True,
              help='Path for additional header file(s).')
@click.option('--cpp/--no-cpp', default=False,
              help='Trigger C-preprocessing of source files.')
@click.option('--include', '-I', type=click.Path(), multiple=True,
              help='Path for additional header file(s)')
@click.option('--define', '-D', multiple=True,
              help='Additional symbol definitions for the C-preprocessor')
@click.option('--omni-include', type=click.Path(), multiple=True,
              help='Additional path for header files, specifically for OMNI')
@click.option('--xmod', '-M', type=click.Path(), multiple=True,
              help='Path for additional .xmod file(s) for OMNI')
@click.option('--data-offload', is_flag=True, default=False,
              help='Run transformation to insert custom data offload regions.')
@click.option('--remove-openmp', is_flag=True, default=False,
              help='Removes existing OpenMP pragmas in "!$loki data" regions.')
@click.option('--mode', '-m', default='sca',
              type=click.Choice(['idem', 'sca', 'claw', 'scc', 'scc-hoist']),
              help='Transformation mode, selecting which code transformations to apply.')
@click.option('--frontend', default='fp', type=click.Choice(['fp', 'ofp', 'omni']),
              help='Frontend parser to use (default FP)')
@click.option('--config', default=None, type=click.Path(),
              help='Path to custom scheduler configuration file')
def convert(out_path, path, header, cpp, include, define, omni_include, xmod,
            data_offload, remove_openmp, mode, frontend, config):
    """
    Single Column Abstraction (SCA): Convert kernel into single-column
    format and adjust driver to apply it over in a horizontal loop.

    Optionally, this can also insert CLAW directives that may be use
    for further downstream transformations.
    """
    if config is None:
        config = SchedulerConfig.from_dict(cloudsc_config)
    else:
        config = SchedulerConfig.from_file(config)

    build_args = {
        'preprocess': cpp,
        'includes': include,
        'defines': define,
        'xmods': xmod,
        'omni_includes': omni_include,
    }

    frontend = Frontend[frontend.upper()]
    frontend_type = Frontend.FP if frontend == Frontend.OMNI else frontend

    # Note, in order to get function inlinig correct, we need full knowledge
    # of any imported symbols and functions. Since we cannot yet retro-fit that
    # after creation, we need to make sure that the order of definitions can
    # be used to create a coherent stack of type definitions.
    definitions = []
    for h in header:
        sfile = Sourcefile.from_file(h, frontend=frontend_type, **build_args)
        definitions = definitions + list(sfile.modules)

    # Create a scheduler to bulk-apply source transformations
    paths = [Path(p).resolve() for p in as_tuple(path)]
    paths += [Path(h).resolve().parent for h in as_tuple(header)]
    scheduler = Scheduler(paths=paths, config=config, frontend=frontend,
                          definitions=definitions, **build_args)
    scheduler.populate(routines=config.routines.keys())

    # First, remove all derived-type arguments; caller first!
    scheduler.process(transformation=DerivedTypeArgumentsTransformation())

    # Insert data offload regions for GPUs and remove OpenMP threading directives
    use_claw_offload = True
    if data_offload:
        offload_transform = DataOffloadTransformation(remove_openmp=remove_openmp)
        scheduler.process(transformation=offload_transform)
        use_claw_offload = not offload_transform.has_data_regions

    # Now we instantiate our transformation pipeline and apply the main changes
    transformation = None
    if mode == 'idem':
        transformation = IdemTransformation()

    if mode == 'sca':
        horizontal = scheduler.config.dimensions['horizontal']
        transformation = ExtractSCATransformation(horizontal=horizontal)

    if mode == 'claw':
        horizontal = scheduler.config.dimensions['horizontal']
        transformation = CLAWTransformation(
            horizontal=horizontal, claw_data_offload=use_claw_offload
        )

    if mode in ['scc', 'scc-hoist']:
        horizontal = scheduler.config.dimensions['horizontal']
        vertical = scheduler.config.dimensions['vertical']
        block_dim = scheduler.config.dimensions['block_dim']
        transformation = SingleColumnCoalescedTransformation(
            horizontal=horizontal, vertical=vertical, block_dim=block_dim,
            directive='openacc', hoist_column_arrays='hoist' in mode
        )

    if transformation:
        scheduler.process(transformation=transformation)
    else:
        raise RuntimeError('[Loki] Convert could not find specified Transformation!')

    # Housekeeping: Inject our re-named kernel and auto-wrapped it in a module
    mode = mode.replace('-', '_')  # Sanitize mode string
    dependency = DependencyTransformation(suffix='_{}'.format(mode.upper()),
                                          mode='module', module_suffix='_MOD')
    scheduler.process(transformation=dependency)

    # Write out all modified source files into the build directory
    for item in scheduler.items:
        suffix = '.{}.F90'.format(mode)
        sourcefile = item.source
        sourcefile.write(path=Path(out_path)/sourcefile.path.with_suffix(suffix).name)


@cli.command()
@click.option('--out-path', '-out', type=click.Path(),
              help='Path for generated souce files.')
@click.option('--header', '-I', type=click.Path(), multiple=True,
              help='Path for additional header file(s).')
@click.option('--source', '-s', type=click.Path(),
              help='Source file to convert.')
@click.option('--driver', '-d', type=click.Path(),
              help='Driver file to convert.')
@click.option('--cpp/--no-cpp', default=False,
              help='Trigger C-preprocessing of source files.')
@click.option('--include', '-I', type=click.Path(), multiple=True,
              help='Path for additional header file(s)')
@click.option('--define', '-I', multiple=True,
              help='Additional symbol definitions for C-preprocessor')
@click.option('--xmod', '-M', type=click.Path(), multiple=True,
              help='Path for additional module file(s)')
@click.option('--frontend', default='omni', type=click.Choice(['fp', 'ofp', 'omni']),
              help='Frontend parser to use (default FP)')
def transpile(out_path, header, source, driver, cpp, include, define, frontend, xmod):
    """
    Convert kernels to C and generate ISO-C bindings and interfaces.
    """
    driver_name = 'CLOUDSC_DRIVER'
    kernel_name = 'CLOUDSC'

    frontend = Frontend[frontend.upper()]
    frontend_type = Frontend.FP if frontend == Frontend.OMNI else frontend

    # Note, in order to get function inlinig correct, we need full knowledge
    # of any imported symbols and functions. Since we cannot yet retro-fit that
    # after creation, we need to make sure that the order of definitions can
    # be used to create a coherent stack of type definitions.
    definitions = []
    for h in header:
        sfile = Sourcefile.from_file(h, xmods=xmod, definitions=definitions,
                                     frontend=frontend_type)
        definitions = definitions + list(sfile.modules)

    # Parse original driver and kernel routine, and enrich the driver
    kernel = Sourcefile.from_file(source, definitions=definitions, preprocess=cpp,
                                  includes=include, defines=define, xmods=xmod,
                                  frontend=frontend)
    driver = Sourcefile.from_file(driver, xmods=xmod, frontend=frontend)
    # Ensure that the kernel calls have all meta-information
    driver[driver_name].enrich_calls(routines=kernel[kernel_name])

    # First, remove all derived-type arguments; caller first!
    driver.apply(DerivedTypeArgumentsTransformation(), role='driver')
    kernel.apply(DerivedTypeArgumentsTransformation(), role='kernel')

    # Now we instantiate our pipeline and apply the changes
    transformation = FortranCTransformation()
    transformation.apply(kernel, role='kernel', path=out_path)

    # Traverse header modules to create getter functions for module variables
    for h in definitions:
        transformation.apply(h, role='header', path=out_path)

    # Housekeeping: Inject our re-named kernel and auto-wrapped it in a module
    dependency = DependencyTransformation(suffix='_FC', mode='module', module_suffix='_MOD')
    kernel.apply(dependency, role='kernel')
    kernel.write(path=Path(out_path)/kernel.path.with_suffix('.c.F90').name)

    # Re-generate the driver that mimicks the original source file,
    # but imports and calls our re-generated kernel.
    driver.apply(dependency, role='driver', targets=kernel_name)
    driver.write(path=Path(out_path)/driver.path.with_suffix('.c.F90').name)


if __name__ == "__main__":
    cli()
