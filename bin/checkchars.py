#!/usr/bin/env python

import sys


def main(filenames):
    if not filenames:
        check('--', sys.stdin)
    else:
        for f in filenames:
            with open(f, 'r') as reader:
                check(f, reader)


def check(filename, reader):
    for (i, line) in enumerate(reader):
        for (j, char) in enumerate(line):
            if ord(char) > 127:
                print('{0} {1} {2}: {3}'.format(filename, i+1, j+1, line.rstrip()))
                break


if __name__ == '__main__':
    main(sys.argv[1:])
