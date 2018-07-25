#!/usr/bin/env python

import sys
import re


def main():
    starts = [getStart(line) for line in sys.stdin]
    last = starts[-1][2]
    starts = [s for s in starts if s and s[0] in ('chapter', 'part', 'bib', 'appendix')]
    for i in range(len(starts) - 1):
        curr = starts[i][2]
        next = starts[i+1][2]
        starts[i].append(next - curr)
    starts[-1].append(last - starts[-1][2])
    starts = [s for s in starts if s[0] in ('chapter', 'bib', 'appendix')]
    for (kind, title, start, length) in starts:
        print('{:2d} {}'.format(length, title))


StartPat = re.compile(r'^\\contentsline {([^}]+)}{.+{.+}([^}]+)}{(\d+)}')
BibPat = re.compile(r'^\\contentsline {chapter}{Bibliography}{([^}]+)}')
def getStart(line):
    m = StartPat.search(line)
    if m:
        return [m.group(1), m.group(2), int(m.group(3))]
    m = BibPat.search(line)
    if m:
        return ['bib', 'Bibliography', int(m.group(1))]
    return None


if __name__ == '__main__':
    main()
