let main () =
  try
    let setmode =
      if ((Array.length Sys.argv) > 2)
      then match Sys.argv.(1) with
	     | "-obase" -> true
	     | _ -> false
      else false in
    let mode =
      if setmode
      then match (try int_of_string Sys.argv.(2) with Failure explanation -> raise (invalid_arg "Bad base")) with
	     | 2 -> Bigint.Binary
	     | 8 -> Bigint.Octal
	     | 16 -> Bigint.Hexadecimal
	     | 10 -> Bigint.Decimal
	     | _ -> raise (invalid_arg "Bad base")
      else Bigint.Decimal
    in

    let i = if setmode then 3 else 1 in

      let ok, channel =
	try
	  if ((Array.length Sys.argv)) > i
	  then true, open_in Sys.argv.(i)
	  else false, stdin
	with
	| Sys_error explanation -> begin prerr_endline ("BistroError : " ^ explanation); exit (0) end
      in

    while true do
      let lexbuf = Lexing.from_channel channel in
      let ok2 = ref true in
      while !ok2 do
	begin
	  ok2 := ok;
	  try
 	    let k = Parser.line Lexer.token lexbuf in
	    print_endline (Bigint.string_of_bigint_base mode (ArithExpr.solve_arith_expr k))
	  with
	  | Not_found -> begin prerr_endline "BistroError : Bad input"; ok2 := false end
	  | Invalid_argument explanation -> begin prerr_endline ("BistroError : Bad input : " ^ explanation); ok2 := false end
	  | Failure explanation -> begin prerr_endline ("BistroError : Bad input : " ^ explanation); ok2 := false end
	  | End_of_file -> raise End_of_file
	end
      done
    done
  with
  | End_of_file -> exit 0
  | Invalid_argument explanation -> prerr_endline ("BistroError : " ^ explanation)
  | Failure explanation -> prerr_endline ("BistroError : " ^ explanation)
let _ = main ()
