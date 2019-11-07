.PHONY: all clean help settings

COUNT=bin/countwords.py
DATA=$(wildcard data/*.txt)
RESULTS=$(patsubst data/%.txt,results/%.csv,${DATA})

## all : regenerate all results.
all : ${RESULTS}

## results/*.csv : regenerate result for any book.
results/%.csv : data/%.txt ${COUNT}
	python ${COUNT} $< > $@

## clean : remove all generated files.
clean :
	rm -f results/*.csv

## settings : show variables' values.
settings :
	@echo COUNT: ${COUNT}
	@echo DATA: ${DATA}
	@echo RESULTS: ${RESULTS}

## help : show this message.
help :
	@grep '^##' ${MAKEFILE_LIST}
