#!/usr/bin/env python

import sys
import bibtexparser
from collections import Counter
import matplotlib.pyplot as plt

filename = sys.argv[1]
text = open(filename).read()
bib = bibtexparser.loads(text).entries
years = [int(e['year']) for e in bib]
counts = Counter(years)
keys = list(counts.keys())
for i in range(min(keys), max(keys)+1):
    counts[i] += 0
    print('{},{}'.format(i, counts[i]))

plt.hist(years, bins=1 + max(keys) - min(keys))
plt.title("Publications by Year")
plt.savefig('years.png')
