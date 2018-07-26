#!/usr/bin/env python

'''
Construct cross-reference table of section numbers, figure numbers, etc.
This table is then loaded dynamically into each page where files/youbou.js
uses it to adjust links and text, because Jekyll doesn't do numbering
without a plugin.
'''

# Libraries.
import sys
import os
import re
import yaml
import json


# Global constants.
SECTION = re.compile(r'^(##+).+{#(.+)}')
FIGURE = re.compile(r'figcaption\s+id="(f:.+?)"')


def main(root):
    '''
    Main driver: get configuration data from stdin, process each, patch
    the results, and write to stdout.
    '''

    config = yaml.load(sys.stdin)

    paths = makePaths(root, config['toc']['lessons'])
    chapters = []
    for (slug, filename) in paths:
        chapters = findAndAdd(filename, slug, chapters)
    chapters = fixNumbers(chapters)

    paths = makePaths(root, config['toc']['extras'])
    appendices = []
    for (slug, filename) in paths:
        appendices = findAndAdd(filename, slug, appendices)
    appendices = fixNumbers(appendices)
    appendices = makeAlpha(appendices)

    toc = {}
    for (kind, label, slug, number) in chapters + appendices:
        toc[label] = {'number': number, 'slug': slug}
    print('{}{}'.format(config['marker']['crossref'], json.dumps(toc)))


def makePaths(directory, order):
    '''
    Convert entries in configuration data into (slug, filename) pairs.
    '''
    order = [permalink.replace('/', '') for permalink in order]
    return [(permalink.lower(), os.path.join(directory, permalink + '.md')) for permalink in order]


def findAndAdd(filename, slug, toc):
    '''
    Find sections and figures and add initial entries to the ToC list.
    '''
    toc.append(['heading', 's:{}'.format(slug), slug, 1])
    with open(filename, 'r') as reader:
        for line in reader:
            m = SECTION.search(line)
            if m:
                toc.append(['heading', m.group(2), slug, len(m.group(1))])
                continue
            m = FIGURE.search(line)
            if m:
                toc.append(['figure', m.group(1), slug, None])
                continue
    return toc


def fixNumbers(sections):
    '''
    Make numbering cumulative, e.g., "2.1.3".
    '''
    current = []
    figCount = 0
    result = []
    for (kind, label, slug, number) in sections:
        if kind == 'heading':
            if number > len(current):
                current.append(1)
            elif number == len(current):
                current[-1] += 1
            else:
                current = current[:-1]
                if len(current) == 1:
                    current[0] += 1
                    figCount = 0
            result.append([kind, label, slug, '.'.join([str(x) for x in current])])
        elif kind == 'figure':
            figCount += 1
            result.append([kind, label, slug, '{}.{}'.format(current[0], figCount)])
    return result


def makeAlpha(sections):
    '''
    Convert leading numerics to leading alphas for appendices.
    '''
    base = ord('A') - 1
    result = []
    for (kind, label, slug, key) in sections:
        key = key.split('.')
        key[0] = chr(int(key[0]) + base)
        key = '.'.join(key)
        result.append([kind, label, slug, key])
    return result


# Command-line launch.
if __name__ == '__main__':
    if len(sys.argv) != 2:
        sys.stderr.write('Usage: crossref /path/to/chapters\n')
        sys.exit(1)
    main(sys.argv[1])
