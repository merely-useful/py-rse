#!/usr/bin/env python

'''
captions.py source_file [source_file...]

Check the captions of figures.
'''

import sys
import re
from util import read_all_files


PAT_USE = re.compile(r'fig.cap="(.+?)"')


def main(source_files):
    '''Main driver.'''

    captions = read_all_files(source_files, find_captions)
    captions = [c for c in captions if not c.endswith('.')]
    if captions:
        for c in captions:
            print(c)


def find_captions(filename, reader):
    '''Find all link uses in input stream.'''

    return set(PAT_USE.findall(reader.read()))


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: captions.py source_file [source_file...]', file=sys.stderr)
        sys.exit(1)
    main(sys.argv[1:])
