#!/usr/bin/env python

'''Merge glossary files, optionally keeping only selected terms.'''

import sys
import getopt
import yaml


USAGE = 'merge [-h] [-w wordlist | -] glossary [glossary...]'


def main():
    '''Main driver.'''
    wordList, glossaryFiles = parseArgs()
    glossary = readAndMerge(glossaryFiles)
    if wordList:
        glossary = keepOnly(glossary, wordList)
    glossary = listSort(glossary)
    yaml.dump(glossary, sys.stdout, encoding='utf-8')


def parseArgs():
    '''Parse command-line arguments, reading keep list if provided.'''

    wordList = None
    options, filenames = getopt.getopt(sys.argv[1:], 'hw:')
    for (opt, arg) in options:
        if opt == '-h':
            print(USAGE)
            sys.exit(0)
        elif opt == '-w':
            wordList = arg
        else:
            print(USAGE, sys.stderr)
            sys.exit(1)

    if not filenames:
        print(USAGE, sys.stderr)
        sys.exit(1)

    if wordList == '-':
        wordList = [x.strip() for x in sys.stdin]
    elif wordList is not None:
        with open(wordList, 'r') as reader:
            wordList = [x.strip() for x in reader]

    return wordList, filenames


def readAndMerge(filenames):
    '''Read all glossaries, returning merged version.'''

    combined = {}
    for f in filenames:
        with open(f, 'r', encoding='utf-8') as reader:
            new = yaml.load(reader, Loader=yaml.FullLoader)
            for entry in new:
                for key in entry:
                    if (type(entry[key]) == dict) and ('def' in entry[key]):
                        entry[key]['def'] = entry[key]['def'].strip()
                combined[entry['slug']] = entry
    return combined


def keepOnly(glossary, wordList):
    '''Keep only the listed entries.'''
    
    result, missing = {}, False
    for word in wordList:
        if word not in glossary:
            print(f'Unknown word {word}', file=sys.stderr)
            missing = True
        else:
            result[word] = glossary[word]

    if missing:
        sys.exit(1)
    return result


def listSort(glossary):
    '''Convert glossary to list sorted by slug.'''
    glossary = [x for x in glossary.values()]
    glossary.sort(key=lambda x: x['slug'])
    return glossary


if __name__ == '__main__':
    main()
