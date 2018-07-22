#!/usr/bin/env python

'''
Post-process what Pandoc produces from the book's Markdown.
I'm not proud of this...
'''

import sys
import re
import yaml


STRINGS = [(r'\/-', '-'),
           (r'\begin{center}\rule{0.5\linewidth}{\linethickness}\end{center}', ''),
           (r'\def\labelenumi{\arabic{enumi}.}', '')]
UNTEX = [('_', r'\_'), ('%', r'\%'), ('#', r'\#'), ('\n', ' ')]
STACK = []


def main(linksPath):
    doc = sys.stdin.read()
    for (src, dst) in STRINGS:
        doc = doc.replace(src, dst)
    doc = headerOnce.pattern.sub(headerOnce, doc, count=1)
    for func in FUNCS:
        doc = func.pattern.sub(func, doc)
    doc = hrefSub(doc, linksPath)
    sys.stdout.write(doc)
    while STACK:
        print(STACK.pop())


def rxc(r):
    return re.compile(r, re.DOTALL)


def headerOnce(m):
    data = yaml.load(m.group(1))
    title = untex(data['title'])
    label = data['permalink'].strip('/').split('/')[1]
    result = r'\chapter{' + title + r'}\label{s:' + label + '}\n'
    if 'objectives' in data:
        result += '\\begin{objectives}\n'
        result += '\n'.join(r'\item ' + untex(obj) + '\n' for obj in data['objectives'])
        result += '\\end{objectives}\n'
    return result
headerOnce.pattern = rxc(r'\\begin{verbatim}(.+?)\\end{verbatim}')


def appref(m):
    return r'\appref{' + m.group(1) + '}'
appref.pattern = rxc(r'\\protect\\hyperlink{APPENDIX}{(.+?)}')


def chapref(m):
    return r'\chapref{' + m.group(1) + '}'
chapref.pattern = rxc(r'\\protect\\hyperlink{CHAPTER}{(.+?)}')


def cite(m, subPat = re.compile(r'\\protect\\hyperlink{CITE}{(.+?)}')):
    cites = subPat.findall(m.group(1))
    result = r'\cite{' + ','.join(cites) + '}'
    return result
cite.pattern = rxc(r'{\[}(\\protect\\hyperlink{CITE}{.+?,?}+?){\]}')


def figref(m):
    return r'\figref{' + m.group(1) + '}'
figref.pattern = rxc(r'\\protect\\hyperlink{FIGURE}{(f:.+?)}')


def figure(m):
    body = m.group(1)
    src = figure.src.search(body).group(1).replace('../../', '../').replace('.svg', '.pdf')
    title = figure.title.search(body).group(1)
    ident = figure.ident.search(body).group(1)
    return figure.template.format(src, title, ident)
figure.pattern = rxc(r'\\begin{verbatim}\s*FIGURE\s*(.+?)\\end{verbatim}')
figure.src = re.compile('src\s*=\s*"(.+?)"')
figure.title = re.compile('title\s*=\s*"(.+?)"')
figure.ident = re.compile('ident\s*=\s*"(.+?)"')
figure.template = '''
\\begin{{figure}}
\\centering
\\includegraphics{{{}}}
\\caption{{{}}}
\\label{{{}}}
\\end{{figure}}
'''


def glossdef(m):
    prefix = ''
    if glossdef.first:
        prefix = '\\begin{description}\n'
        STACK.append(r'\end{description}')
        glossdef.first = False
    return prefix + r'\glossdef{' + m.group(2) + '}{' + m.group(1) + '}'
glossdef.pattern = rxc(r'\\textbf{(.+?)}\\{:\\#(g:.+?)\\}')
glossdef.first = True


def glossref(m):
    return r'\glossref{' + m.group(1) + '}{' + m.group(2) + '}'
glossref.pattern = rxc(r'\\protect\\hyperlink{(g:.+?)}{(.+?)}')


def hyperlink(m):
    return r'\href{' + m.group(2) + '}{' + m.group(1) + '}'
hyperlink.pattern = rxc(r'{\[}([^}]+?){\]}{\[}(.+?){\]}')


def secref(m):
    return r'\secref{' + m.group(1) + '}'
secref.pattern = rxc(r'\\protect\\hyperlink{SECTION}{(.+?)}')


def sectionLabel(m):
    title = untex(m.group(1))
    label = m.group(2)
    return r'\section{' + title + r'}\label{' + label + '}'
sectionLabel.pattern = rxc(r'\\hypertarget{.+?}{%\s+\\subsection{(.+?)\s*\\{\\#(s:.+?)\\}}\\label{.+?}}')


def sectionStar(m):
    return r'\section*{' + m.group(1) + '}'
sectionStar.pattern = rxc(r'\\hypertarget{.+?}{%\s*\\subsection{(.+?)}\\label{.+?}}')


def subsectionLabel(m):
    title = untex(m.group(1))
    label = m.group(2)
    return r'\subsection*{' + title + r'}\label{' + label + '}'
subsectionLabel.pattern = rxc(r'\\hypertarget{.+?}{%\s+\\subsubsection{(.+?)\s*\\{\\#(s:.+?)\\}}\\label{.+?}}')


def subsectionStar(m):
    return r'\subsection*{' + untex(m.group(1)) + '}'
subsectionStar.pattern = rxc(r'\\hypertarget{.+?}{%\s+\\subsubsection{(.+?)}\\label{.+?}}')


FUNCS = [appref, chapref, cite, figref, figure, glossdef, glossref,
         hyperlink, secref, sectionLabel, sectionStar,
         subsectionLabel, subsectionStar]


def hrefSub(doc, linksPath):
    with open(linksPath, 'r') as reader:
        defs = re.compile(r'\[(.+?)\]\s*:\s*(.+)')
        links = [defs.search(line) for line in reader.readlines()]
        links = dict([(m.group(1), untex(m.group(2))) for m in links if m])

    def replaceUse(m):
        return r'\href{' + links.get(m.group(1), 'MISSING') + '}{' + m.group(2) + '}'

    uses = rxc(r'\\href{(.+?)}{(.+?)}')
    doc = uses.sub(replaceUse, doc)
    return doc


def untex(x):
    for (src, dst) in UNTEX:
        x = x.replace(src, dst)
    return x


if __name__ == '__main__':
    if len(sys.argv) != 2:
        sys.stderr.write('Usage: texpost.py /path/to/links.md < src > dst\n')
        sys.exit(1)
    main(sys.argv[1])
