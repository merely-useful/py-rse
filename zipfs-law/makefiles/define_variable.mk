.PHONY: clean

COUNT=bin/countwords.py

# Regenerate results for "Moby Dick"
results/moby_dick.csv : data/moby_dick.txt ${COUNT}
	python ${COUNT} data/moby_dick.txt > results/moby_dick.csv

# Regenerate results for "Jane Eyre"
results/jane_eyre.csv : data/jane_eyre.txt ${COUNT}
	python ${COUNT} data/jane_eyre.txt > results/jane_eyre.csv

# Remove all generated files.
clean :
	rm -f results/*.csv
