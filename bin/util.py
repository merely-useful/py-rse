#!/usr/bin/env python

'''
Utilities.
'''

import sys


LANGUAGES = {'r', 'python'}


def read_files(filenames, handler):
    '''Read information from stdin or all source files.'''

    if not filenames:
        result = handler('-', sys.stdin)

    else:
        result = set()
        for name in filenames:
            with open(name, 'r') as reader:
                result |= handler(name, reader)

    return result


def report(title, values):
    '''Print values if any.'''

    if values:
        print(title)
        for v in sorted(values):
            print('  ', v)
