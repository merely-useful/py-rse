#!/usr/bin/env python

import sys
import os
import re
import yaml
import json
from string import ascii_uppercase
from util import get_toc, usage


SECTION_PAT = re.compile(r'^##\s+.+\s+\{#(s:.+)\}', re.MULTILINE)


def main(config_file, source_dir):
    config = get_toc(config_file)
    result = {}

    lessons = config['lessons']
    for (i, slug) in enumerate(lessons):
        key = str(i+1)
        result['s:{}'.format(slug)] = {
            'slug': slug,
            'text': 'Chapter',
            'value': key
        }
        process_sections(result, source_dir, slug, key)

    extras = config['extras']
    letters = ascii_uppercase[:len(extras)]
    for (key, slug) in zip(letters, extras):
        result['s:{}'.format(slug)] = {
            'slug': slug,
            'text': 'Appendix',
            'value': key
        }
        process_sections(result, source_dir, slug, key)

    language = source_dir.lstrip('_')
    json.dump(result, sys.stdout)


def process_sections(result, source_dir, slug, base):
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


if __name__ == '__main__':
    if len(sys.argv) != 3:
        usage('make_toc.py config_file source_dir')
    main(sys.argv[1], sys.argv[2])
