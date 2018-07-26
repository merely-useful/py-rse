#!/usr/bin/env python

import sys
import re
import yaml


CONFIG_KEYS = ['email', 'isbn', 'purchase', 'repo', 'website']
SINGLES = [('---', r'```'),
           ('---', r'```'),
           ('{% include links.md %}', '')]


def main(configPath):
    settings = readConfig(configPath)
    doc = sys.stdin.read()
    for key in settings:
        doc = doc.replace(key, settings[key])
    for (src, dst) in SINGLES:
        doc = doc.replace(src, dst, 1)
    for func in FUNCS:
        doc = func.pattern.sub(func, doc)
    sys.stdout.write(doc)


def readConfig(configPath):
    with open(configPath, 'r') as reader:
        config = yaml.load(reader)
    result = {}
    for key in CONFIG_KEYS:
        result['{{site.' + key + '}}'] = config[key]
    return result


def codeLang(m):
    return '```'
codeLang.pattern = re.compile(r'```.+')


def codeTitle(m):
    return ''
codeTitle.pattern = re.compile(r'{:\s+title=".+?"}')


def figure(m):
    body = m.group(1)
    src = figure.src.search(body).group(1)
    title = figure.title.search(body).group(1)
    ident = figure.ident.search(body).group(1)
    return figure.template.format(src, title, ident)
figure.pattern = re.compile(r'<figure>(.+?)</figure>', re.DOTALL)
figure.src = re.compile(r'src\s*=\s*"(.+?)"')
figure.title = re.compile(r'alt\s*=\s*"(.+?)"')
figure.ident = re.compile(r'id\s*=\s*"(.+?)"')
figure.template = '''~~~
FIGURE
src = "{}"
title = "{}"
ident = "{}"
~~~
'''


FUNCS = [codeLang, codeTitle, figure]


if __name__ == '__main__':
    if len(sys.argv) != 2:
        sys.stderr.write('Usage: texpre /path/to/_config.yml\n')
        sys.exit(1)
    main(sys.argv[1])
