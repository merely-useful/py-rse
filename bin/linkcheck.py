#!/usr/bin/env python

'''
linkcheck.py links_file source_file [source_file...]

Check the links in the given files (all defined, all used).
'''


import sys
import re
from util import read_all_files, report


def main(links_file, source_files):
    '''Main driver.'''

    link_def = get_defined_links(links_file)
    link_used = read_all_files(source_files, find_uses, remove_code=False)
    report('Undefined links', link_used - link_def)
    report('Unused links', link_def - link_used)


def get_defined_links(links_file):
    '''Get aliases of all defined links.'''
    pat = re.compile(r'^\[(.+?)\]:', re.MULTILINE + re.DOTALL)
    with open(links_file, 'r') as reader:
        return set(pat.findall(reader.read()))


LINK_USE_PAT = re.compile(r'\[.+?\]\[(.+?)\]')
def find_uses(filename, reader):
    '''Find all link uses in input stream.'''

    return set(LINK_USE_PAT.findall(reader.read()))


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print('Usage: linkcheck.py links_file source_file [source_file...]', file=sys.stderr)
        sys.exit(1)
    main(sys.argv[1], sys.argv[2:])
