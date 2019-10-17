#!/usr/bin/env python

'''
images.py figures_dir [source_file...]

Check that all of the images used in the given source files are present and that
all images are used.  If no source files are given, reads from standard input
(but image directory must still be named).
'''

import sys
import os
import glob
import re
from util import read_all_files, report


SUFFIXES = ('jpg', 'pdf', 'png', 'svg')


PAT_USE = re.compile(r'knitr::include_graphics\("(.+?)"\)')


def main(links_dir, source_files):
    '''Main driver.'''

    defined = set()
    for suffix in SUFFIXES:
        defined.update(set(os.path.normpath(p) for p in glob.glob(f'{links_dir}/**/*.{suffix}', recursive=True)))
    used = read_all_files(source_files, find_uses)
    report('Links: undefined', used - defined)
    report('Links: unused', defined - used)


def find_uses(filename, reader):
    '''Find all link uses in input stream.'''

    return set(PAT_USE.findall(reader.read()))


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: images.py links_file [source_file...]', file=sys.stderr)
        sys.exit(1)
    main(sys.argv[1], sys.argv[2:])
