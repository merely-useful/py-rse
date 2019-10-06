.PHONY: all clean

COUNT=bin/countwords.py
RESULTS=results/*.csv

# Regenerate all results.
all : ${RESULTS}

# Regenerate result for any book.
results/%.csv : data/%.txt ${COUNT}
	python ${COUNT} $< > $@

# Remove all generated files.
clean :
	rm -f results/*.csv
