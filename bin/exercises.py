#!/usr/bin/env python

'''
Check that exercises have solutions and solutions have exercises,
all in the correct order.
'''


import sys
import os
import re


PAT_EXERCISE = re.compile(r'^###\s+.+?\{#(.+?)\}', re.MULTILINE + re.DOTALL)
PAT_SOLUTION = re.compile(r'^###\s+Exercise.+?\((.+?)\)', re.MULTILINE + re.DOTALL)


def main():
    '''Main driver.'''
    allSolutions = getSolutions(sys.argv[1])
    for filename in sys.argv[2:]:
        exercises = getExercises(filename)
        if not exercises:
            continue
        subset = subsetSolutions(filename, allSolutions)
        for (ex, sol) in zip(exercises, subset):
            if ex != sol:
                print(ex, sol)


def getSolutions(filename):
    with open(filename, 'r') as reader:
        text = reader.read()
        return [f'{t}\n' for t in PAT_SOLUTION.findall(text)]


def getExercises(filename):
    with open(filename, 'r') as reader:
        text = reader.read()
        return [f'{d}\n' for d in PAT_EXERCISE.findall(text) if '-ex-' in d]


def subsetSolutions(filename, allSolutions):
    stem = os.path.splitext(os.path.basename(filename))[0]
    return [x for x in allSolutions if x.startswith(stem)]


if __name__ == '__main__':
    main()
