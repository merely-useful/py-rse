#!/usr/bin/env python

import sys
import re


SINGLES = [('---', r'```'),
           ('---', r'```'),
           ('{% include links.md %}', '')]


def main():
    doc = sys.stdin.read()
    for (src, dst) in SINGLES:
        doc = doc.replace(src, dst, 1)
    for func in FUNCS:
        doc = func.pattern.sub(func, doc)
    sys.stdout.write(doc)


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


FUNCS = [figure]


if __name__ == '__main__':
    main()
