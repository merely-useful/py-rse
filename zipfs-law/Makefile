.PHONY: all clean help settings

COUNT=bin/countwords.py
RUN_COUNT=python $(COUNT)
COLLATE=bin/collate.py
RUN_COLLATE=python $(COLLATE)
PLOT=bin/plotcounts.py
RUN_PLOT=python $(PLOT)

DATA=$(wildcard data/*.txt)
RESULTS=$(patsubst data/%.txt,results/%.csv,$(DATA))

## all : regenerate all results.
all : results/plotcounts.png

	$(RUN_PLOT) $^ $@
## results/plotcounts.png: plot the collated results.
results/plotcounts.png : results/collated.csv

## results/collated.csv : collate all results.
results/collated.csv : $(RESULTS) $(COLLATE)
	@mkdir -p results
	$(RUN_COLLATE) $(RESULTS) > $@

## results/%.csv : regenerate result for any book.
results/%.csv : data/%.txt $(COUNT)
	@mkdir -p results
	$(RUN_COUNT) $< > $@

## clean : remove all generated files.
clean :
	rm -f results/*.csv

## settings : show variables' values.
settings :
	@echo COUNT: $(COUNT)
	@echo COLLATE: $(COLLATE)
	@echo PLOT: $(PLOT)
	@echo DATA: $(DATA)
	@echo RESULTS: $(RESULTS)

## help : show this message.
help :
	@grep '^##' ./Makefile
