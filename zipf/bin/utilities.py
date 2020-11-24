"""Collection of commonly used functions."""

import sys
import csv


ERROR_MESSAGES = {
    'not_csv_file_suffix': '{file_name}: File must end in .csv',
}


def collection_to_csv(collection, num=None):
    """
    Write out collection of items and counts in csv format.

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
