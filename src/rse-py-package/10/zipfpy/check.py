"""
The check module contains routines for testing whether a list of counts
represents data that follows Zipf's law.
"""
from pytest import approx
from .generate import make_zipf
from . import RELATIVE_ERROR


def is_zipf(hist, rel=RELATIVE_ERROR):
    """Tests if a histogram of counts follows a Zipf distribution.

    Given a list of counts as hist, assumed sorted in decreasing order,
    and a relative error tolerance (if not provided, the default value
    zipfpy.RELATIVE_ERROR is used), tests to see if the counts follow
    a Zipf distribution.

    Args:
        hist: an list or other iterable containing a list of numeric counts
        rel: the relative error tolerance used if provided; if not,
             the package default is used.

    Returns:
        True if the list of counts follows a zipf distribution within
        the relative tolerance.  False otherwise.

    Raises:
        AssertionError: raised if an empty list is passed.
    """
    assert len(hist) > 0, 'Cannot test Zipfiness without data'
    scaled = [h/hist[0] for h in hist]
    perfect = make_zipf(len(hist))
    return scaled == approx(perfect, rel=rel)


def is_unsorted_zipf(hist, rel=RELATIVE_ERROR):
    """Tests if a histogram of counts follows a Zipf distribution.

    Given a list of counts as hist, making no assumptions about sorting,
    and a relative error tolerance (if not provided, the default value
    zipfpy.RELATIVE_ERROR is used), tests to see if the counts follow
    a Zipf distribution.

    Args:
        hist: an list or other iterable containing a list of numeric counts
        rel: the relative error tolerance used if provided; if not,
             the package default is used.

    Returns:
        True if the list of counts follows a zipf distribution within
        the relative tolerance.  False otherwise.

    Raises:
        AssertionError: raised if an empty list is passed.
    """
    sortedhist = sorted(hist)
    return is_zipf(sortedhist)
