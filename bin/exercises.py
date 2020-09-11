#!/usr/bin/env python

'''Check that exercises have solutions and solutions have exercises.'''


import sys
import re
from util import report


PAT_EXERCISE = re.compile(r'^###\s+.+?\{#(.+?)\}', re.MULTILINE + re.DOTALL)
PAT_SOLUTION = re.compile(r'^###\s+Exercise.+?\((.+?)\)', re.MULTILINE + re.DOTALL)


def main():
    '''Main driver.'''
    filenames = sys.argv[1:]
    exercise, solution = scan(filenames)
    report('Exercise but not solution', exercise - solution)
    report('Solution but not exercise', solution - exercise)


def scan(filenames):
    exercise = set()
    solution = set()
    for f in filenames:
        with open(f, 'r') as reader:
            text = reader.read()
            defs = PAT_EXERCISE.findall(text)
            exercise |= set([d for d in defs if '-ex-' in d])
            solution |= set(PAT_SOLUTION.findall(text))
    return exercise, solution


if __name__ == '__main__':
    main()
