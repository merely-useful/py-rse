"""Combine multiple word count CSV-files into a single cumulative count."""
import sys
import csv
import argparse
from collections import Counter
import mymodule

def update_counts(reader, word_counts):
    """Update word counts with data from another reader/file."""
    for word, count in csv.reader(reader):
        word_counts[word] += int(count)

def main(args):
    """Run the command line program."""
    word_counts = Counter()
    for fn in args.infiles:
        with open(fn, 'r') as reader:
            update_counts(reader, word_counts)
    mymodule.collection_to_csv(word_counts, ntop=args.ntop)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('infiles', type=str, nargs='*', help='Input file names')
    parser.add_argument('-n', '--ntop', type=int, default=None,
                        help='Limit output to n most frequent words')
    args = parser.parse_args()
    main(args)