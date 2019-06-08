#!/usr/bin/env python

'''
links.py links_file [source_file...]

Check that all of the links used in the given source files are defined in the
links file, and that all defined links are used.  If no source files are given,
reads from standard input (but links file must still be named).
'''


import sys
import re
from util import read_files, report


PAT_DEF = re.compile(r'^\[(.+?)\]:', re.MULTILINE + re.DOTALL)
PAT_USE = re.compile(r'\[.+?\]\[(.+?)\]')


def main(links_file, source_files):
    '''Main driver.'''

    with open(links_file, 'r') as reader:
        defined = set(PAT_DEF.findall(reader.read()))
    used = read_files(source_files, find_uses)
    report('Links: undefined', used - defined)
    report('Links: unused', defined - used)


def find_uses(filename, reader):
    '''Find all link uses in input stream.'''

    return set(PAT_USE.findall(reader.read()))


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: checklinks.py links_file [source_file...]', file=sys.stderr)
        sys.exit(1)
    main(sys.argv[1], sys.argv[2:])
