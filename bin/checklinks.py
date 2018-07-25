#!/usr/bin/env python

import sys
import re

from texpost import readLinks

LINK_PAT = re.compile(r'\[([^\]]+?)\]\[([^\]]+?)\]', re.DOTALL)


def main(linksPath, filenames):
    links = readLinks(linksPath)
    for f in filenames:
        with open(f, 'r') as reader:
            doc = reader.read()
            for m in LINK_PAT.finditer(doc):
                if m.group(2) not in links:
                    print('{}: [{}][{}]'.format(f, m.group(1), m.group(2)))


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2:])

