#!/usr/bin/env python

import sys
from collections import Counter
import bibtexparser

def author(raw):
    result = Counter()
    for group in [a.split(' and ') for a in raw.keys()]:
        for a in group:
            result[a] += 1
    return result

def show(title, fields):
    prefix = '  ' if title else ''
    if title:
        print(title)
    for f in sorted(fields.keys()):
        print('{}{}: {}'.format(prefix, f, fields[f]))

filename = sys.argv[1]
only = None
if len(sys.argv) > 2:
    only = sys.argv[2]

text = open(filename).read()
bib = bibtexparser.loads(text).entries
fields = {k: Counter() for k in set().union(*[set(b.keys()) for b in bib])}
for b in bib:
    for k in b:
        fields[k][b[k]] += 1
fields['author'] = author(fields['author'])

if only:
    show(None, fields[only])
else:
    for k in sorted(fields.keys()):
        show(k, fields[k])
