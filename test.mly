%{
    open ArithExpr
%}


%token <string> NUMBER
%token ADD
%token SUB
%token DIV
%token MUL
%token MOD
%token OBRACE
%token CBRACE
%token NEWLINE

%start line

%type <ArithExpr.arith_expr> line
%type <ArithExpr.arith_expr> exp
%type <ArithExpr.arith_expr> term
%type <ArithExpr.arith_expr> factor
%%


line:
  |exp NEWLINE {begin print_endline ("[" ^ (ArithExpr.string_of_arith_expr $1) ^"]"); $1 end}
  |NEWLINE {Value(0)}
;

exp:
  |term                 {$1}
  |exp SUB term		{Op(Op_Sub, $1, $3)}
  |exp ADD term		{Op(Op_Add, $1, $3)}
;

term:
  |factor		{$1}
  |term MUL factor	{Op(Op_Mul, $1, $3)}
  |term DIV factor	{Op(Op_Div, $1, $3)}
  |term MOD factor	{Op(Op_Mod, $1, $3)}
;

factor:
  |NUMBER		{Value(int_of_string $1)}
  |OBRACE exp CBRACE	{$2}
;

%%
(*trailer*)
