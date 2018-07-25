#!/usr/bin/env python

import sys
import os
import re
import yaml


HEADER = '''---
permalink: "/{}/all.html"
---'''


def main(language, configPath, crossrefPath, rootDir):
    slugs, markers = readConfig(configPath)
    crossref = readCrossref(crossrefPath, markers['crossref'])

    print(HEADER.format(language))

    before, body, after = getBody(os.path.join(rootDir, 'index.html'),
                                  markers['start'], markers['end'])
    print(fixToc(before, language))
    print(fixLinks(body, crossref))

    slugPaths = [(s, os.path.join(rootDir, s, 'index.html')) for s in slugs]
    for (slug, path) in slugPaths:
        _, body, _ = getBody(path, markers['start'], markers['end'])
        body = body.replace('<h1', '<h1 id="s:{}"'.format(slug))
        print(fixLinks(body, crossref))

    print(after)


def readConfig(configPath):
    with open(configPath, 'r') as reader:
        config = yaml.load(reader)
    slugs = [p.strip('/') for p in config['toc']['lessons'] + config['toc']['extras']]
    return slugs, config['marker']


def readCrossref(crossrefPath, prefix):
    with open(crossrefPath, 'r') as reader:
        data = reader.read()
    data = data.replace(prefix, '')
    data = eval(data)
    return data


def getBody(path, markerStart, markerEnd):
    with open(path, 'r') as reader:
        text = reader.read()
    start = text.find(markerStart) + len(markerStart)
    end = text.find(markerEnd, start)
    return text[:start], text[start:end], text[end:]


def fixToc(doc, language):

    def link(m):
        slug = m.group(1)
        return 'href="#s:{}"'.format(slug)
    link.pattern = re.compile('href="/{}/(.+?)/"'.format(language))

    return link.pattern.sub(link, doc)


def fixLinks(doc, crossref):

    def appendix(m):
        target = m.group(1)
        title = crossref[target]['number']
        return '<a href="#{}">Appendix {}</a>'.format(target, title)
    appendix.pattern = re.compile(r'<a href="#APPENDIX">(.+?)</a>')


    def chapter(m):
        target = m.group(1)
        title = crossref[target]['number']
        return '<a href="#{}">Chapter {}</a>'.format(target, title)
    chapter.pattern = re.compile(r'<a href="#CHAPTER">(.+?)</a>')


    def cite(m):
        target = m.group(1)
        return '<a href="#{}">{}</a>'.format(target, target)
    cite.pattern = re.compile(r'<a href="#CITE">(.+?)</a>')


    def figure(m):
        target = m.group(1)
        title = crossref[target]['number']
        return '<a href="#{}">Figure {}</a>'.format(target, title)
    figure.pattern = re.compile(r'<a href="#FIGURE">(.+?)</a>')


    def section(m):
        target = m.group(1)
        title = crossref[target]['number']
        return '<a href="#{}">Section {}</a>'.format(target, title)
    section.pattern = re.compile(r'<a href="#SECTION">(.+?)</a>')


    FUNCS = [appendix, figure, cite, chapter, section]

    for func in FUNCS:
        doc = func.pattern.sub(func, doc)
    return doc


if __name__ == '__main__':
    if len(sys.argv) != 5:
        sys.stderr.write('Usage: mergebook language /path/to/config /path/to/crossref /path/to/site\n')
        sys.exit(1)
    main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
