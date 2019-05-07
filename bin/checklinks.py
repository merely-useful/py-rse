#!/usr/bin/env python

'''
checklinks.py links_file [source_file...]

Check that all of the links used in the given source files are defined in the
links file, and that all defined links are used.  If no source files are given,
reads from standard input (but links file must still be named).
'''


import sys
import re
from util import report


PAT_DEF = re.compile(r'^\[(.+?)\]:', re.MULTILINE + re.DOTALL)
PAT_USE = re.compile(r'\[.+?\]\[(.+?)\]')


def main(links_file, source_files):
    '''Main driver.'''

    with open(links_file, 'r') as reader:
        defined = set(PAT_DEF.findall(reader.read()))

    if not source_files:
        used = set(PAT_USE.findall(sys.stdin.read()))
    else:
        used = set()
        for filename in source_files:
            with open(filename, 'r') as reader:
                used |= set(PAT_USE.findall(reader.read()))

    report('Links: undefined', used - defined)
    report('Links: unused   ', defined - used)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: checklinks.py links_file [source_file...]', file=sys.stderr)
        sys.exit(1)
    main(sys.argv[1], sys.argv[2:])
