#!/usr/bin/env python
"""Count the occurences of all words in a text and write them to a CSV-file."""

import sys
import re
import argparse
from collections import Counter

import mymodule


def count_words(reader):
    """Count the occurrence of each word in a string."""

    text = reader.read()
    findwords = re.compile(r"\w+", re.IGNORECASE)
    word_list = re.findall(findwords, text)
    word_counts = Counter(word_list)

    return word_counts


def main(args):
    """Run the command line program."""

    if args.infile:
        with open(args.infile, 'r') as reader:
            word_counts = count_words(reader)
    else:
        # Read from stdin if no input file is given
        word_counts = count_words(sys.stdin)
    word_counts = mymodule.sort_counts(word_counts, args.sortby)
    mymodule.report_results(sys.stdout, word_counts)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--infile', type=str, default=None,
                        help='Input file name')
    parser.add_argument('--sortby', type=str, choices=('count', 'alphabetical'),
                        default='count', help='Method for sorting results')

    args = parser.parse_args()
    main(args)
