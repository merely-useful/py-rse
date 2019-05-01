# Regenerate results for "Moby Dick"
results/moby_dick.csv : data/moby_dick.txt
	python bin/countwords.py data/moby_dick.txt > results/moby_dick.csv
