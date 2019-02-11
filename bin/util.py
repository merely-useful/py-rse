'''
Utilities.
'''

import sys
import os
import json
import yaml


CHARACTERS = {
    'ç': r"\c{c}",
    'é': r"\'{e}",
    'ë': r'\"{e}',
    'ö': r'\"{o}'
}


def get_toc(config_path):
    '''Read the table of contents and return ToC section.'''
    with open(config_path, 'r') as reader:
        config = yaml.load(reader)
    return config['toc']


def get_crossref(filename):
    with open(filename, 'r') as reader:
        return json.load(reader)


def report(title, group, values):
    '''Report missing/unused values.'''
    if values:
        print('{}: {}'.format(title, group))
        for v in sorted(values):
            print('  ', v)


def usage(message, status=1):
    '''Display a usage message.'''
    print('Usage: {}'.format(message), file=sys.stderr)
    sys.exit(status)
