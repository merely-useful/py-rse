#!/usr/bin/env python

import sys
import re
import yaml


def main(configPath, bookPath, chapterFiles):
    configToc = read_config_toc(configPath)
    texToc = read_tex_toc(bookPath)
    filesToc = normalize(chapterFiles)
    report('in configuration but not book', configToc - texToc)
    report('in book but not configuration', texToc - configToc)
    report('in configuration but no file',  configToc - filesToc)
    report('file but not in configuration', filesToc - configToc)


def read_config_toc(configPath):
    with open(configPath, 'r') as reader:
        config = yaml.load(reader)
    toc = config['toc']
    return {x.strip('/') for x in set(toc['lessons']) | set(toc['bib']) | set(toc['extras'])}


def read_tex_toc(path):
    with open(path, 'r') as reader:
        pat = re.compile(r'\\input{inc/(.+?)}')
        doc = reader.read()
        start = {'bib'} if r'\bibliography{book}' in doc else set()
        matches = pat.findall(doc)
        return start | set(matches)


def normalize(filenames):
    return set([f.split('/')[1].split('.')[0] for f in filenames])


def report(title, values):
    if not values: return
    print(title)
    for v in sorted(values):
        print(v)
    

if __name__ == '__main__':
    if len(sys.argv) < 4:
        sys.stderr.write('Usage: checkfiles /path/to/config /path/to/book.tex /path/to/chapterfiles...')
        sys.exit(1)
    main(sys.argv[1], sys.argv[2], sys.argv[3:])
