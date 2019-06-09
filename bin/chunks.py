#!/usr/bin/env python

'''
chunks.py [source_file...]

Check that all chunks are either naked (no language spec) or have a recognizable
language and a label.  If no source files are given, reads from standard input.
'''


import sys
import re
from util import LANGUAGES, read_all_files, report


MARKER = '```'
RICH_MARKER = re.compile(r'^```\{(.+?)\s+([^=,]+)(,\s*.+=.+)*\s*}$')


def main(source_files):
    '''Main driver.'''

    chunks = read_all_files(source_files, get_chunks)
    chunks = {c for c in chunks if bad_chunk(c)}
    report('Bad Chunks', chunks)


def get_chunks(filename, reader):
    '''Extract chunk headers.'''

    result = set()
    in_chunk = False
    for (i, line) in enumerate(reader):
        if line.startswith(MARKER):
            marker = line.rstrip()
            if in_chunk:
                assert marker == MARKER, \
                    f'Badly-formed end of chunk {filename}:{i}'
                in_chunk = False
            else:
                result.add((filename, i+1, marker))
                in_chunk = True

    return result


def bad_chunk(chunk):
    '''Is this a badly formed chunk?'''

    filename, line_number, marker = chunk

    # Naked chunk (plain text).
    if marker == MARKER:
        return False

    # Doesn't match pattern for rich chunk header.
    match = RICH_MARKER.search(marker)
    if not match:
        return True

    # Unknown language.
    language, label = match.group(1), match.group(2)
    if language not in LANGUAGES:
        return True

    # No reason to reject.
    return False


if __name__ == '__main__':
    main(sys.argv[1:])
