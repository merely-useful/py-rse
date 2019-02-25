#!/usr/bin/env python

import sys
import re
import getopt
from difflib import SequenceMatcher, Match
from itertools import zip_longest
from util import \
    get_all_docs, \
    get_inclusions, \
    get_src_file, \
    usage


COMMENT_PAT = re.compile(r'\.\.\.(.+)\.\.\.$')


def main(options, single, multi):
    '''
    Display all requested inclusions.
    '''
    if multi: multi += '/' # to avoid spurious substring matches
    do_all = not (single or multi)
    content = get_all_docs(options['language'], remove_code_blocks=False)

    inclusions = get_inclusions(content, options['rejoin_lines'])
    todo = [(path, body) for (path, body) in inclusions \
            if (single and (path == single)) or \
               (multi and path.startswith(multi)) or \
               do_all]

    for (path, body) in sorted(todo):
        align(options, path, body)


def align(options, path, included):
    '''
    Display side by side.
    '''
    actual = get_src_file(path)
    if is_simple_inclusion(options, included, actual):
        return

    included = included.rstrip('\n').split('\n')
    actual = actual.rstrip('\n').split('\n')
    matches = [Match(0, 0, 0)] + \
        SequenceMatcher(a=included, b=actual).get_matching_blocks()

    result = []
    diffs_found = False
    fmt = '{{0}}|{{1:{}}}|{{2}}'.format(max([len(x) for x in included]))
    for i in range(len(matches) - 1):
        diffs_found |= align_one(result, options, fmt, included, actual,
                                 matches[i], matches[i+1])

    if options['names_only']:
        if diffs_found:
            print(path)
    elif diffs_found or options['verbose']:
        print('\n-- {}'.format(path))
        for r in result:
            print(r)


def align_one(result, options, fmt, included, actual, match_prev, match_curr):
    '''
    Show material between previous and current, then show current,
    returning number of differences.
    '''
    included_prev, actual_prev, n_prev = match_prev
    included_prev += n_prev
    actual_prev += n_prev

    included_curr, actual_curr, n_curr = match_curr

    included_between = included[included_prev:included_curr]
    actual_between = actual[actual_prev:actual_curr]
    diffs_found = (len(included_between) > 0) and (not can_collapse(options, included_between))
    if diffs_found:
        result.extend(stringify(fmt, '*', included_between, actual_between))

    included_matching = included[included_curr:included_curr+n_curr]
    actual_matching = actual[actual_curr:actual_curr+n_curr]
    result.extend(stringify(fmt, ' ', included_matching, actual_matching))

    return diffs_found


def is_simple_inclusion(options, included, actual):
    '''
    Is the inclusion a pure substring of the actual file?
    '''
    return (included in actual) and (not options['verbose'])


def can_collapse(options, lines):
    '''
    Can this difference be collapsed by a comment?
    '''
    return options['collapse_comments'] and lines and COMMENT_PAT.search(lines[0])


def stringify(fmt, marker, left, right):
    return [fmt.format(marker, l, r)
            for (l, r) in zip_longest(left, right, fillvalue='')]


if __name__ == '__main__':
    single, multi = None, None
    options = {
        'collapse_comments' : True,
        'language' : None,
        'names_only' : False,
        'rejoin_lines' : True,
        'verbose' : False
    }
    choices, extras = getopt.getopt(sys.argv[1:], 'aCd:f:Jnv')
    if len(extras) != 1:
        usage('mismatch.py [-a | -d dir | -f file] [-C] [-J] [-n] [-v] language')
    options['language'] = extras[0]
    for (opt, arg) in choices:
        if opt == '-a':
            pass
        elif opt == '-C':
            options['collapse_comments'] = False
        elif opt == '-d':
            multi = arg
        elif opt == '-f':
            single = arg
        elif opt == '-J':
            options['rejoin_lines'] = False
        elif opt == '-n':
            options['names_only'] = True
        elif opt == '-v':
            options['verbose'] = True
    main(options, single, multi)
