#!/usr/bin/env python

import sys
import csv
import argparse
from collections import Counter

import mymodule


def update_counts(reader, word_counts):
    """Update word counts with data from another reader/file."""

    for (word, count) in csv.reader(reader):
        word_counts[word] += int(count)


def main(args):
    """Run the command line program."""

    word_counts = Counter()
    for fn in args.infiles:
        with open(fn, 'r') as reader:
            update_counts(reader, word_counts)
    word_counts = mymodule.sort_counts(word_counts, args.sortby)    
    mymodule.report_results(sys.stdout, word_counts)


if __name__ == '__main__':

    description = 'Combine multiple word count files into a single cumulative count.'
    parser = argparse.ArgumentParser(description=description)

    parser.add_argument('infiles', type=str, nargs='*', help='Input file names')
    parser.add_argument('--sortby', type=str, choices=('count', 'alphabetical'),
                        default='count', help='Method for sorting results')

    args = parser.parse_args()
    main(args)