#!/usr/bin/env python

'''
Check that chapters are consistent in configuration YAML, Makefile, keypoints,
and objectives.

Usage: make settings | bin/chapters.py _something.yml MAKEFILE_KEY ...include_files...
'''


import sys
import yaml
import re
import os


CONFIG_KEY = 'rmd_files'
INCLUDE_RE = re.compile(r'```{r,\s+child="(.+?)"}')
BOILERPLATE = 'CONDUCT.md CONTRIBUTING.md LICENSE.md appendix.Rmd gloss.md index.Rmd links.md references.Rmd'.split()


def main(args):
    assert len(args) >= 2, 'Expected at least 2 arguments'
    config_file, makefile_key, include_files = args[0], args[1], args[2:]
    makefile = read_makefile_names(sys.stdin, makefile_key)
    config = read_config(config_file) - sanitize(BOILERPLATE)
    includes = [read_include(f) for f in include_files]
    check('config and makefile', config, makefile)
    for (filename, values) in zip(include_files, includes):
        check('config and {}'.format(filename), config, values)


def read_makefile_names(reader, makefile_key):
    lines = [x for x in reader.readlines() if x.startswith(makefile_key)]
    assert len(lines) == 1, 'No match for {}'.format(makefile_key)
    return sanitize(lines[0].split(':')[1].strip().split())


def read_config(config_file):
    with open(config_file, 'r') as reader:
        config = yaml.safe_load(reader)
        assert CONFIG_KEY in config, '{} not found in {}'.format(CONFIG_KEY, config_file)
        return sanitize(config[CONFIG_KEY])


def read_include(filename):
    with open(filename, 'r') as reader:
        raw = [x.split('/') for x in INCLUDE_RE.findall(reader.read())]
        assert len(set([x[0] for x in raw])) == 1, 'Inconsistent directory names in {}'.format(filename)
        return sanitize([x[1] for x in raw])


def sanitize(names):
    return set([os.path.splitext(n)[0] for n in names])


def check(title, left, right):
    for (subtitle, items) in (('missing', left-right), ('extra', right-left)):
        if items:
            print('{}: {}'.format(title, subtitle))
            for i in sorted(items):
                print('  {}'.format(i))


if __name__ == '__main__':
    main(sys.argv[1:])
