#!/usr/bin/env python

import sys
import re
import argparse
import yaml
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib as mpl
from scipy.optimize import minimize_scalar


def nlog_likelihood(beta, counts):
    """Get maximum likelihood estimate (mle) for beta"""
    
    mle = - np.sum(np.log((1/counts)**(beta - 1) - (1/(counts + 1))**(beta - 1)))
    
    return mle


def get_power_law_params(word_counts):
    """Get the power law parameters.
    
    TODO: Explain what alpha and beta are.
    
    """
    
    mle = minimize_scalar(nlog_likelihood, bracket=(1, 4),
                          args=(word_counts), method='brent')
    beta = mle.x
    alpha = 1 / (beta - 1)
    
    return alpha, beta


def set_plot_params(param_file):
    """Set plot parameters."""
    
    if param_file:
        with open(param_file, 'r') as reader:
            param_dict = yaml.load(reader, Loader=yaml.BaseLoader)
    else:
        param_dict = {}

    for param, value in param_dict.items():
        mpl.rcParams[param] = value 
            
            
def plot_fit(xlim, max_rank, beta):
    """Fit a power law curve to the data.
    
    Args:
      xlim (sequence): x-axis bounds (min, max)(
      max_rank (int): maximum word frequency rank
      beta (float): beta parameter from the power law
    
    """

    xvals = np.arange(xlim[0], xlim[-1])
    yvals = max_rank * (xvals**(-beta + 1))
    plt.loglog(xvals, yvals, color='grey')
    

def main(args):
    """Run the command line program."""

    set_plot_params(args.params)
    input_csv = args.infile if args.infile else sys.stdin
    df = pd.read_csv(input_csv, header=None, names=('word', 'word frequency'))
    df['rank'] = df['word frequency'].rank(ascending=False)
    df.plot.scatter(x='word frequency', y='rank', loglog=True,
                    figsize=[12, 6], grid=True,
                    xlim=args.xlim, ylim=args.ylim)

    alpha, beta = get_power_law_params(df['word frequency'].values)
    print('alpha:', alpha)
    print('beta:', beta)
    plot_fit(args.xlim, df['rank'].values[-1], beta)

    plt.savefig(args.outfile)


if __name__ == '__main__':

    description = 'Plot word counts'
    parser = argparse.ArgumentParser(description=description)

    parser.add_argument('outfile', type=str, help='Output file (.png)')
    parser.add_argument('--infile', type=str, default=None,
                        help='Word count csv file')
    parser.add_argument('--xlim', type=float, nargs=2, default=[0.9, 1e4],
                        help='X-axis limits')
    parser.add_argument('--ylim', type=float, nargs=2, default=[0.9, 1e4],
                        help='Y-axis limits')
    parser.add_argument('--params', type=str, default=None,
                        help='Configuration file specifying plot parameters')

    args = parser.parse_args()
    main(args)
