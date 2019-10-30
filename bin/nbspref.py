#!/usr/bin/env python

'''
Check that all \@ref() uses have a non-breaking space in front of them.
Usage: nbspref.py filenames...
'''


import sys
import re


REF_RE = re.compile(r'.\\@ref\(.+?\)')


def main(filenames):
    for f in filenames:
        with open(f, 'r') as reader:
            data = reader.read()
            for m in REF_RE.findall(data):
                if (not m.startswith(' ')):
                    print('{}: {}'.format(f, m))


if __name__ == '__main__':
    main(sys.argv[1:])
