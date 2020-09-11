#!/usr/bin/env python

'''
glosscheck.py gloss_file source_file [source_file...]

Check the glossary entries in the given files (all defined, all used).
'''


import sys
import re
from util import read_all_files, report


def main(gloss_file, source_files):
    '''Main driver.'''

    term_def = get_defined_terms(gloss_file)
    term_used = read_all_files(source_files, find_uses, remove_code=False)
    report('Undefined terms', term_used - term_def)
    report('Unused links', term_def - term_used)


def get_defined_terms(gloss_file):
    '''Get IDs of all defined glossary entries.'''
    pat = re.compile(r'<a\s+id="(.+?)">', re.MULTILINE + re.DOTALL)
    with open(gloss_file, 'r') as reader:
        return set(pat.findall(reader.read()))


LINK_USE_PAT = re.compile(r'\\gref\{.+?\}\{(.+?)\}')
def find_uses(filename, reader):
    '''Find all link uses in input stream.'''

    return set(LINK_USE_PAT.findall(reader.read()))


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print('Usage: glosscheck.py gloss_file source_file [source_file...]', file=sys.stderr)
        sys.exit(1)
    main(sys.argv[1], sys.argv[2:])
