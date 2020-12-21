#!/usr/bin/env python

'''Convert YAML glossary to required Markdown format.'''


import sys
import re
import yaml


MARKDOWN_REF = re.compile(r'\[(.+?)\]\(#(.+?)\)', re.DOTALL + re.MULTILINE)


def main():
    '''Main driver.'''
    with open(sys.argv[1], 'r') as reader:
        terms = {x.strip() for x in reader}
    glossary = yaml.load(sys.stdin, Loader=yaml.FullLoader)
    crossref = {entry['slug']:entry for entry in glossary if entry['slug'] in terms}
    slugs = list(sorted(crossref.keys()))
    for slug in slugs:
        show(crossref, crossref[slug])


def show(glossary, entry):
    '''Print required Markdown.'''
    term = entry['en']['term']
    slug = entry['slug']
    body = make_body(entry['en']['def'])
    ref = make_ref(glossary, entry)
    print('**{term}**<a id="{slug}"></a>'.format(term=term, slug=slug))
    print(f':   {body}{ref}\n')


def make_body_replace(match):
    '''Replace a single Markdown-style interlink in the glossary.'''
    text = match.group(1)
    link = match.group(2)
    return f'\\gref{{{text}}}{{{link}}}'


def make_body(raw):
    '''Convert glossary YAML body into required Markdown text.'''
    body = ' '.join([x.strip() for x in raw.split('\n')])
    return MARKDOWN_REF.sub(make_body_replace, body)


def make_ref(glossary, entry):
    '''Build cross-references if any.'''
    if 'ref' not in entry:
        return ''

    terms = [glossary[r] for r in entry['ref'] if r in glossary]
    if not terms:
        return ''

    slugs = [e['slug'] for e in terms]
    words = [e['en']['term'] for e in terms]
    links = [f'[{word}](#{slug})' for (word, slug) in zip(words, slugs)]
    joined = ", ".join(links)
    return f' See also: {joined}'


if __name__ == '__main__':
    main()
