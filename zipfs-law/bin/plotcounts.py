#!/usr/bin/env python

import sys
import re
import pdb
import argparse

import pandas as pd
import matplotlib.pyplot as plt


def main(args):
    """Run the command line program."""

    df = pd.read_csv(args.infile, header=None, names=('word', 'word frequency'))
    df['rank'] = df['word frequency'].rank(ascending=False)
    df.plot.scatter(x='word frequency', y='rank', loglog=True,
                    figsize=[12, 6], grid=True,
                    xlim=[0.9, 1e4], ylim=[0.9, 1e4])
    plt.savefig(args.outfile)


if __name__ == '__main__':

    description = 'Plot word counts'
    parser = argparse.ArgumentParser(description=description)

    parser.add_argument('infile', type=str, help='Word count file')
    parser.add_argument('outfile', type=str, help='Output file (.png)')

    args = parser.parse_args()
    main(args)
