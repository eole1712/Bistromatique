(* file: main.ml *)
(* Assumes the parser file is "rtcalc.mly" and the lexer file is "lexer.mll". *)

let main () =
  try
    let lexbuf = Lexing.from_channel stdin in
    while true do
      begin
	try
	  let k = Parser.line Lexer.token lexbuf in
	  print_endline (Bigint.string_of_bigint (ArithExpr.solve_arith_expr k))
	with b
      end
    done
  with End_of_file -> exit 0
let _ = Printexc.print main ()

let parse_error s = (* Called by the parser function on error *)
  print_endline s;
  flush stdout
