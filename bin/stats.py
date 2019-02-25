#!/usr/bin/env python

'''
Report statistics about (completed) chapters.
'''


import sys
import re
from util import \
    get_all_docs, \
    is_undone, \
    uncode, \
    unheader


USAGE = 'stats.py language [--undone]'


def main(language, with_undone=False):
    '''
    Main driver.
    '''
    overall = {}
    per_file = {}
    for (slug, filename, body, lines) in get_all_docs(language):
        if with_undone or not is_undone(body):
            count_basic(per_file, slug, filename, body, lines)
            if slug == 'gloss':
                count_gloss(overall, slug, filename, body, lines)
    display(overall, per_file)


def count_basic(accum, slug, filename, body, lines):
    '''
    Calculate summary statistics for a single document.
    '''
    lines = uncode(unheader(lines))
    accum[slug] = {
        'lines': len(lines),
        'words': sum([_words(line) for line in lines])
    }


def count_gloss(accum, slug, filename, body, lines):
    '''
    Count glossary definitions.
    '''
    pat = re.compile(r'^\*\*', flags=re.MULTILINE)
    accum['definitions'] = len(pat.findall(body))


def display(overall, per_file):
    '''
    Report summary statistics.
    '''
    OVERALL = '{:20}\t{:>6}'
    print(OVERALL.format('Statistic', 'Value'))
    for key in sorted(overall.keys()):
        print(OVERALL.format(key, overall[key]))
    print(OVERALL.format('-' * 12, '-' * 6))
    PER_FILE = '{:20}\t{:>6}\t{:>6}'
    print(PER_FILE.format('Filename', 'Lines', 'Words'))
    for key in sorted(per_file.keys()):
        print(PER_FILE.format(key, per_file[key]['lines'], per_file[key]['words']))
    print(PER_FILE.format('Total',
                          sum([per_file[key]['lines'] for key in per_file]),
                          sum([per_file[key]['words'] for key in per_file])))


def _words(line):
    '''
    Count words in line.
    '''
    return len([x for x in line.split() if x.strip()])


if __name__ == '__main__':
    if len(sys.argv) == 2:
        main(sys.argv[1])
    elif (len(sys.argv) == 3) and (sys.argv[2] == '--undone'):
        main(sys.argv[1], True)
    else:
        usage(USAGE)
