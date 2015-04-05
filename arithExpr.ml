type my_Operation = Op_Add | Op_Sub | Op_Mul | Op_Div | Op_Mod

type arith_expr =
  | Value of (int)
  | Op of (my_Operation * arith_expr * arith_expr)

let isValue = function
  | Value(_) -> true
  | _ -> false

let clean s =
  let l = (String.length s) - 1 in
  if s.[l] = ' '
  then (String.sub s 0 l)
  else s

let rec string_of_arith_expr = function
    | Value(n) -> (string_of_int n) ^ " "
    | Op(op, n1, n2) -> let s = match op with
			  | Op_Add -> "+ "
			  | Op_Sub -> "- "
			  | Op_Mul -> "* "
			  | Op_Div -> "/ "
			  | Op_Mod -> "% " in
			let s2 = if isValue n1
				 then string_of_arith_expr n1
				 else "(" ^ (string_of_arith_expr n1) ^ ") "
			in let s3 = if isValue n2
				    then string_of_arith_expr n2
				    else "(" ^ (string_of_arith_expr n2) ^ ") "
			   in (clean (s2 ^ s ^ s3))

let rec solve_arith_expr = function
    | Value(n) -> n
    | Op(op, n1, n2) -> match op with
			| Op_Add -> (* Bigint.add *) (solve_arith_expr n1) + (solve_arith_expr n2)
			| Op_Sub -> (* Bigint.sub *) (solve_arith_expr n1) - (solve_arith_expr n2)
			| Op_Mul -> (* Bigint.mul *) (solve_arith_expr n1) * (solve_arith_expr n2)
			| Op_Div -> (* Bigint.div *) (solve_arith_expr n1) / (solve_arith_expr n2)
			| Op_Mod -> (* Bigint.modulo *) (solve_arith_expr n1) mod (solve_arith_expr n2)
