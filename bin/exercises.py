#!/usr/bin/env python

import sys
import os
import re


INPUT_PAT = re.compile(r'\\input{([^}]+)}')


def main(src_file):
    for filename in select_files(src_file):
        with open(filename, 'r') as reader:
            data = reader.read()
            if r'\section{Exercises}' not in data:
                continue
            num = data.count(r'\exercise{')
            print('{:2d} {}'.format(num, filename))


def select_files(src_file):
    src_dir = os.path.dirname(src_file)
    with open(src_file, 'r') as reader:
        lines = reader.readlines()
    matches = [INPUT_PAT.search(line) for line in lines]
    matches = [os.path.join(src_dir, m.group(1) + '.tex') for m in matches if m]
    return matches


if __name__ == '__main__':
    if len(sys.argv) != 2:
        sys.stderr.write('Usage: exercises file.tex')
        sys.exit(1)
    main(sys.argv[1])
