#!/usr/bin/env python

'''
Check cross-references.
Usage: bin/crossrefs.py title file file file
'''

import sys
import re
from util import report

HEADING = re.compile(r'^#+\s*.+\{#(.+)\}', re.MULTILINE)
REF = re.compile(r'\\@ref\((.+?)\)')
FIGURE = re.compile(r'```\{r\s+([^,]+),.+fig\.cap=".+"\}')


def main(title, filenames):
    text = [open(f, 'r').read() for f in filenames]
    headings = set([x for sublist in text for x in HEADING.findall(sublist)])
    figures = set(['fig:{}'.format(x) for sublist in text for x in FIGURE.findall(sublist)])
    refs = set([r for sublist in text for r in REF.findall(sublist)])
    report('{}: used but not defined'.format(title), refs - (headings | figures))


if __name__ == '__main__':
    assert len(sys.argv) > 2, 'Need title and filenames'
    main(sys.argv[1], sys.argv[2:])
