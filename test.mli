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

val line :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> ArithExpr.arith_expr
