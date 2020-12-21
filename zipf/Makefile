.PHONY: results all clean help settings

COUNT=bin/countwords.py
COLLATE=bin/collate.py
PARAMS=bin/plotparams.yml
PLOT=bin/plotcounts.py
SUMMARY=bin/book_summary.sh
DATA=$(wildcard data/*.txt)
RESULTS=$(patsubst data/%.txt,results/%.csv,$(DATA))

## all : regenerate all results.
all : results/collated.png

## test-saveconfig : save plot configuration.
test-saveconfig :
	python $(PLOT) --saveconfig /tmp/test-saveconfig.yml \
	  --plotparams $(PARAMS)

## results/collated.png : plot the collated results.
results/collated.png : results/collated.csv $(PARAMS)
	python $(PLOT) $< --outfile $@ --plotparams $(word 2,$^)

## results/collated.csv : collate all results.
results/collated.csv : $(RESULTS) $(COLLATE)
	@mkdir -p results
	python $(COLLATE) $(RESULTS) > $@

## results/%.csv : regenerate result for any book.
results/%.csv : data/%.txt $(COUNT)
	@bash $(SUMMARY) $< Title
	@bash $(SUMMARY) $< Author
	python $(COUNT) $< > $@

## results : regenerate result for all books.
results : ${RESULTS}

## clean : remove all generated files.
clean :
	rm $(RESULTS) results/collated.csv results/collated.png

## settings : show variables' values.
settings :
	@echo COUNT: $(COUNT)
	@echo DATA: $(DATA)
	@echo RESULTS: $(RESULTS)
	@echo COLLATE: $(COLLATE)
	@echo PARAMS: $(PARAMS)
	@echo PLOT: $(PLOT)
	@echo SUMMARY: $(SUMMARY)

## help : show this message.
help :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' \
	| column -t -s ':'
