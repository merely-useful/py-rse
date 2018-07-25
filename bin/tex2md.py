#!/usr/bin/env python

import sys
import re


def appref(m):
    return '@@appendix@@{}@@'.format(m.group(1))
appref.pattern = re.compile(r'\\appref{(.+?)}')


def chapref(m):
    return '@@chapter@@{}@@'.format(m.group(1))
chapref.pattern = re.compile(r'\\chapref{(.+?)}')


def cite(m):
    return '@@cite@@{}@@'.format(m.group(1))
cite.pattern = re.compile(r'\\cite{(.+?)}')


def figref(m):
    return '@@figure@@{}@@'.format(m.group(1))
figref.pattern = re.compile(r'\\figref{(.+?)}')


def label(m):
    return '@@label@@{}@@'.format(m.group(1))
label.pattern = re.compile(r'\\label{(.+?)}')


def glossdef(m):
    return '@@glossdef@@{}@@{}@@'.format(m.group(1), m.group(2))
glossdef.pattern = re.compile(r'\\glossdef{(.+?)}{(.+?)}')


def glossref(m):
    return '@@glossref@@{}@@{}@@'.format(m.group(1), m.group(2))
glossref.pattern = re.compile(r'\\glossref{(.+?)}{(.+?)}')


def secref(m):
    return '@@section@@{}@@'.format(m.group(1))
secref.pattern = re.compile(r'\\secref{(.+?)}')


def email(m):
    return '@@email@@'
email.pattern = re.compile(r'{\\email}')


def isbn(m):
    return '@@isbn@@'
isbn.pattern = re.compile(r'{\\isbn}')


def repository(m):
    return '@@repository@@'
repository.pattern = re.compile(r'{\\repository}')


def website(m):
    return '@@website@@'
website.pattern = re.compile(r'{\\website}')


def exercise(m):
    return '@@exercise@@{}@@{}@@{}@@'.format(m.group(1), m.group(2), m.group(3))
exercise.pattern = re.compile(r'\\exercise{(.+?)}{(.+?)}{(.+?)}')


FUNCS = [
    appref, chapref, cite, figref, glossdef, glossref, label, secref,
    email, isbn, repository, website,
    exercise
]


startCalloutPat = re.compile(r'\\begin{callout}{(.+)}')
def startCallout(line):
    m = startCalloutPat.search(line)
    if m:
        line = '\\begin{quote}\n\\textbf{' + m.group(1) + '}\n'
    return line


def endCallout(line):
    if r'\end{callout}' in line:
        line = '\\end{quote}\n'
    return line


startObjectivesPat = re.compile(r'\\begin{objectives}')
def startObjectives(line):
    m = startObjectivesPat.search(line)
    if m:
        line = '\\begin{quote}\n\\textbf{After reading this chapter, you will be able to{\\ldots}}\n\\begin{itemize}\n'
    return line


def endObjectives(line):
    if r'\end{objectives}' in line:
        line = '\\end{itemize}\n\\end{quote}\n'
    return line


ENVIRONMENTS = [
    startCallout, endCallout,
    startObjectives, endObjectives
]


def main():
    prefix = ''
    data = sys.stdin.read()
    for func in FUNCS:
        data = func.pattern.sub(func, data)
    for line in data.split('\n'):
        for env in ENVIRONMENTS:
            line = env(line)
        print(line)


if __name__ == '__main__':
    main()
