type token =
  | NUMBER of (string)
  | ADD
  | SUB
  | DIV
  | MUL
  | MOD
  | OBRACE
  | CBRACE
  | NEWLINE

open Parsing;;
let _ = parse_error;;
# 2 "test.mly"
    open ArithExpr
# 17 "test.ml"
let yytransl_const = [|
  258 (* ADD *);
  259 (* SUB *);
  260 (* DIV *);
  261 (* MUL *);
  262 (* MOD *);
  263 (* OBRACE *);
  264 (* CBRACE *);
  265 (* NEWLINE *);
    0|]

let yytransl_block = [|
  257 (* NUMBER *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\003\000\003\000\003\000\
\003\000\004\000\004\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\003\000\003\000\001\000\003\000\003\000\
\003\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\010\000\000\000\002\000\012\000\000\000\000\000\
\006\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\
\011\000\000\000\000\000\008\000\007\000\009\000"

let yydgoto = "\002\000\
\006\000\007\000\008\000\009\000"

let yysindex = "\001\000\
\255\254\000\000\000\000\000\255\000\000\000\000\013\255\022\255\
\000\000\021\255\000\255\000\255\000\000\000\255\000\255\000\255\
\000\000\022\255\022\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\009\255\011\255\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\017\000\022\000\016\000"

let yytablesize = 34
let yytable = "\003\000\
\003\000\001\000\003\000\003\000\000\000\004\000\004\000\005\000\
\003\000\003\000\005\000\005\000\004\000\004\000\011\000\012\000\
\005\000\005\000\004\000\004\000\010\000\013\000\011\000\012\000\
\000\000\014\000\015\000\016\000\017\000\020\000\021\000\022\000\
\018\000\019\000"

let yycheck = "\001\001\
\001\001\001\000\002\001\003\001\255\255\007\001\007\001\009\001\
\008\001\009\001\002\001\003\001\002\001\003\001\002\001\003\001\
\008\001\009\001\008\001\009\001\004\000\009\001\002\001\003\001\
\255\255\004\001\005\001\006\001\008\001\014\000\015\000\016\000\
\011\000\012\000"

let yynames_const = "\
  ADD\000\
  SUB\000\
  DIV\000\
  MUL\000\
  MOD\000\
  OBRACE\000\
  CBRACE\000\
  NEWLINE\000\
  "

let yynames_block = "\
  NUMBER\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : ArithExpr.arith_expr) in
    Obj.repr(
# 26 "test.mly"
               (begin print_endline ("[" ^ (ArithExpr.string_of_arith_expr _1) ^"]"); _1 end)
# 99 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 27 "test.mly"
           (Value(0))
# 105 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : ArithExpr.arith_expr) in
    Obj.repr(
# 31 "test.mly"
                        (_1)
# 112 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : ArithExpr.arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : ArithExpr.arith_expr) in
    Obj.repr(
# 32 "test.mly"
                 (Op(Op_Sub, _1, _3))
# 120 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : ArithExpr.arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : ArithExpr.arith_expr) in
    Obj.repr(
# 33 "test.mly"
                 (Op(Op_Add, _1, _3))
# 128 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : ArithExpr.arith_expr) in
    Obj.repr(
# 37 "test.mly"
           (_1)
# 135 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : ArithExpr.arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : ArithExpr.arith_expr) in
    Obj.repr(
# 38 "test.mly"
                   (Op(Op_Mul, _1, _3))
# 143 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : ArithExpr.arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : ArithExpr.arith_expr) in
    Obj.repr(
# 39 "test.mly"
                   (Op(Op_Div, _1, _3))
# 151 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : ArithExpr.arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : ArithExpr.arith_expr) in
    Obj.repr(
# 40 "test.mly"
                   (Op(Op_Mod, _1, _3))
# 159 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 44 "test.mly"
           (Value(int_of_string _1))
# 166 "test.ml"
               : ArithExpr.arith_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : ArithExpr.arith_expr) in
    Obj.repr(
# 45 "test.mly"
                     (_2)
# 173 "test.ml"
               : ArithExpr.arith_expr))
(* Entry line *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let line (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : ArithExpr.arith_expr)
;;
# 49 "test.mly"
(*trailer*)
# 200 "test.ml"
