"""
Collection of commonly used functions.

Functions
---------
collection_to_csv
    write out a collection of items and counts in csv format
"""
import sys
import csv


def collection_to_csv(collection, num=None):
    """
    Write out a collection of items and counts in csv format.

    Parameters
    ----------
    collection : collections.Counter
        Collection of items and counts
    num : int
        Limit output to N most frequent items
    """
    collection = collection.most_common()
    if num is None:
        num = len(collection)
    writer = csv.writer(sys.stdout)
    writer.writerows(collection[0:num])
