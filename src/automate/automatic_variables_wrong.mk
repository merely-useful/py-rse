.PHONY: all clean

COUNT=bin/countwords.py

# Regenerate all results.
all : results/moby_dick.csv results/jane_eyre.csv

# Regenerate results for "Moby Dick"
results/moby_dick.csv : data/moby_dick.txt
	python ${COUNT} data/moby_dick.txt > $@

# Regenerate results for "Jane Eyre"
results/jane_eyre.csv : data/jane_eyre.txt
	python ${COUNT} $^ > $@

# Regenerate results for "The Time Machine"
results/time_machine.csv : data/time_machine.txt ${COUNT}
	python ${COUNT} $^ > $@

# Remove all generated files.
clean :
	rm -f results/*.csv
