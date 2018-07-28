#!/usr/bin/env python

import sys
import re


DEF = re.compile(r'\*\*.+?\*\*{:#(g:.+?)}', re.DOTALL)
REF = re.compile(r'\[.+?\]\(#(g:.+?)\)', re.DOTALL)


def main(filenames):
    defs = set()
    refs = set()
    for path in filenames:
        with open(path, 'r') as reader:
            doc = reader.read()
            defs.update({d for d in DEF.findall(doc)})
            refs.update({r for r in REF.findall(doc)})
    report('missing', refs - defs)
    report('unused', defs - refs)


def report(title, items):
    if not items: return
    print(title)
    for i in sorted(items):
        print('  {}'.format(i))


if __name__ == '__main__':
    main(sys.argv[1:])
