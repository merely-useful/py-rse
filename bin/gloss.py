#!/usr/bin/env python

'''
gloss.py gloss_file [source_file...]

Check that all of the terms used in the given source files are defined in the
glossary, and that all definitions are used.  If no source files are given,
reads from standard input (but links file must still be named).
'''


import sys
import re
from util import read_files, report


PAT_DEF = re.compile(r'^\*\*.+?\*\*<a\s+id="(.+?)"></a>', re.MULTILINE + re.DOTALL)
PAT_USE = re.compile(r'\[.+?\]\(glossary.html#(.+?)\)')


def main(links_file, source_files):
    '''Main driver.'''

    with open(links_file, 'r') as reader:
        defined = set(PAT_DEF.findall(reader.read()))
    used = read_files(source_files, find_uses)
    report('Terms: undefined', used - defined)
    report('Terms: unused', defined - used)


def find_uses(filename, reader):
    '''Find all glossary references.'''

    return set(PAT_USE.findall(reader.read()))


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: checklinks.py links_file [source_file...]', file=sys.stderr)
        sys.exit(1)
    main(sys.argv[1], sys.argv[2:])
