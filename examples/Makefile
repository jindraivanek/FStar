FSTAR_HOME=..
include Makefile.include

ALL_EXAMPLE_DIRS=\
bug-reports \
hello \
low-level \
data_structures \
algorithms \
crypto \
termination \
software_foundations \
../doc/tutorial/code/exercises \
../doc/tutorial/code/solutions \
rel \
maths \
paradoxes \
printf \
metatheory \
verifythis \
preorders \
dm4free \
incl \
micro-benchmarks \
bytes \
tactics

# WARNING: this target shouldn't depend on anything other than the F*
# binary; in particular it shouldn't depend on OCaml, F#, git, etc.
all: $(addsuffix .all, $(ALL_EXAMPLE_DIRS))

%.all: %
	+make -C $^ all

test: all

stdlib: $(addprefix ../lib/, FStar.List.fst FStar.String.fsti partialmap.fst FStar.ST.fst)
	mkdir -p ../cache
	$(FSTAR) $^ --serialize_mods

clean:
	rm ../cache/*.cache

wc:
	find . -name "*.fst" | grep -v -e to_be_ported | xargs sloccount
