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


def main(config_file, source_dir):
    config = get_toc(config_file)
    result = {}

    lessons = config['lessons']
    figure = 1
    for (i, slug) in enumerate(lessons):
        key = str(i+1)
        result['s:{}'.format(slug)] = {
            'slug': slug,
            'text': 'Chapter',
            'value': key
        }
        figure = process(result, source_dir, slug, key, figure)

    extras = config['extras']
    letters = ascii_uppercase[:len(extras)]
    for (key, slug) in zip(letters, extras):
        result['s:{}'.format(slug)] = {
            'slug': slug,
            'text': 'Appendix',
            'value': key
        }
        figure = process(result, source_dir, slug, key, figure)

    language = source_dir.lstrip('_')
    json.dump(result, sys.stdout)


def process(result, source_dir, slug, base, figure_start):
    filename = os.path.join(source_dir, '{}.md'.format(slug))
    with open(filename, 'r') as reader:
        content = reader.read()
    headings = SECTION_PAT.findall(content)
    for (h, i) in zip(headings, range(1, len(headings) + 1)):
        result[h] = {
            'slug': slug,
            'text': 'Section',
            'value': '{}.{}'.format(base, i)
        }
    figures = FIGURE_PAT.findall(content)
    for (f, i) in zip(figures, range(figure_start, len(figures) + figure_start)):
        result[f] = {
            'slug': slug,
            'text': 'Figure',
            'value': '{}'.format(i)
        }
    return len(figures) + figure_start


if __name__ == '__main__':
    if len(sys.argv) != 3:
        usage('make_toc.py config_file source_dir')
    main(sys.argv[1], sys.argv[2])
