"""
Collection of commonly used functions.

Functions
---------
report_results
    report results to stream
"""
import sys
import csv

def report_results(results, top_n=None):
    """
    Report results to stream.
    
    Parameters
    ----------
    results : collections.Counter
        Collection of counts to write to standard output
    top_n : int
        Limit output to n most frequent items
    """
    results = results.most_common()
    limit = top_n if top_n else len(results)
    writer = csv.writer(sys.stdout)
    writer.writerows(results[0:limit])
