#!/usr/bin/env python
"""Plot word counts."""

import sys
import argparse
import yaml
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib as mpl
from scipy.optimize import minimize_scalar


def nlog_likelihood(beta, counts):
    """Log-likelihood function."""
    likelihood = - np.sum(np.log((1/counts)**(beta - 1) - (1/(counts + 1))**(beta - 1)))

    return likelihood


def get_power_law_params(word_counts):
    """
    Get the power law parameters.

    References
    ----------
    Moreno-Sanchez et al (2016) define alpha (Eq. 1),
      beta (Eq. 2) and the maximum likelihood estimation (mle)
      of beta (Eq. 6).

    Moreno-Sanchez I, Font-Clos F, Corral A (2016)
      Large-Scale Analysis of Zipf’s Law in English Texts.
      PLoS ONE 11(1): e0147073.
      https://doi.org/10.1371/journal.pone.0147073
    """
    mle = minimize_scalar(nlog_likelihood, bracket=(1, 4),
                          args=(word_counts), method='brent')
    beta = mle.x
    alpha = 1 / (beta - 1)

    return alpha, beta


def set_plot_params(param_file):
    """Set the matplotlib rc parameters."""
    if param_file:
        with open(param_file, 'r') as reader:
            param_dict = yaml.load(reader, Loader=yaml.BaseLoader)
    else:
        param_dict = {}

    for param, value in param_dict.items():
        mpl.rcParams[param] = value


def plot_fit(xlim, max_rank, beta):
    """
    Plot the power law curve that was fitted to the data.

    Parameters
    ----------
    xlim : array-like
        Bounds for x-axis (min, max).
    max_rank : int
        Maximum word frequency rank.
    beta : float
        Estimated beta parameter for the power law.
    """
    xvals = np.arange(xlim[0], xlim[-1])
    yvals = max_rank * (xvals**(-beta + 1))
    plt.loglog(xvals, yvals, color='grey')


def main(args):
    """Run the command line program."""
    set_plot_params(args.rcparams)
    input_csv = args.infile if args.infile else sys.stdin
    df = pd.read_csv(input_csv, header=None, names=('word', 'word_frequency'))
    df['rank'] = df['word_frequency'].rank(ascending=False)
    df.plot.scatter(x='word_frequency', y='rank', loglog=True,
                    figsize=[12, 6], grid=True,
                    xlim=args.xlim, ylim=args.ylim)

    alpha, beta = get_power_law_params(df['word_frequency'].to_numpy())
    print('alpha:', alpha)
    print('beta:', beta)
    # Since the ranks are already sorted, we can take the last one instead of
    # asking Python to find the highest rank.
    plot_fit(args.xlim, df['rank'].to_numpy()[-1], beta)

    plt.savefig(args.outfile)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('outfile', type=str, help='Output image file')
    parser.add_argument('--infile', type=str, default=None,
                        help='Word count csv file')
    parser.add_argument('--xlim', type=float, nargs=2, default=[0.9, 1e4],
                        help='X-axis limits')
    parser.add_argument('--ylim', type=float, nargs=2, default=[0.9, 1e4],
                        help='Y-axis limits')
    parser.add_argument('--rcparams', type=str, default=None,
                        help='Configuration file for plot parameters (matplotlib rc parameters)')

    args = parser.parse_args()
    main(args)
