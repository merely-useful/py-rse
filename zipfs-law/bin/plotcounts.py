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


def plot_fit(curve_xmin, curve_xmax, max_rank, beta, ax):
    """
    Plot the power law curve that was fitted to the data.

    Parameters
    ----------
    curve_xmin : float
        Minimum x-bound for fitted curve
    curve_xmax : float
        Maximum x-bound for fitted curve
    max_rank : int
        Maximum word frequency rank.
    beta : float
        Estimated beta parameter for the power law.
    ax : matplotlib axes
        Scatter plot to which the power curve will be added.
    """
    xvals = np.arange(curve_xmin, curve_xmax)
    yvals = max_rank * (xvals**(-beta + 1))
    ax.loglog(xvals, yvals, color='grey')


def main(args):
    """Run the command line program."""
    set_plot_params(args.rcparams)
    df = pd.read_csv(args.infile, header=None, names=('word', 'word_frequency'))
    df['rank'] = df['word_frequency'].rank(ascending=False)
    ax = df.plot.scatter(x='word_frequency', y='rank', loglog=True,
                         figsize=[12, 6], grid=True, xlim=args.xlim)

    alpha, beta = get_power_law_params(df['word_frequency'].to_numpy())
    print('alpha:', alpha)
    print('beta:', beta)
    # Since the ranks are already sorted, we can take the last one instead of
    # computing which row has the highest rank
    max_rank = df['rank'].to_numpy()[-1]
    # Use the range of the data as the boundaries when drawing the power law curve
    curve_xmin = df['word_frequency'].min()
    curve_xmax = df['word_frequency'].max()

    plot_fit(curve_xmin, curve_xmax, max_rank, beta, ax)
    ax.figure.savefig(args.outfile)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('infile', type=str, default=sys.stdin, nargs='?',
                        help='Word count csv file name')
    parser.add_argument('--outfile', type=str, default='results/plotcounts.png',
                        help='Output image file name')
    parser.add_argument('--xlim', type=float, nargs=2, default=None, metavar=('XMIN', 'XMAX'),
                        help='X-axis limits')
    parser.add_argument('--rcparams', type=str, default=None,
                        help='Configuration file for plot parameters (matplotlib rc parameters)')

    args = parser.parse_args()
    main(args)
