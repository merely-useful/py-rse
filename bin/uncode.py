#!/usr/bin/env python

'''
Remove code blocks from stdin and echo to stdout.
'''

import sys
from util import uncode


def process(reader):
    lines = reader.readlines()
    lines = uncode(lines)
    sys.stdout.writelines(lines)


if __name__ == '__main__':
    filenames = sys.argv[1:]
    if not filenames:
        process(sys.stdin)
    else:
        for f in filenames:
            with open(f) as reader:
                process(reader)
