#!/usr/bin/env python

'''
Show what the Python BibTeX parser produces.
'''

import sys
import bibtexparser

print(bibtexparser.loads(sys.stdin.read()).entries)
