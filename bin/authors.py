#!/usr/bin/env python

import sys
from collections import Counter
import bibtexparser

def invert(author):
    if ' ' not in author:
        return author
    first, last = author.rsplit(' ', 1)
    return '{}, {}'.format(last, first)

filename = sys.argv[1]
text = open(filename).read()
bib = bibtexparser.loads(text).entries
authors = [b['author'].split(' and ') for b in bib if 'author' in b]
counts = Counter([invert(a) for group in authors for a in group])
for name in sorted(counts.keys()):
    print('{:2d}: {}'.format(counts[name], name))

