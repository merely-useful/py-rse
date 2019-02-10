#!/usr/bin/env python

'''
Get bodies of generated pages.
'''

import sys
import os
import re
from util import usage, get_toc


def get_all(config_file, source_dir):
    '''
    Get all lines from input files, inserting a few markers for post-processing.
    '''

    toc = get_toc(config_file)

    print('==frontmatter==\n')
    with open(os.path.join(source_dir, 'index.html')) as reader:
        get_main_div(reader)

    print('==mainmatter==\n')
    for filename in make_filenames(source_dir, toc['lessons']):
        with open(filename, 'r') as reader:
            get_main_div(reader)

    print('==midpoint==\n')
    for filename in make_filenames(source_dir, toc['extras']):
        with open(filename, 'r') as reader:
            get_main_div(reader)


def make_filenames(source_dir, slugs):
    '''Turn slugs into filenames.'''

    return [os.path.join(source_dir, s, 'index.html') for s in slugs]


def get_main_div(reader):
    '''Read main div from input.'''

    lines = reader.readlines()
    start = end = None
    for (i, line) in enumerate(lines):
        if '<!-- begin: main -->' in line:
            start = i
        elif '<!-- end: main -->' in line:
            end = i
            break
    sys.stdout.writelines(lines[start:end+1])


#-------------------------------------------------------------------------------

if __name__ == '__main__':
    if len(sys.argv) == 1:
        get_main_div(sys.stdin)
    elif len(sys.argv) == 3:
        get_all(sys.argv[1], sys.argv[2])
    else:
        usage('get_body.py [config_file source_dir]')
