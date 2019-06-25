#!/usr/bin/env python

'''
Utilities.
'''

import sys, re
from io import StringIO


LANGUAGES = {'r', 'python'}
PAT_BLOCK = re.compile(r'^```.+?```$', re.DOTALL + re.MULTILINE)
PAT_INLINE = re.compile(r'`.+?`')


def report(title, values):
    '''Print values if any.'''

    if values:
        print(title)
        for v in sorted(values):
            print('  ', v)


def read_all_files(filenames, handler, remove_code=False):
    '''Read information from stdin or all source files.'''

    if not filenames:
        _handle_single_file('-', handler, sys.stdin, remove_code)

    else:
        result = set()
        for name in filenames:
            with open(name, 'r') as reader:
                result |= _handle_single_file(name, handler, reader, remove_code)

    return result


def _handle_single_file(name, handler, stream, remove_code):
    '''Read and handle a single file.'''

    raw = stream.read()
    if remove_code:
        raw = _remove_ticked_code(raw)
    wrapped = StringIO(raw)
    return handler(name, wrapped)


def _remove_ticked_code(text):
    '''Remove `inline` and ```triple quoted``` code blocks.'''

    text = PAT_BLOCK.sub('', text)
    text = PAT_INLINE.sub('', text)
    return text
