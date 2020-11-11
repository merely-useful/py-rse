#!/usr/bin/env python

import sys


def main():
    limit = int(sys.argv[1])
    problems = find_problems(limit, sys.argv[2:])
    if (problems):
        report(limit, problems)


def find_problems(limit, filenames):
    result = []
    for filename in filenames:
        with open(filename, 'r') as reader:
            for (i, line) in enumerate(reader):
                line = line.rstrip()
                if len(line) > limit:
                    result.append([filename, str(i), line])
    return result


def report(limit, problems):
    first = max([len(entry[0]) for entry in problems])
    second = max([len(entry[1]) for entry in problems])
    fmt = '{{0:{0}s}} {{1:{1}s}} {{2:{2}s}}'.format(first, second, limit)
    print(fmt.format(' ' * first, ' ' * second, '-' * limit))
    for problem in problems:
        print(fmt.format(*problem))


if __name__ == '__main__':
    main()
