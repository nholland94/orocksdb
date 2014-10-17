OCAML_VERSION ?= 4.02.1
PREFIX ?=~/.opam/$(OCAML_VERSION)

OCAML_LIBDIR ?= $(PREFIX)/lib/
OCAML_FIND ?= ocamlfind


build:
	ocamlbuild -use-ocamlfind -lflags -cclib,/usr/local/lib/librocksdb.so rocks_test.native rocks.inferred.mli rocks.cma rocks.cmxa rocks.cmxs

clean:
	ocamlbuild -clean

install:
	mkdir -p $(OCAML_LIBDIR)
	$(OCAML_FIND) install rocks -destdir $(OCAML_LIBDIR) META \
	 _build/rocks.a \
	 _build/rocks.cmi \
	 _build/rocks.cmxa \
	 _build/rocks.cmxs

uninstall:
	$(OCAML_FIND) remove rocks -destdir $(OCAML_LIBDIR)
