##
## Makefile for  in /home/ghukas_g/rendu/ocaml_bistro
##
## Made by Grisha GHUKASYAN
## Login   <ghukas_g@epitech.net>
##
## Started on  Thu Apr  2 18:06:52 2015 Grisha GHUKASYAN
## Last update Sun Apr  5 15:44:41 2015 Grisha GHUKASYAN
##

NAME = bistro

ML =	bigint.ml arithExpr.ml parser.ml lexer.ml main.ml

MLI =	bigint.mli arithExpr.mli parser.mli

MLY =	parser.mly

MLL =	lexer.mll

LIB =	str.cma

CMI = $(MLI:.mli=.cmi)
CMO = $(ML:.ml=.cmo)
CMX = $(ML:.ml=.cmx)
OBJ = $(ML:.ml=.o)
OMLY = $(MLY:.mly=.ml)
OMLL = $(MLL:.mll=.ml)

OCAMLDPE = ocamldep
CAMLFLAGS = -w Aelz -warn-error A
OCAMLC = ocamlc $(CAMLFLAGS)
OCAMLOPT = ocamlopt $(CAMLFLAGS)
OCAMLDOC = ocamldoc -html -d $(ROOT)/doc
MENHIR = menhir
OCAMLLEX = ocamllex

all:		.depend $(OMLY) $(OMLL) $(CMI) $(NAME)

byte:		.depend $(OMLY) $(OMLL) $(CMI) $(NAME).byte

$(NAME):	$(CMX)
		$(OCAMLOPT) -o $@ $(LIB:.cma=.cmxa) $(CMX)

$(NAME).byte:	$(CMO)
		$(OCAMLC) -o $@ $(LIB) $(CMO)

%.ml:		%.mly
		$(MENHIR) $<

%.ml:		%.mll
		$(OCAMLLEX) $<

%.cmx:		%.ml
		$(OCAMLOPT) -c $<

%.cmo:		%.ml
		$(OCAMLC) -c $<

%.cmi:		%.mli
		$(OCAMLC) -c $<

documentation:  $(CMI)
		$(OCAMLDOC) $(MLI)


re:		fclean all


clean:
		rm -f *.cmi $(CMO) $(CMX) $(OBJ) $(OMLY) $(OMLL) .depend


fclean: 	clean
		rm -f $(NAME) $(NAME).byte


.depend:
		rm -f .depend
		$(OCAMLDPE) $(MLI) $(ML) > .depend
