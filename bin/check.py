#!/usr/bin/env python

'''
Check the internal consistency of a project.
'''

import sys
import os
import glob
import re
import json
import yaml
from collections import Counter
from util import CHARACTERS, get_crossref, report


CHECK_PREFIX = 'check_'                 # prefix for all checking function names
CONFIG_FILE = '_config.yml'             # Jekyll configuration file
CROSSREF_FMT = '_data/{}_toc.json'      # cross-reference file (%language)
FIGURE_DIR = 'figures'                  # where figure source is stored
LINK_FILE = '_includes/links.md'        # link definition file
NOT_ALL = {'check_all'}                 # functions to ignore when running all
PROSE_DIR_FMT = '_{}'                   # lesson or appendix directory (%language)
PROSE_FILE_FMT = '_{}/{}.md'            # lesson or appendix (%language, %slug)
SOURCE_DIR = 'src'                      # source code inclusions


def main(language, verb):
    '''
    Find and call the function the caller wants.
    '''
    verb = CHECK_PREFIX + verb
    names = _get_checker_names()
    if verb not in names:
        _usage()
    verb = globals()[verb]
    verb(language)


def check_all(language):
    '''
    Check everything.
    '''
    for name in _get_checker_names():
        if name not in NOT_ALL:
            func = globals()[name]
            func(language)

    
def check_anchors(language):
    '''
    Check that anchors on H2's are properly formatted and include the chapter slug.
    '''
    header_pat = re.compile(r'^##\s+[^{]+{([^}]+)}\s*$')
    target_pat = re.compile(r'#s:([^-]+)')
    result = set()
    for (slug, filename, body, lines) in _get_all(language):
        for line in lines:
            anchor = header_pat.search(line)
            if not anchor:
                continue
            m = target_pat.search(anchor.group(1))
            if (not m) or (m.group(1) != slug):
                result.add('{}: "{}"'.format(slug, anchor.group(1)))
    report('Anchors', 'mismatched', result)


def check_chars(language):
    '''
    Find and report non-7-bit characters that aren't translated.
    '''
    allowed = set(CHARACTERS.keys())
    result = set()
    for (slug, filename, body, lines) in _get_all(language):
        for (i, line) in enumerate(lines):
            for (j, char) in enumerate(line):
                if (ord(char) > 127) and (char not in allowed):
                    result.add('{} {} {}: {}'.format(filename, i+1, j+1, char))
    report('Characters', 'non-ascii', result)


def check_cites(language):
    '''
    Check for unused and undefined citations.
    '''
    content = _get_all(language)
    used = _match_lines(content, r'\[([^\]]+)\]\(#BIB\)', flatten=',')
    defined = _match_lines(content, r'{:#b:([^}]+)}')
    report('Citations', 'unused', defined - used)
    report('Citations', 'undefined', used - defined)


def check_crossref(language):
    '''
    Check cross-references.
    '''
    content = _get_all(language)
    used = _match_lines(content, r'\[([^\]]+)\]\(#REF\)')
    defined = set(get_crossref(CROSSREF_FMT.format(language)).keys())
    report('Cross References', 'missing', used - defined)


def check_figures(language):
    '''
    Check included figures.
    '''
    def _ignore(filename):
        return filename.startswith('.') or \
            filename.endswith('.xml') or \
            filename.endswith('.pdf')

    def _redundant(filename, defined):
        return filename.endswith('.png') and \
            filename.replace('.png', '.svg') in defined

    content = _get_all(language)
    used = _match_lines(content, r'{%\s+include\s+figure.html[^%]+src=".+/figures/([^"]+)"')
    defined = {f for f in os.listdir(FIGURE_DIR) if not _ignore(f)}
    defined -= {f for f in defined if _redundant(f, defined)}
    report('Figures', 'unused', defined - used)
    report('Figures', 'missing', used - defined)


def check_gloss(language):
    '''
    Check for unused and undefined glossary entries.
    '''
    content = _get_all(language)
    used = _match_body(content, r'\[.+?\]\(#(g:.+?)\)')
    defined = _match_lines(content, r'\*\*.+?\*\*{:#(g:.+?)}')
    report('Glossary Entries', 'undefined', defined - used)
    report('Glossary Entries', 'missing', used - defined)


def check_langs(language):
    '''
    Check that every fenced code block specifies a language.
    '''
    content = _get_all(language)
    result = set()
    for (slug, filename, body, lines) in content:
        in_block = False
        for (i, line) in enumerate(lines):
            if not line.startswith('```'):
                pass
            elif in_block:
                in_block = False
            else:
                in_block = True
                if line.strip() == '```':
                    result.add('{} {:4d}'.format(filename, i+1))
    report('Code Blocks', 'no language', result)


def check_links(language):
    '''
    Check that external links are defined and used.
    '''
    content = _get_all(language)
    used = _match_body(content, r'\[.+?\]\[(.+?)\]')
    with open(LINK_FILE, 'r') as reader:
        body = reader.read()
    matches = re.findall(r'^\[(.+?)\]', body, flags=re.DOTALL + re.MULTILINE)
    links = Counter(matches)
    duplicate = {key for key in links if links[key] > 1}
    defined = set(links.keys())
    report('External Links', 'unused', defined - used)
    report('External Links', 'undefined', used - defined)
    report('External Links', 'duplicated', duplicate)


def check_src(language):
    '''
    Check external source files referenced in title attributes of code blocks.
    '''
    prefix_len = len(SOURCE_DIR + '/')

    def _unprefix(filename):
        return filename[prefix_len:]

    content = _get_all(language, remove_code_blocks=False)
    referenced = _match_body(content, r'{:\s+title="([^"]+)\s*"}')
    actual = {_unprefix(filename)
              for filename in glob.iglob('{}/**/*.*'.format(SOURCE_DIR), recursive=True)
              if not _ignore_file(filename)}
    report('Source Files', 'unused', actual - referenced)
    report('Source Files', 'missing', referenced - actual)


def check_toc(language):
    '''
    Check that filenames in configuration match actual files.
    '''
    toc = _get_toc()
    defined = {slug for section in toc for slug in toc[section]}
    defined.add('index')
    actual = {filename.replace('.md', '')
              for filename in os.listdir(PROSE_DIR_FMT.format(language))
              if not _ignore_file(filename)}
    report('Table of Contents', 'unused', actual - defined)
    report('Table of Contents', 'missing', defined - actual)


#-------------------------------------------------------------------------------

    
def _get_all(language, with_index=True, remove_code_blocks=True):
    '''
    Return a list of (slug, filename, body, lines) tuples from the table of contents,
    including ('index', 'lang/index.md', lines) unless told not to.
    '''
    result = []
    if with_index:
        result.append(_get_one(language, 'index'))
    toc = _get_toc()
    for section in toc:
        result.extend([_get_one(language, s) for s in toc[section]])
    return result


def _get_checker_names():
    return [name for name in sys.modules['__main__'].__dict__.keys()
            if name.startswith(CHECK_PREFIX)]


def _get_one(language, slug, remove_code_blocks=True):
    filename = PROSE_FILE_FMT.format(language, slug)
    with open(filename, 'r') as reader:
        body = reader.read()
    lines = body.split('\n')
    if remove_code_blocks:
        body = re.sub(r'```.+?```', '', body, flags=re.DOTALL)
    return (slug, filename, body, lines)


def _get_toc():
    '''
    Read the table of contents and return ToC section.
    '''
    with open(CONFIG_FILE, 'r') as reader:
        return yaml.load(reader)['toc']


def _ignore_file(x):
    return x.endswith('~') or ('__pycache__' in x)


def _match_body(content, pattern, flatten=None):
    '''
    Find all matches in all bodies, splitting and flattening if asked to do so.
    '''
    pat = re.compile(pattern, re.DOTALL)
    result = set()
    for (slug, filename, body, lines) in content:
        result |= set(pat.findall(body))
    if flatten is not None:
        result = _match_flatten(result, flatten)
    return result


def _match_lines(content, pattern, flatten=None):
    '''
    Find all matches in all lines, splitting and flattening if asked to do so.
    '''
    pat = re.compile(pattern)
    result = set()
    for (slug, filename, body, lines) in content:
        for line in lines:
            result |= set(pat.findall(line))
    if flatten is not None:
        result = _match_flatten(result, flatten)
    return result


def _match_flatten(matches, splitter):
    '''
    Flatten a list of multiple matches.
    '''
    return {individual for group in matches for individual in group.split(splitter)}


def _usage(status=1):
    print('usage: check.py language verb')
    for name in _get_checker_names():
        func = globals()[name]
        print('{:10s}: {}'.format(name.replace(CHECK_PREFIX, ''), func.__doc__.strip()))
    sys.exit(status)


if __name__ == '__main__':
    if len(sys.argv) != 3:
        _usage()
    main(sys.argv[1], sys.argv[2])
