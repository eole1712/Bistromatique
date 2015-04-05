(* let print_error s = *)
(*   flush stderr; *)
(*   print_endline s; *)
(*   flush stdout *)

let main () =
  try
    while true do
      let lexbuf = Lexing.from_channel stdin in
      begin
	try
 	  let k = Parser.line Lexer.token lexbuf in
	  print_endline (Bigint.string_of_bigint (ArithExpr.solve_arith_expr k))
	with
	| Not_found -> prerr_endline "Should not happend"
	| Invalid_argument explanation -> prerr_endline ("Bad input : " ^ explanation)
	| Failure explanation -> prerr_endline ("Bad input : " ^ explanation)
	| End_of_file -> raise End_of_file
      end
    done
  with
  | End_of_file -> exit 0

let _ = main ()
