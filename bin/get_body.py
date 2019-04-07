#!/usr/bin/env python

'''
Get bodies of generated pages.
'''

import sys
import os
import re
from util import get_main_div, usage, get_toc


def get_all(source_dir):
    '''
    Get all lines from input files, inserting a few markers for post-processing.
    '''

    toc = get_toc()

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

    return [os.path.join(source_dir, '{}.html'.format(s)) for s in slugs]


#-------------------------------------------------------------------------------

if __name__ == '__main__':
    if len(sys.argv) == 1:
        get_main_div(sys.stdin)
    elif len(sys.argv) == 2:
        get_all(sys.argv[1])
    else:
        usage('get_body.py [source_dir]')
