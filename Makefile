##
## Makefile for  in /home/ghukas_g/rendu/ocaml_bistro
##
## Made by Grisha GHUKASYAN
## Login   <ghukas_g@epitech.net>
##
## Started on  Thu Apr  2 18:06:52 2015 Grisha GHUKASYAN
## Last update Thu Apr  2 18:50:36 2015 Grisha GHUKASYAN
##

NAME = bistro

ML =	bigint.ml

MLI =	bigint.mli

LIB =	str.cma

CMI = $(MLI:.mli=.cmi)
CMO = $(ML:.ml=.cmo)
CMX = $(ML:.ml=.cmx)

OCAMLDPE = ocamldep
CAMLFLAGS = -w Aelz -warn-error A
OCAMLC = ocamlc $(CAMLFLAGS)
OCAMLOPT = ocamlopt $(CAMLFLAGS)
OCAMLDOC = ocamldoc -html -d $(ROOT)/doc


all:		.depend $(CMI) $(NAME)

byte:		.depend $(CMI) $(NAME).byte

$(NAME):	$(CMX)
		$(OCAMLOPT) -o $@ $(LIB:.cma=.cmxa) $(CMX)

$(NAME).byte:	$(CMO)
		$(OCAMLC) -o $@ $(LIB) $(CMO)

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
		rm -f *.cm* *.o .depend *~


fclean: 	clean
		rm -f $(NAME) $(NAME).byte


.depend:
		rm -f .depend
		$(OCAMLDPE) $(MLI) $(ML) > .depend
