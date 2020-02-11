"""Collection of commonly used functions.

Functions:
  report_results  -- report results to stream
  sort_counts     -- sort a word count collection

"""

import csv
import pdb


def report_results(writer, results, top_n=None):
    """Report results to stream."""
    
    limit = top_n if top_n else len(results)
    writer = csv.writer(writer)
    for (key, value) in results[0:limit]:
        writer.writerow((key, value))
        

def sort_counts(word_counts, method):
    """Sort a word count collection.
    
    Args:
      word_counts (collections.Counter): word counts
      method (str): sorting method
    
    """
    
    assert method in ['count', 'alphabetical'], "Invalid sorting method"
    
    if method == 'count':
        word_counts = word_counts.most_common()
    else:
        word_counts = sorted(word_counts.items())
        
    return word_counts