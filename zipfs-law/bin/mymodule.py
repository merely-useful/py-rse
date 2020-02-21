"""
Collection of commonly used functions.

Functions
---------
collection_to_csv
    write out a collection of items and counts in csv format
"""
import sys
import csv

def collection_to_csv(collection, ntop=None):
    """
    Write out a collection of items and counts in csv format.
    
    Parameters
    ----------
    collection : collections.Counter
        Collection of items and counts
    ntop : int
        Limit output to n most frequent items
    """
    collection = collection.most_common()
    limit = ntop if ntop else len(collection)
    writer = csv.writer(sys.stdout)
    writer.writerows(collection[0:limit])
