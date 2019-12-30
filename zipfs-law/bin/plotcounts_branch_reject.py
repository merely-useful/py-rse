#!/usr/bin/env python

import sys
import re
import argparse
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib as mpl


def main(args):
    """Run the command line program."""

    input_csv = args.infile if args.infile else sys.stdin
    df = pd.read_csv(input_csv, header=None, names=('word', 'word frequency'))
    df['rank'] = df['word frequency'].rank(ascending=False)
    df['1/rank'] = 1 / df['rank'] 
    df.plot.scatter(x='word frequency', y='1/rank',
                    figsize=[12, 6], grid=True)
    plt.savefig(args.outfile)


if __name__ == '__main__':

    description = 'Plot word counts'
    parser = argparse.ArgumentParser(description=description)

    parser.add_argument('outfile', type=str, help='Output file (.png)')
    parser.add_argument('--infile', type=str, default=None,
                        help='Word count csv file')

    args = parser.parse_args()
    main(args)
