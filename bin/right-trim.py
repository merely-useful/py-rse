#!/usr/bin/env python

import sys


def main():
    for filename in sys.argv[1:]:
        with open(filename, 'r') as reader:
            lines = reader.readlines()
        lines = [x.rstrip() for x in lines]
        with open(filename, 'w') as writer:
            for line in lines:
                print(line, file=writer)


if __name__ == '__main__':
    main()
