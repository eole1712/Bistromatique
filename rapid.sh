rm -f *.cmo *.cmi
ocamlc -c bigint.mli
ocamlc -c bigint.ml
ocamlc -c arithExpr.mli
ocamlc -c arithExpr.ml
menhir parser.mly
ocamlc -c parser.mli
ocamllex lexer.mll
ocamlc -c lexer.ml
ocamlc -c parser.ml
ocamlc -c main.ml
ocamlc -o test str.cma bigint.cmo arithExpr.cmo parser.cmo lexer.cmo main.cmo
