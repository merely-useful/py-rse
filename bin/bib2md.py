#!/usr/bin/env python

'''
Convert a BibTeX file to Markdown.  This only handles the subset
of BibTeX used in this book's bibliography.
'''

# Libraries.
import sys
import bibtexparser
from util import usage

# Constants
HEADER = '''---
title: "Bibliography"
---
'''

FOOTER = '{% include links.md %}'

CHARACTERS = (
    (r"\_", '_'),
    (r"\'{A}", 'Á'),
    (r"\'{a}", 'á'),
    (r"\'{e}", 'é'),
    (r"\'{o}", 'ó'),
    (r'\"{a}', 'ä'),
    (r'\"{e}', 'ë'),
    (r'\"{o}', 'ö'),
    (r'\"{u}', 'ü'),
    (r'\c{c}', 'ç'),
    (r'\v{Z}', 'Ž'),
    (r'\v{z}', 'ž'),
    (r'\%', '%'),
    (r'\&', '&'),
    (r'\aa', 'å'),
    (r'\o', 'ø'),
    ('{', ''),
    ('}', '')
)


def _c(text):
    '''
    Clean up LaTeXisms in strings.
    '''
    for (orig, repl) in CHARACTERS:
        text = text.replace(orig, repl)
    return text


def _authors(entry):
    '''
    Format the author names in an entry.
    '''
    if 'author' in entry:
        names = entry['author']
        suffix = ''
    elif 'editor' in entry:
        names = entry['editor']
        suffix = ' (eds.)'
    names = names.split(' and ')
    if len(names) == 0:
        raise Exception('NO AUTHOR')
    elif len(names) == 1:
        return _c('{}{}'
                  .format(names[0], suffix))
    elif len(names) == 2:
        return _c('{} and {}{}'
                  .format(names[0], names[1], suffix))
    else:
        return _c('{}, and {}{}'
                  .format(', '.join(names[:-1]), names[-1], suffix))


def _booktitle(entry):
    '''
    Format the book title for a collection or proceedings.
    '''
    return _c('*{}*'
              .format(entry['booktitle']))


def _details(entry):
    '''
    Format publication details: year plus optional month, volume, number.
    '''
    result = entry['year']
    if 'month' in entry:
        result = '{} {}' .format(entry['month'], result)
    if 'volume' in entry:
        if 'number' in entry:
            extra = '{}({})' .format(_c(entry['volume']), entry['number'])
        else:
            extra = _c(entry['volume'])
        result = '{}, {}' .format(extra, result)
    return result


def _howpublished(entry):
    '''
    Format the 'howpublished' of a miscellaneous entry (possibly as a link).
    '''
    how = entry['howpublished']
    if how.startswith('http'):
        how = '<{}>'.format(how)
    return _c(how)


def _institution(entry):
    '''
    Format the institution that published a tech report.
    '''
    return _c(entry['institution'])


def _journal(entry):
    '''
    Format a journal title.
    '''
    return _c('*{}*'.format(entry['journal']))


def _key(entry):
    '''
    Format the citation key, including the Markdown to create a linkable ID.
    '''
    key = entry['ID']
    return '**' + key + '**{:#b:' + key + '}'


def _link(entry):
    '''
    Format a URL in an entry.
    '''
    if 'link' not in entry:
        return ''
    return '<{}>'.format(entry['link'])


def _note(entry):
    '''
    Format an entry's bibliographic note.
    '''
    return _c('*{}*'.format(entry['note']))


def _papertitle(entry):
    '''
    Format the title of a paper.
    '''
    return _c('"{}"'.format(entry['title']))


def _publisher(entry):
    '''
    Format the publisher in an entry.
    '''
    return _c(entry['publisher'])


def _title(entry):
    '''
    Format the book title in an entry.
    '''
    return _c('*{}*'.format(entry['title']))


# Handlers for various entry types.
# Each element is a function (always called) or a (prefix, function) pair.
# In the latter case, the prefix is only displayed if the function
# returns something.
HANDLERS = {
    'article': [_key, ': ', _authors, ': ', _papertitle, '. ',
                _journal, (', ', _details), (', ', _link), '. ', _note],
    'book': [_key, ': ', _authors, ': ', _title, '. ',
             _publisher, (', ', _details), (', ', _link), '. ', _note],
    'comment': [],
    'incollection': [_key, ': ', _authors, ': ', _papertitle,
                     ', in', _booktitle, '. ', _publisher, (', ', _details),
                     (', ', _link), '. ', _note],
    'inproceedings': [_key, ': ', _authors, ': ', _papertitle, '. ',
                      _booktitle, (', ', _details), (', ', _link), '. ',
                      _note],
    'misc': [_key, ': ', _authors, ': ', _papertitle, '. ',
             _howpublished, _details, (', ', _link), '. ', _note],
    'techreport': [_key, ': ', _authors, ': ', _papertitle, '. ',
                   _institution, (', ', _details), '. ', _note]
}


def main(language):
    '''
    Main driver: read bibliography from stdin, format, and print.
    '''
    print(HEADER.format(language))
    text = sys.stdin.read()
    if text:
        try:
            source = bibtexparser.loads(text).entries
            for entry in source:
                for h in HANDLERS[entry['ENTRYTYPE']]:
                    if type(h) is tuple:
                        prefix, func = h
                        text = func(entry)
                        if text:
                            sys.stdout.write(prefix + text)
                    elif callable(h):
                        sys.stdout.write(h(entry))
                    else:
                        sys.stdout.write(h)
                sys.stdout.write('\n\n')
        except Exception as e:
            sys.stderr.write('\nERROR {}:: {}\n'.format(str(e), str(entry)))
    print(FOOTER)


# Command-line launch.
if __name__ == '__main__':
    if len(sys.argv) != 2:
        usage('bib2m language < input > output')
    main(sys.argv[1])
