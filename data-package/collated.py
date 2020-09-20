'''Example data package.'''

import os
import csv

def getData():
    '''Load 'collated.csv' from this file's directory.'''
    filename = os.path.join(os.path.dirname(__file__), 'collated.csv')
    with open(filename, 'r') as reader:
        return [row for row in csv.reader(reader)]
