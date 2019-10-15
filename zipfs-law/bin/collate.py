#!/usr/bin/env python

'''
Read one or more CSV files given as command-line arguments, or standard input if
no filenames are given, and produce a collated two-column CSV of words and
counts.
'''


import sys
import csv
from collections import Counter


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
    for (word, count) in csv.reader(reader):
        results[word] += int(count)


def report(writer, results):
    '''
    Report results to stream.
    '''
    writer = csv.writer(writer)
    for (key, value) in results.items():
        writer.writerow((key, value))


if __name__ == '__main__':
    main(sys.argv[1:])
