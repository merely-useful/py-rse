#!/usr/bin/env python

import sys
import bibtexparser

HEADER = '''@comment{
  Entries currently used in book.
  Special characters *MUST* use LaTeX escapes, because BibTeX doesn't handle UTF-8 properly.
  All bibliographic notes must be wrapped in \bibnote{...}.
}'''

KEYS = ['author', 'editor', 'title', 'booktitle', 'edition',
        'journal', 'volume', 'number', 'pages', 'year', 'month', 'day',
        'publisher', 'howpublished', 'institution', 'isbn', 'issn',
        'doi', 'link', 'nolocal', 'local', 'note']


def main():
    print(HEADER)
    entries = bibtexparser.loads(sys.stdin.read()).entries
    current = None
    for e in entries:
        if e['ID'][0] != current:
            current = e['ID'][0]
            print('\n@comment{{{}}}'.format(current * 3))
        print('\n@{}{{{},'.format(e['ENTRYTYPE'], e['ID']))
        fields = ['  {} = {{{}}}'.format(k, e[k]) for k in KEYS if k in e]
        print(',\n'.join(fields))
        print('}')


if __name__ == '__main__':
    main()
