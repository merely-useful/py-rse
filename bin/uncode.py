#!/usr/bin/env python

'''
Remove code blocks from stdin and echo to stdout.
'''

import sys


def process(reader):
    echo = True
    for line in reader:
        if line.startswith('```') or line.startswith('~~~'):
            echo = not echo
        elif echo:
            sys.stdout.write(line)


if __name__ == '__main__':
    filenames = sys.argv[1:]
    if not filenames:
        process(sys.stdin)
    else:
        for f in filenames:
            with open(f) as reader:
                process(reader)
