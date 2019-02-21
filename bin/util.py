'''
Utilities.
'''

import sys
import os
import re
import json
import yaml


CHARACTERS = {
    'ç': r"\c{c}",
    'é': r"\'{e}",
    'ë': r'\"{e}',
    'ö': r'\"{o}'
}
CONFIG_FILE = '_config.yml'             # Jekyll configuration file
PROSE_FILE_FMT = '_{}/{}.md'            # lesson or appendix (%language, %slug)
CROSSREF_FMT = '_data/{}_toc.json'      # cross-reference file (%language)


def get_all_docs(config_file, language, with_index=True, remove_code_blocks=True):
    '''
    Return a list of (slug, filename, body, lines) tuples from the table of contents,
    including ('index', 'lang/index.md', lines) unless told not to.
    '''
    result = []
    if with_index:
        result.append(get_doc(language, 'index', remove_code_blocks=remove_code_blocks))
    toc = get_toc(config_file)
    for section in toc:
        result.extend([get_doc(language, s, remove_code_blocks=remove_code_blocks)
                       for s in toc[section]])
    return result


def get_crossref(language):
    '''
    Get the cross-reference file for a language.
    '''
    filename = CROSSREF_FMT.format(language)
    with open(filename, 'r') as reader:
        return json.load(reader)


def get_doc(language, slug, remove_code_blocks=True):
    '''
    Get a single document.
    '''
    filename = PROSE_FILE_FMT.format(language, slug)
    with open(filename, 'r') as reader:
        body = reader.read()
    lines = body.split('\n')
    if remove_code_blocks:
        body = re.sub(r'```.+?```', '', body, flags=re.DOTALL)
    return (slug, filename, body, lines)


def get_funcs(module, prefix):
    '''
    Get all functions that match a prefix.
    '''
    contents = module.__dict__
    return {name:contents[name]
            for name in contents.keys()
            if name.startswith(prefix)}


def get_header(body):
    '''
    Extract the YAML header as a block of text.
    '''
    second = body.find('---', len('---'))
    return body[3:second].strip()


def get_main_div(reader):
    '''Read main div from input.'''

    lines = reader.readlines()
    start = end = None
    for (i, line) in enumerate(lines):
        if '<!-- begin: main -->' in line:
            start = i
        elif '<!-- end: main -->' in line:
            end = i
            break
    sys.stdout.writelines(lines[start:end+1])


def get_toc(config_file):
    '''
    Read the table of contents and return ToC section.
    '''
    with open(config_file, 'r') as reader:
        return yaml.load(reader)['toc']


def is_undone(body):
    '''
    Is this document undone?
    '''
    pat = re.compile('^undone:\s+true', flags=re.MULTILINE)
    return pat.search(get_header(body)) is not None


def report(title, group, values):
    '''
    Report missing/unused values.
    '''
    if values:
        print('{}: {}'.format(title, group))
        for v in sorted(values):
            print('  ', v)


def unheader(lines):
    '''
    Remove YAML header, returning remaining lines.
    '''
    count = 0
    for (i, line) in enumerate(lines):
        if line.startswith('---'):
            count += 1
            if count == 2:
                break
    return lines[i+1:]


def uncode(lines):
    '''
    Remove code blocks.
    '''
    echo = True
    result = []
    for line in lines:
        if line.startswith('```') or line.startswith('~~~'):
            echo = not echo
        elif echo:
            result.append(line)
    return result


def usage(message, status=1):
    '''Display a usage message.'''
    print('Usage: {}'.format(message), file=sys.stderr)
    sys.exit(status)
