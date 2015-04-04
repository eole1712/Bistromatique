rm -f *.cmo *.cmi
ocamlc -c arithExpr.mli
ocamlc -c arithExpr.ml
ocamlyacc test.mly
ocamlc -c test.mli
ocamllex lexer.mll
ocamlc -c lexer.ml
ocamlc -c test.ml
ocamlc -c main.ml
ocamlc -o test arithExpr.cmo test.cmo lexer.cmo main.cmo
