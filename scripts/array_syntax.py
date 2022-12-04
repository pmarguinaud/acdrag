# Script that replaces assignements on arrays using array syntax with explicit range for the first dimension
# Only relevant for routines that are expected to be used in a Single Column Coalesced tranformation


# from loki import FP, Sourcefile, Dimension, Subroutine
from loki import Frontend, Sourcefile, Scheduler, FindNodes, Loop, Variable, Assignment, CallStatement, Transformation, Node, SymbolAttributes, DerivedType, BasicType, Import, Transformer, Conditional
from loki.expression import LoopRange, FindVariables, FindTypedSymbols
from loki.expression.expression import SubstituteExpressions
from loki.expression.symbols import (
    Array, Scalar, InlineCall, TypedSymbol, FloatLiteral, IntLiteral, LogicLiteral,
    StringLiteral, IntrinsicLiteral, DeferredTypeSymbol, LogicalOr, LogicalAnd, LogicalNot, RangeIndex
)
from loki.ir import Section, Comment, VariableDeclaration
from pathlib import Path
from termcolor import colored
import sys
# Bootstrap the local transformations directory for custom transformations
# print("path  = ", str(Path(__file__).parent))
# print("sys.path  = ", sys.path)
# print ("dir =", dir)


class ExplicitArraySyntaxes(Transformation):
  def transform_subroutine(self, routine, **kwargs):
    print("transforming routine ", routine.name)
    print(" ============================== ")
    assign_map={}
    
    for var in FindVariables().visit(routine.variables):
      if (var.name=='KIDIA'):
        kidia_var = var
      if (var.name=='KFDIA'):
        kfdia_var = var

    if (not kidia_var and not kfdia_var):
      print("KIDIA of KFDIA do not exist in this subroutine !!!!")

    for assign in FindNodes(Assignment).visit(routine.body):
      expression_map={}             
      for var in FindVariables().visit(assign):
        if isinstance(var, Array):
          if (len(var.dimensions) > 0):
            # print("var dimensions : ", var.dimensions)
            fully_implicit = True
            for dim in var.dimensions:
              if (dim != ":"):
                fully_implicit = False
            if (fully_implicit):
              newrange = RangeIndex( (kidia_var, kfdia_var, None) )
              newdimensions = (newrange,) + var.dimensions[1:]
              new_var = var.clone(dimensions=newdimensions)
              expression_map[var] = new_var
      if expression_map:
        explicited_assign = SubstituteExpressions(expression_map).visit(assign)
        assign_map[assign] = explicited_assign
        print("Transforming ", assign)
        print("        into ", explicited_assign)

            
    print("routine parsed, applying transofrmer")
    routine.body=Transformer(assign_map).visit(routine.body)
    print("transformer applied")





test_config = {
    'default': {
        'mode': 'idem',
        'role': 'kernel',
        'expand': True,
        'strict': True,
        'disable': ['dr_hook','initoptions','getoption','checkoptions', 'getdata','load','exit','COUNT_ZEROES_NAN','COMPARE_VALUES','ABOR1']
    },
     'routine': [],
     'dimension': []
}




sched = Scheduler(paths="../src/",config=test_config, frontend=Frontend.FP)
sched.populate("ACDRAG")
sched.process(transformation=ExplicitArraySyntaxes())

output_suffix = ".F90.array"
for item in sched.items:
  sourcefile = item.source
  sourcefile.write(path=Path("../src/")/sourcefile.path.with_suffix(output_suffix).name)

