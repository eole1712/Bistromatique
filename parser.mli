exception Error

type token = 
  | SUB
  | OBRACE
  | NUMBER of (string)
  | NEWLINE
  | MUL
  | MOD
  | DIV
  | CBRACE
  | ADD


val line: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithExpr.arith_expr)