type my_Operation = Op_Add | Op_Sub | Op_Mul | Op_Div | Op_Mod

type arith_expr =
    Value of int
  | Op of (my_Operation * arith_expr * arith_expr)

val string_of_arith_expr : arith_expr -> string

val solve_arith_expr : arith_expr -> int
