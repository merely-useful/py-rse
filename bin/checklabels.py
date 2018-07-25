#!/usr/bin/env python

import sys
import os
import re


LABEL = re.compile(r'\\label{(.+?)}')
PREFIXES = {'s', 'f'}
GLOSSDEF = re.compile(r'\\glossdef{(.+?)}')


def main(filenames):
    for fn in filenames:
        stem = os.path.basename(fn)
        if not stem.endswith('.tex'): continue
        stem = stem[:-4]
        with open(fn, 'r') as reader:
            data = reader.read()

        labels = [lbl for lbl in LABEL.findall(data) if not lbl.startswith('#')]
        report('Label too short to be valid', fn,
               [lbl for lbl in labels if len(lbl) < 3])
        report('Bad first character', fn,
               [lbl for lbl in labels if lbl[0] not in PREFIXES])
        report('Expected colon as second character', fn,
               [lbl for lbl in labels if lbl[1] != ':'])
        report('Label does not start with filename stem', fn,
               [lbl for lbl in labels if lbl.split(':')[1].split('-')[0] != stem])

        glossdef = GLOSSDEF.findall(data)
        report('Glossary definition label does not start with g:', fn,
               [lbl for lbl in glossdef if not lbl.startswith('g:')])


def report(title, filename, labels):
    if labels:
        print('{}: {} {}'.format(filename, title, ', '.join(labels)))


if __name__ == '__main__':
    main(sys.argv[1:])
