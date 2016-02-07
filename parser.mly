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
%type <ArithExpr.arith_expr> p0
%type <ArithExpr.arith_expr> p1
%type <ArithExpr.arith_expr> p2
%%


line:
  |p0 NEWLINE {$1}
  |NEWLINE {Value(Bigint.bigint_of_string "0")}
;

p0:
  |p1	                {$1}
  |p0 SUB p1		{Op(Op_Sub, $1, $3)}
  |p0 ADD p1		{Op(Op_Add, $1, $3)}
;

p1:
  |p2			{$1}
  |p1 MUL p2		{Op(Op_Mul, $1, $3)}
  |p1 DIV p2		{Op(Op_Div, $1, $3)}
  |p1 MOD p2		{Op(Op_Mod, $1, $3)}
;

p2:
  |NUMBER		{Value(Bigint.bigint_of_string $1)}
  |OBRACE p0 CBRACE	{$2}
;

%%
(*trailer*)
