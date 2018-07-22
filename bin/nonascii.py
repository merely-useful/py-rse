#!/usr/bin/env python

import sys

def check(filename, reader):
    for (i, line) in enumerate(reader):
        for (j, char) in enumerate(line):
            if ord(char) > 127:
                print('{0} {1} {2}: {3}'.format(filename, i+1, j+1, line.rstrip()))
                break

if len(sys.argv) == 1:
    check('--', sys.stdin)
else:
    for filename in sys.argv[1:]:
        reader = open(filename, 'r')
        check(filename, reader)
        reader.close()
