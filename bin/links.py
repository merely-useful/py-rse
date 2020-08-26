#!/usr/bin/env python

'''
links.py links_file gloss_file source_file [source_file...]

Check the links and glossary entries in the given files (all defined, all used).
'''


import sys
import re
from util import read_all_files, report


def main(links_file, gloss_file, source_files):
    '''Main driver.'''

    link_def = get_defined_links(links_file)
    used = read_all_files(source_files, find_uses, remove_code=False)
    report('Undefined Links', used - link_def)

    gloss_crossref = get_gloss_crossref(links_file)
    gloss_def = get_defined_gloss(gloss_file)
    report('Undefined glossary', gloss_crossref - gloss_def)


def get_defined_links(links_file):
    '''Get aliases of all defined links.'''
    pat = re.compile(r'^\[(.+?)\]:', re.MULTILINE + re.DOTALL)
    with open(links_file, 'r') as reader:
        return set(pat.findall(reader.read()))


LINK_USE_PAT = re.compile(r'\[.+?\]\[(.+?)\]')
def find_uses(filename, reader):
    '''Find all link uses in input stream.'''

    return set(LINK_USE_PAT.findall(reader.read()))


def get_gloss_crossref(links_file):
    '''Get all links that map to glossary entries.'''
    pat = re.compile(r'^\[.+?\]:\s+glossary.html#(.+)$', re.MULTILINE)
    with open(links_file, 'r') as reader:
        return set(pat.findall(reader.read()))


def get_defined_gloss(gloss_file):
    '''Get all glossary entry anchors.'''
    pat = re.compile(r'<a\s+id="(.+?)"></a>')
    with open(gloss_file, 'r') as reader:
        return set(pat.findall(reader.read()))


if __name__ == '__main__':
    if len(sys.argv) < 4:
        print('Usage: links.py links_file gloss_file source_file [source_file...]', file=sys.stderr)
        sys.exit(1)
    main(sys.argv[1], sys.argv[2], sys.argv[3:])
