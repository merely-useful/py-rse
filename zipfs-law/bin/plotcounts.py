#!/usr/bin/env python

import sys
import re
import argparse
import yaml
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib as mpl


def set_plot_params(config_file):
    """Set plot parameters."""
    
    if config_file:
        with open(config_file, 'r') as reader:
            config = yaml.load(reader)
    else:
        config = {}

    mpl.rcParams['axes.labelsize'] = config['axes.labelsize'] if 'axes.labelsize' in config else 'large'
    mpl.rcParams['xtick.labelsize'] = config['xtick.labelsize'] if 'xtick.labelsize' in config else 'medium'
    mpl.rcParams['ytick.labelsize'] = config['ytick.labelsize'] if 'ytick.labelsize' in config else 'medium'
            

def main(args):
    """Run the command line program."""

    set_plot_params(args.config_file)
    input_csv = args.infile if args.infile else sys.stdin
    df = pd.read_csv(input_csv, header=None, names=('word', 'word frequency'))
    df['rank'] = df['word frequency'].rank(ascending=False)
    df.plot.scatter(x='word frequency', y='rank', loglog=True,
                    figsize=[12, 6], grid=True,
                    xlim=args.xlim, ylim=args.ylim)
    plt.savefig(args.outfile)


if __name__ == '__main__':

    description = 'Plot word counts'
    parser = argparse.ArgumentParser(description=description)

    parser.add_argument('outfile', type=str, help='Output file (.png)')
    parser.add_argument('--infile', type=str, default=None,
                        help='Word count file')
    parser.add_argument('--xlim', type=float, nargs=2, default=[0.9, 1e4],
                        help='X-axis limits')
    parser.add_argument('--ylim', type=float, nargs=2, default=[0.9, 1e4],
                        help='Y-axis limits')
    parser.add_argument('--config_file', type=str, default=None,
                        help='Configuration file name')

    args = parser.parse_args()
    main(args)
