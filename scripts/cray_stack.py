# Script based on test_single_column_coalesced_hoist_openacc

# Currently there's a bug in the script and it crashes with integer literals as array dimensions.
# Go to single_column_coalesced.py in .../loki/scripts/transformations
# and change every instance of 
# any(vertical.size in d for d in v.shape) to any(vertical.size == d for d in v.shape)
# It is three places.

# from loki import FP, Sourcefile, Dimension, Subroutine
from loki import Frontend, Sourcefile, Scheduler, FindNodes, Loop, Variable, Assignment, CallStatement, Transformation, Node, SymbolAttributes, DerivedType, BasicType, Import, Transformer
from loki.expression import LoopRange, FindVariables
from loki.expression.symbols import (
    Array, Scalar, InlineCall, TypedSymbol, FloatLiteral, IntLiteral, LogicLiteral,
    StringLiteral, IntrinsicLiteral, DeferredTypeSymbol
)
from loki.ir import Section, Comment, VariableDeclaration, Pragma
from pathlib import Path
from termcolor import colored
import sys
# Bootstrap the local transformations directory for custom transformations
sys.path.insert(0, str(Path(__file__).parent))
print("path  = ", str(Path(__file__).parent))
print("sys.path  = ", sys.path)
print ("dir =", dir)

# import MaTransformation



class InsertCrayPointers(Transformation):

  stack_module_name="stack_mod"
  stack_argument_name="my_stack_argument"
  stack_local_name="my_stack_local"
  # def __init__ (self, all_present_arrays):
  #   self.all_present_arrays = all_present_arrays



  def transform_subroutine(self, routine, **kwargs):
    print(" ======================================= ")
    print("   Transforming routine ", routine.name)
    print(" ======================================= ")
    

    stack_argument = Variable(name=self.stack_argument_name, type=SymbolAttributes(DerivedType(name='STACK'), intent='in' ))
    stack_local = Variable(name=self.stack_local_name, type=SymbolAttributes(DerivedType(name='STACK') ))

    tmpliste = list(routine.variables)
    tmpliste.append(stack_argument)
    tmpliste.append(stack_local)
    routine.variables = tmpliste

    new_arguments = list(routine.arguments)
    new_arguments.append(stack_argument)
    routine.arguments = new_arguments
    routine.spec.prepend(Import(module=self.stack_module_name))

    print("Added stack module import statement")

    # Put arguments in a list to circumvent very slow direct accesses
    list_args = list(routine.arguments)

    local_array_variables = []
    for decl in FindNodes(VariableDeclaration).visit(routine.spec):
      for v in decl.symbols:
        if isinstance(v, Array):
          if ( v not in list_args):
            local_array_variables.append(v)

    print("local arrays declarations found : ", len(local_array_variables))

    assignments = []

    for n in FindNodes(Pragma).visit(routine.body):
      if (n.keyword == "acc" and "routine" in n.content):
        main_pragma_node = n

    assignments.append(main_pragma_node)    

    assignments.append(Assignment(lhs=stack_local, rhs=stack_argument))

    for v in local_array_variables:
      cray_pointer = 'IP_'+v.name+'_'
      # Associate cray pointer to array variable
      routine.spec.append(Variable(name='POINTER (' + cray_pointer + ', ' + v.name + ' )' ) )

      # Define cray pointer as current end of the stack space
      assignments.append(Assignment(lhs=Variable(name=cray_pointer), rhs=Variable(name=stack_local.name+'%L')))

      # Increase stack boundary by the size of the array
      if (v.type.kind == None):
        type_string='SIZEOF(' + v.name + '(1'   
        for i in range(1, len(v.dimensions)):
          type_string+=',1'
        type_string+='))'
      else:
        type_string=str(v.type.kind) 

      assignments.append(Assignment(lhs=Variable(name=stack_local.name+'%L'), rhs=Variable(name=stack_local.name+'%L+'+ type_string + '*SIZE(' + v.name + ')' ) ) )      
      

    print("local arrays treated")
    map_assignments = {}
    map_assignments[main_pragma_node] = tuple(assignments)
    routine.body=Transformer(map_assignments).visit(routine.body)

    print("transformer applied")

    call_mapper = {}
    for call in FindNodes(CallStatement).visit(routine.body):
      if call.context is not None and call.context.active:
        new_arguments = list(call.arguments)
        new_arguments.append(stack_local)
        call_mapper[call] = call.clone(arguments=tuple(new_arguments))
    routine.body = Transformer(call_mapper).visit(routine.body)

    print("Stack argument added to Call statements")

    print(" ======================================= ")
    print("   Routine ", routine.name, " transformed")
    print(" ======================================= \n ")





test_config = {
    'default': {
        'mode': 'idem',
        'role': 'kernel',
        'expand': True,
        'strict': True,
        # # Ensure that we are never adding these to the tree, and thus
        # # do not attempt to look up the source files for these.
        # # TODO: Add type-bound procedure support and adjust scheduler to it
        'disable': ['dr_hook','initoptions','getoption','checkoptions', 'getdata','load','exit','COUNT_ZEROES_NAN','COMPARE_VALUES','ABOR1']
    },
     'routine': [
      
     ],
     'dimension': [
      
     ]
}


sched = Scheduler(paths="../src",config=test_config, frontend=Frontend.FP)
sched.populate("ACDRAG_SCC")

transfo = InsertCrayPointers()
sched.process(transformation=transfo)


for item in sched.items:
  suffix = '.stack.F90'
  sourcefile = item.source
  sourcefile.write(path=Path("../src/")/sourcefile.path.with_suffix(suffix).name)

exit()
