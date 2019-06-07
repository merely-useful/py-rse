"""
The generate module contains routines for generating ideal and noisy
lists of counts that follow the Zipf distribution.
"""
from random import uniform
from . import RELATIVE_ERROR


def make_zipf(length):
    """Returns a list of counts that follows a Zipf distribution.

    Args:
        length: the number of counts to be generated

    Returns:
        A list of the provided length of floating point numbers corresponding
        exactly the zipf distribution.  For example, for length=5:

        [1.0, 0.5, 0.3333333333333333, 0.25, 0.2]

    Raises:
        AssertionError: raised if a zero or negative length is provided
    """
    assert length > 0, 'Zipf distribution must have at least one element'
    result = [1/(1 + i) for i in range(length)]
    return result


def make_noisy_zipf(length, rel=RELATIVE_ERROR):
    """Returns a list of counts that approximately follows a Zipf distribution.

    As with make_zipf, make_noisy_zipf returns a list of floating point
    numbers of the desired length, but one that only approximately follows
    the Zipf distribution, with a level of noise controlled by the relative
    error parameter rel.

    Args:
        length: the number of counts to be generated
        rel: the relative error tolerance used if provided; if not,
             the package default (zipfpy.RELATIVE_ERROR) is used.

    Returns:
        A list of the provided length of floating point numbers approximately
        following the zipf distribution.  If rel=0, gives the same results as
        make_zipf.

        For example, for length=5 and rel=0.0001, a possible result would be:
        [0.9999745067631108, 0.5000167385476086, 0.33332704376559663,
         0.2499875253921644, 0.20000910102806616]

    Raises:
        AssertionError: raised if a zero or negative length is provided
    """
    data = make_zipf(length)
    minnoise = 1.0 - rel/2
    maxnoise = 1.0 + rel/2
    for i in range(length):
        data[i] = data[i]*uniform(minnoise, maxnoise)
    return data
