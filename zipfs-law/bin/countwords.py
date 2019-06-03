#!/usr/bin/env python

'''
Read one or more text files given as command-line arguments, or standard input
if no filenames are given, and produce a two-column CSV of words and counts.
'''


import sys
import re
import csv
from collections import Counter


PUNC = re.compile(r'",;.')
WORD = re.compile(r'\b[_\'\(]*(.+?)[_\'\)]*\b')


def main(filenames):
    '''
    Read standard input or one or more files and report results.
    '''
    results = Counter()
    if not filenames:
        process(sys.stdin, results)
    else:
        for fn in filenames:
            with open(fn, 'r') as reader:
                process(reader, results)
    report(sys.stdout, results)


def process(reader, results):
    '''
    Extract and count words from stream.
    '''
    raw = reader.read()
    cooked = PUNC.sub('', raw)
    words = WORD.findall(cooked)
    results.update(words)


def report(writer, results):
    '''
    Report results to stream.
    '''
    writer = csv.writer(writer)
    for (key, value) in results.items():
        writer.writerow((key, value))


if __name__ == '__main__':
    main(sys.argv[1:])

