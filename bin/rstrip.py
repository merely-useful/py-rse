#!/usr/bin/env python

'''
Strip trailing whitespaces from lines.
Usage: rstrip.py file file...
'''


import sys


def main(filenames):
    for f in filenames:
        with open(f, 'r') as reader:
            lines = reader.readlines()
        lines = [x.rstrip() + '\n' for x in lines]
        with open(f, 'w') as writer:
            writer.writelines(lines)


if __name__ == '__main__':
    main(sys.argv[1:])
