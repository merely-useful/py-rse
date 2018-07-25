#!/usr/bin/env python

import sys
import re
import bibtexparser

CITE = re.compile(r'\\cite(\[[^\]]+\])?{([^}]+)}')

def getCites(filename):
    with open(filename, 'r') as reader:
        split = [x[1].split(',') for x in CITE.findall(reader.read())]
        return [b for s in split for b in s]

sense, bibfile, texfiles = sys.argv[1], sys.argv[2], sys.argv[3:]
bib = set([b['ID'] for b in bibtexparser.loads(open(bibfile).read()).entries])
cites = [getCites(f) for f in texfiles]
cites = set([c for group in cites for c in group])
if sense == '--used':
    display = cites
elif sense == '--unused':
    display = bib - cites
elif sense == '--missing':
    display = cites - bib
print('\n'.join(sorted(display)))
