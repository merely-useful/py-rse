#!/usr/bin/env python

'''Check that all entries in the bibliography are used.'''

import sys
import re
from util import read_all_files, report


BIB_KEY = re.compile('^@\w+\{(\w+),')
BIB_REF = re.compile('@(\w+)', re.DOTALL + re.MULTILINE)
FALSE_POSITIVES = {'ref'}


def main():
    '''Main driver.'''
    bib_file, chapters = sys.argv[1], sys.argv[2:]
    defined = get_keys(bib_file)
    used = read_all_files(chapters, get_references, True)
    report('Defined but not used', defined - used)
    report('Used but not defined', used - defined)


def get_keys(filename):
    '''Get bibliography keys from .bib file.'''

    with open(filename, 'r') as reader:
        lines = reader.readlines()
        matches = [BIB_KEY.search(x) for x in lines]
        matches = [x.group(1) for x in matches if x]
        return set(matches)


def get_references(name, reader):
    '''Get bibliography references.'''

    return set(BIB_REF.findall(reader.read())) - FALSE_POSITIVES


if __name__ == '__main__':
    main()
