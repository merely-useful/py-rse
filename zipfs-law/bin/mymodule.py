"""
Collection of commonly used functions.

Functions
---------
report_results
    report results to stream
"""
import csv

def report_results(writer, results, top_n=None):
    """Report results to stream."""
    limit = top_n if top_n else len(results)
    writer = csv.writer(writer)
    for (word, count) in results[0:limit]:
        writer.writerow((word, count))
