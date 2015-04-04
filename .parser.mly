(*header*)
%{
open Bigint
%}
(*declaration*)

%token <string> NUMBER
%token ADD
%token SUB
%token DIV
%token MUL
%token MOD
%token OBRACE
%token CBRACE
%token NEWLINE

%start input
%type <unit> input
%type <unit> line
%type <Bigint> exp
%%
(*rules*)

input:
  | {}
  | input line {}
;

line:
  |NEWLINE {}
  |exp NEWLINE {print_string Bigint.string_of_bigint $1}
;

exp:
  |term			{$$ = $1}
  |exp SUB term		{$$ = Bigint.sub $1 $3}
  |exp ADD term		{$$ = Bigint.add $1 $3}

term:
  |factor		{$$ = $1}
  |term MUL factor	{$$ = Bigint.mul $1 $3}
  |term DIV factor	{$$ = Bigint.div $1 $3}
  |term MOD factor	{$$ = Bigint.mod $1 $3}

factor:
  |NUMBER		{$$ = Bigint.bigint_of_string $1}
  |OBRACE exp CBRACE	{$$ = $2}

%%
(*trailer*)
