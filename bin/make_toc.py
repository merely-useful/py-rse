#!/usr/bin/env python

import sys
import os
import re
import yaml
import json
from string import ascii_uppercase
from util import get_toc, usage


SECTION_PAT = re.compile(r'^##\s+.+\s+\{#(s:.+)\}', re.MULTILINE)
FIGURE_PAT = re.compile(r'id="(f:[^"]+)"')
TABLE_PAT = re.compile(r'id="(t:[^"]+)"')


def main(language):
    config = get_toc()
    source_dir = '_{}'.format(language)
    result = {}

    lessons = config['lessons']
    counters = {'figure': 1, 'table': 1}
    for (i, slug) in enumerate(lessons):
        key = str(i+1)
        result['s:{}'.format(slug)] = {
            'slug': slug,
            'text': 'Chapter',
            'value': key
        }
        process(result, source_dir, slug, key, counters)

    extras = config['extras']
    letters = ascii_uppercase[:len(extras)]
    for (key, slug) in zip(letters, extras):
        result['s:{}'.format(slug)] = {
            'slug': slug,
            'text': 'Appendix',
            'value': key
        }
        process(result, source_dir, slug, key, counters)

    json.dump(result, sys.stdout)


def process(result, source_dir, slug, base, counters):
    filename = os.path.join(source_dir, '{}.md'.format(slug))
    with open(filename, 'r') as reader:
        content = reader.read()

    headings = SECTION_PAT.findall(content)
    fill(result, headings, slug, 1, 'Section', '{base}.{i}', {'base': base})

    figures = FIGURE_PAT.findall(content)
    fill(result, figures, slug, counters['figure'], 'Figure', '{i}', {})
    counters['figure'] += len(figures)

    tables = TABLE_PAT.findall(content)
    fill(result, tables, slug, counters['table'], 'Table', '{i}', {})
    counters['table'] += len(tables)


def fill(result, items, slug, start, text, fmt, values):
    for (k, i) in zip(items, range(start, start + len(items))):
        values['i'] = i
        result[k] = {
            'slug': slug,
            'text': text,
            'value': fmt.format(**values)
        }


if __name__ == '__main__':
    if len(sys.argv) != 2:
        usage('make_toc.py language')
    main(sys.argv[1])
