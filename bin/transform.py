#!/usr/bin/env python

'''
Do pre- and post-transformations required to produce clean LaTeX from Pandoc's Markdown-to-LaTeX.
'''

import sys
import os
import re
from util import CHARACTERS, usage, get_crossref, get_toc

PATH_TO_ROOT = '../../' # from TeX directory to root of project

#-------------------------------------------------------------------------------

class Base(object):
    '''
    Base transformation does nothing in either pre or post phase,
    but is a convenient place to put utilities.
    '''

    def __init__(self, crossref, include_dir):
        self.crossref = crossref
        self.include_dir = include_dir

    def pre(self, lines):
        '''Pre-process.'''

        return lines

    def post(self, lines):
        '''Post-process.'''

        return lines

    def _regexp(self, lines, pat, fmt):
        '''Handle line-by-line regular expression replacement.'''

        pat = re.compile(pat)
        def f(match):
            return fmt.format(*match.groups())
        return [pat.sub(f, s) for s in lines]

    def _replace(self, lines, before, after):
        '''Handle line-by-line direct string substitution.'''

        return [s.replace(before, after) for s in lines]


class ExerciseAndSolution(Base):
    '''
    Turn <section>...<h3>exercise title</h3>...<aside>...</aside>...</section>
    into section and subsection markers.
    '''

    def pre(self, lines):
        change = False
        result = []
        pat = re.compile(r'<h3[^>]*>(.+)</h3>')
        for line in lines:
            if '<section>' in line:
                change = True
            elif change and ('<h3' in line):
                m = pat.search(line)
                result.append('==exercise=={}=='.format(m.group(1)))
                change = False
            elif '<aside>' in line:
                result.append('==solution==')
            elif '</aside>' in line:
                pass
            elif '</section>' in line:
                pass
            else:
                result.append(line)
        return result

    def post(self, lines):
        result = []
        pat = re.compile(r'==exercise==(.+)==')
        for line in lines:
            if '==exercise==' in line:
                m = pat.search(line)
                result.append('\\subsubsection*{{{}}}'.format(m.group(1)))
            elif '==solution==' in line:
                result.append('\\paragraph{Solution}\n')
            else:
                result.append(line)
        return result


class ReplaceInclusion(Base):
    '''
    HTML file inclusion marker: <div markdown="1" replacement="path-to-file.tex">...</div>
    =>
    LaTeX: content of file
    '''

    def pre(self, lines):
        start = re.compile(r'<div\s+replacement="([^"]+)">')
        end = re.compile(r'</div>')
        echo = True
        result = []
        for line in lines:
            if echo:
                m = start.search(line)
                if m:
                    echo = False
                    result.append('==include=={}==\n'.format(m.group(1)))
                else:
                    result.append(line)
            else:
                m = end.search(line)
                if m:
                    echo = True
        return result

    def post(self, lines):
        pat = re.compile(r'==include==([^=]+)==')
        result = []
        for line in lines:
            m = pat.search(line)
            if m:
                filename = os.path.join(self.include_dir, m.group(1))
                with open(filename, 'r') as reader:
                    content = reader.readlines()
                    result.extend(content)
            else:
                result.append(line)
        return result


class PdfToSvg(Base):
    '''
    LaTeX: /figures/FILENAME.svg => /figures/FILENAME.pdf
    '''

    def post(self, lines):
        return self._regexp(lines,
                            r'/figures/(.+)\.svg}',
                            r'/figures/{0}.pdf}}')


class SpecialCharacters(Base):
    '''
    LaTeX: accented characters replaced by LaTeX escapes.
    '''

    def post(self, lines):
        def _regexpall(s):
            for (raw, latex) in CHARACTERS.items():
                s = s.replace(raw, latex)
            return s
        return [_regexpall(s) for s in lines]


class CodeBlock(Base):
    '''
    HTML div opening language block: <div ... class="language-LANG"...>...</div>
    =>
    LaTeX listing with language: \begin{minted}{language}...\end{minted}
    '''

    def pre(self, lines):
        return self._regexp(lines,
                            r'(<div[^>]* class="language-([^ ]+)[^>]*>)',
                            r'==language=={1}=={0}')

    def post(self, lines):
        lines = self._squash(lines)
        lines = self._regexp(lines,
                             r'==language==([^=]+)==\\begin{verbatim}',
                             r'\begin{{minted}}[fontsize=\small]{{{0}}}')
        lines = self._replace(lines,
                              r'\begin{verbatim}',
                              '% FIXME\n\\begin{minted}{text}')
        lines = self._replace(lines,
                              r'\end{verbatim}',
                              r'\end{minted}')
        return lines

    def _squash(self, lines):
        '''
        Remove blank line(s) put after the language marker by Pandoc
        so that post-processing can do a single-line match.
        '''
        result = []
        pat = re.compile(r'==language==([^=]+)==')
        language = None
        for line in lines:
            if language:
                if not line.strip():
                    pass
                else:
                    result.append('==language=={}=={}'.format(language, line))
                    language = None
            else:
                m = pat.search(line)
                if m:
                    language = m.group(1)
                else:
                    result.append(line)
        return result

class CrossRef(Base):
    '''
    HTML cross-reference: <a class="xref" href="../SLUG/#s:IDENT">WORD NUMBER</a>
    =>
    LaTeX: WORD~\ref{#s:IDENT}
    '''

    def pre(self, lines):
        return self._regexp(lines,
                            r'<a\s+href="#REF">([^<]+)</a>',
                            r'==crossref=={0}==')

    def post(self, lines):
        pat = re.compile(r'==crossref==([^=]+)==')
        def f(match):
            key = match.group(1)
            return r'{}~\ref{{{}}}'.format(self.crossref[key]['text'], key)
        return [pat.sub(f, s) for s in lines]


class Table(Base):
    '''
    HTML table: <table title="TITLE" id="t:LABEL">...</table>
    =>
    LaTeX: \begin{table}\label{LABEL}\begin{longtable}...\end{longtable}\caption{TITLE}\end{table}
    '''

    def pre(self, lines):
        return self._regexp(lines,
                            r'(<table\s+title="([^"]+)"\s+id="([^"]+)">)',
                            '==table=={2}=={1}\n{0}')

    def post(self, lines):
        pat = re.compile(r'==table==([^=]+)==(.+)')
        result = []
        table_id = None
        table_caption = None
        for line in lines:
            m = pat.search(line)
            if m:
                table_id = m.group(1)
                table_caption = m.group(2)
            elif table_id and (r'\begin{longtable}' in line):
                result.append('\\begin{{table}}\\label{{{0}}}\n'.format(table_id))
                result.append(line)
            elif table_id and (r'\end{longtable}' in line):
                result.append(line)
                result.append('\\caption{{{0}}}\n'.format(table_caption))
                result.append('\\end{table}\n')
                table_id = None
                table_caption = None
            else:
                result.append(line)
        return result


#-------------------------------------------------------------------------------

class BaseRegexp(Base):
    '''
    General HTML-to-temp-to-LaTeX transformation.
    Expects class variable MATCH_HTML, WRITE_TEMP, MATCH_TEMP, WRITE_LATEX
    '''

    def pre(self, lines):
        return self._regexp(lines, self.MATCH_HTML, self.WRITE_TEMP)

    def post(self, lines):
        return self._regexp(lines, self.MATCH_TEMP, self.WRITE_LATEX)


class Citation(BaseRegexp):
    '''
    HTML: hyperlink to multiple bibliography citations
    =>
    LaTeX: \cite{citations}
    '''
    MATCH_HTML = r'<a href="#BIB">([^<]+)</a>'
    WRITE_TEMP = r'==citation=={0}=='
    MATCH_TEMP = r'==citation==([^=]+)=='
    WRITE_LATEX = r'\cite{{{0}}}'


class GlossaryEntry(BaseRegexp):
    '''
    HTML glossary key: <strong id="g:LABEL">TEXT</strong>'
    =>
    LaTeX: \hypertarget{g:LABEL}{TEXT}\label{g:LABEL}
    '''
    MATCH_HTML = r'<strong id="(g:[^"]+)">([^<]+)</strong>'
    WRITE_TEMP = r'<strong>==glossary=={0}=={1}==</strong>'
    MATCH_TEMP = r'==glossary==([^=]+)==([^=]+)=='
    WRITE_LATEX = r'\hypertarget{{{0}}}{{{1}}}\label{{{0}}}'


class Figure(BaseRegexp):
    '''
    HTML figure: <figure id="f:LABEL"> <img src="PATH"> <figcaption>TEXT</figcaption> </figure>
    =>
    LaTeX: \begin{figure}\label{f:LABEL}\centering\includegraphics{PATH}\caption{TEXT}\end{figure}
    '''
    MATCH_HTML = r'<figure\s+id="(f:.+)">\s*<img\s+src="(.+)"\s*/>\s*<figcaption>(.+)</figcaption>\s*</figure>'
    WRITE_TEMP = r'==figure=={0}=={1}=={2}=='
    MATCH_TEMP = r'==figure==(.+)==(.+)==(.+)=='
    WRITE_LATEX = r'''\begin{{figure}}
\centering
\includegraphics{{PATH_TO_ROOT{1}}}
\caption{{{2}}}
\label{{{0}}}
\end{{figure}}'''.replace('PATH_TO_ROOT', PATH_TO_ROOT)


class FigureRef(BaseRegexp):
    '''
    References to figures.
    '''
    MATCH_HTML = r'<a href="#FIG">(f:[^<]+)</a>'
    WRITE_TEMP = r'==figureref=={0}=='
    MATCH_TEMP = r'==figureref==([^=]+)=='
    WRITE_LATEX = r'Figure~\ref{{{0}}}'


class TableRef(BaseRegexp):
    '''
    References to tables.
    '''
    MATCH_HTML = r'<a href="#TBL">(t:[^<]+)</a>'
    WRITE_TEMP = r'==tableref=={0}=='
    MATCH_TEMP = r'==tableref==([^=]+)=='
    WRITE_LATEX = r'Table~\ref{{{0}}}'


class Noindent(BaseRegexp):
    '''
    HTML embedded command comment: <!-- == COMMMAND -->
    =>
    LaTeX command: COMMAND
    '''
    MATCH_HTML = r'<!-- +== noindent +-->'
    WRITE_TEMP = r'==command==noindent=='
    MATCH_TEMP = r'==command==noindent==\n'
    WRITE_LATEX = r'\noindent'


#-------------------------------------------------------------------------------

class BaseStringMatch(Base):
    '''
    General temp-to-LaTeX transformation with pure string matching.
    Expects class variables MATCH_TEMP and WRITE_LATEX.
    '''

    def post(self, lines):
        return self._replace(lines, self.MATCH_TEMP, self.WRITE_LATEX)


class Quote(BaseStringMatch):
    '''
    LaTeX: unindent quotations.
    '''
    MATCH_TEMP = r'\begin{quote}'
    WRITE_LATEX = r'\begin{quote}\setlength{\parindent}{0pt}'


class BibliographyTitle(BaseStringMatch):
    '''
    LaTeX: don't number the bibliography as a chapter.
    '''
    MATCH_TEMP = r'\chapter{Bibliography}'
    WRITE_LATEX = r'\chapter*{Bibliography}'


class FrontMatter(BaseStringMatch):
    '''
    LaTeX: add \frontmatter command.
    '''
    MATCH_TEMP = '==frontmatter=='
    WRITE_LATEX = '\\frontmatter'


class MainMatter(BaseStringMatch):
    '''
    LaTeX: add \mainmatter command.
    See https://tex.stackexchange.com/questions/369854/memoir-chapter-based-figure-numbering
    '''
    MATCH_TEMP = '==mainmatter=='
    WRITE_LATEX = '\\mainmatter\n\\counterwithout{figure}{chapter}\n\\counterwithout{table}{chapter}'


class Midpoint(BaseStringMatch):
    '''
    LaTeX: add marker for bibliography and the switch to appendices at midpoint.
    '''
    MATCH_TEMP = '==midpoint=='
    WRITE_LATEX = '\\bibliographystyle{abstract}\n\\bibliography{book}\n\\appendix'


class Section(BaseStringMatch):
    '''
    LaTeX: turn sections into chapters.
    '''
    MATCH_TEMP = r'\section'
    WRITE_LATEX = r'\chapter'


class Subsection(BaseStringMatch):
    '''
    LaTeX: turn subsections into sections.
    '''
    MATCH_TEMP = r'\subsection'
    WRITE_LATEX = r'\section'


class Subsubsection(BaseStringMatch):
    '''
    LaTeX: turn subsubsections into subsections.
    '''
    MATCH_TEMP = r'\subsubsection'
    WRITE_LATEX = r'\subsection'


class Newline(BaseStringMatch):
    '''
    LaTeX: represent literal newline properly.
    '''
    MATCH_TEMP = r'\texttt{\n}'
    WRITE_LATEX = r'\texttt{\textbackslash n}'

#-------------------------------------------------------------------------------

# All handlers.
HANDLERS = [
    ExerciseAndSolution,
    ReplaceInclusion,
    GlossaryEntry,
    CrossRef,
    Figure,
    FigureRef,
    Table,
    TableRef,
    Noindent,
    CodeBlock,
    Citation,
    Newline,
    PdfToSvg,
    Quote,
    Section,
    Subsection,
    Subsubsection,
    BibliographyTitle,
    FrontMatter,
    MainMatter,
    Midpoint,
    SpecialCharacters
]

def main(which, language, include_dir):
    '''
    Apply all pre- or post-processing handlers.
    '''
    lines = sys.stdin.readlines()
    crossref = get_crossref(language)
    for handler in HANDLERS:
        h = handler(crossref, include_dir)
        lines = getattr(h, which)(lines)
    sys.stdout.writelines(lines)


if __name__ == '__main__':
    USAGE = 'transform.py [--pre | --post] language include_dir'
    if len(sys.argv) != 4:
        usage(USAGE)
    elif sys.argv[1] not in ['--pre', '--post']:
        usage(USAGE)
    else:
        main(sys.argv[1].lstrip('-'), sys.argv[2], sys.argv[3])
