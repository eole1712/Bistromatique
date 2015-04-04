type my_Operation = Op_Add | Op_Sub | Op_Mul | Op_Div | Op_Mod

type arith_expr =
  | Value of (int)
  | Op of (my_Operation * arith_expr * arith_expr)

let isValue = function
  | Value(_) -> true
  | _ -> false

let rec string_of_arith_expr z = begin
    print_endline "Ext";
    match z with
  | Value(n) -> (string_of_int n) ^ " "
  | Op(op, n1, n2) -> let s = match op with
			| Op_Add -> "+ "
			| Op_Sub -> "- "
			| Op_Mul -> "* "
			| Op_Div -> "/ "
			| Op_Mod -> "% " in
		      let s2 = if isValue n1
			       then string_of_arith_expr n1
			       else "(" ^ (string_of_arith_expr n1) ^ ")"
		      in let s3 = if isValue n2
				  then string_of_arith_expr n2
				  else "(" ^ (string_of_arith_expr n2) ^ ")"
			 in (s2 ^ s ^ s3)
  end

module type ARITHEXPR =
  sig

    type my_Operation = Op_Add | Op_Sub | Op_Mul | Op_Div | Op_Mod

    type arith_expr =
      | Value of (int)
      | Op of (my_Operation * arith_expr * arith_expr)

    val string_of_arith_expr : arith_expr -> string

  end

module ArithExpr : ARITHEXPR =
  struct

    type my_Operation = Op_Add | Op_Sub | Op_Mul | Op_Div | Op_Mod

    type arith_expr =
      | Value of (int)
      | Op of (my_Operation * arith_expr * arith_expr)

    let isValue = function
      | Value(_) -> true
      | _ -> false

    let rec string_of_arith_expr z = begin
	print_endline "Int";
	match z with
	| Value(n) -> (string_of_int n) ^ " "
	| Op(op, n1, n2) -> let s = match op with
			      | Op_Add -> "+ "
			      | Op_Sub -> "- "
			      | Op_Mul -> "* "
			      | Op_Div -> "/ "
			      | Op_Mod -> "% " in
			    let s2 = if isValue n1
				     then string_of_arith_expr n1
				     else "(" ^ (string_of_arith_expr n1) ^ ")"
			    in let s3 = if isValue n2
					then string_of_arith_expr n2
					else "(" ^ (string_of_arith_expr n2) ^ ")"
			       in (s2 ^ s ^ s3)
      end

  end
