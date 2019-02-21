# Check that language is set.  Do NOT set 'LANG', as that would override the platform's LANG setting.
ifndef lang
$(warning Please set 'lang' with 'lang=en' or similar.)
lang=en
endif

# Pick up project-specific setting for STEM.
include site.mk

# Tools.
JEKYLL=jekyll
PANDOC=pandoc
LATEX=pdflatex
BIBTEX=bibtex
PYTHON=python

# Language-dependent settings.
CONFIG_YML=_config.yml
DIR_MD=_${lang}
PAGES_MD=$(wildcard ${DIR_MD}/*.md)
BIB_MD=${DIR_MD}/bib.md
TOC_JSON=_data/${lang}_toc.json
DIR_HTML=_site/${lang}
PAGES_HTML=${DIR_HTML}/index.html $(patsubst ${DIR_MD}/%.md,${DIR_HTML}/%/index.html,$(filter-out ${DIR_MD}/index.md,${PAGES_MD}))
DIR_TEX=tex/${lang}
BIB_TEX=${DIR_TEX}/book.bib
ALL_TEX=${DIR_TEX}/all.tex
BOOK_PDF=${DIR_TEX}/${STEM}.pdf

# Controls
all : commands

## commands       : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g'

## serve          : run a local server.
serve : ${CONFIG_YML} ${TOC_JSON}
	${JEKYLL} serve -I

## site           : build files but do not run a server.
site : ${CONFIG_YML} ${TOC_JSON}
	${JEKYLL} build

## pdf            : generate PDF from LaTeX source.
pdf : ${BOOK_PDF}

## bib            : regenerate the Markdown bibliography from the BibTeX file.
bib : ${BIB_MD}

## config         : regenerate Jekyll configuration from .config.yml and site.yml
config : ${CONFIG_YML}

## toc            : regenerate the table of contents JSON file.
toc : ${TOC_JSON}

# ----------------------------------------

# Regenerate PDF once 'all.tex' has been created.
${BOOK_PDF} : ${ALL_TEX} tex/settings.tex ${DIR_TEX}/book.tex ${BIB_TEX}
	cd ${DIR_TEX} \
	&& ${LATEX} --shell-escape -jobname=${STEM} book \
	&& ${BIBTEX} ${STEM} \
	&& ${LATEX} --shell-escape -jobname=${STEM} book \
	&& ${LATEX} --shell-escape -jobname=${STEM} book

# Create the unified LaTeX file (separate target to simplify testing).
${ALL_TEX} : ${PAGES_HTML} bin/get_body.py bin/transform.py ${TOC_JSON}
	${PYTHON} bin/get_body.py _config.yml ${DIR_HTML} \
	| ${PYTHON} bin/transform.py --pre ${lang} _includes \
	| ${PANDOC} --wrap=preserve -f html -t latex -o - \
	| ${PYTHON} bin/transform.py --post ${lang} _includes \
	> ${ALL_TEX}

# Pre-process (for debugging purposes).
test-pre:
	${PYTHON} bin/get_body.py _config.yml ${DIR_HTML} \
	| ${PYTHON} bin/transform.py --pre ${lang} _includes

# Pre-process with Pandoc (for debugging purposes).
test-pandoc:
	${PYTHON} bin/get_body.py _config.yml ${DIR_HTML} \
	| ${PYTHON} bin/transform.py --pre ${lang} _includes \
	| ${PANDOC} --wrap=preserve -f html -t latex -o -

# Create all the HTML pages once the Markdown files are up to date.
${PAGES_HTML} : ${PAGES_MD} ${BIB_MD} ${CONFIG_YML} ${TOC_JSON}
	${JEKYLL} build

# Create the Jekyll configuration file.
${CONFIG_YML}: site.yml .config.yml
	cat $^ > $@

# Create the bibliography Markdown file from the BibTeX file.
${BIB_MD} : ${BIB_TEX} bin/bib2md.py
	bin/bib2md.py ${lang} < ${DIR_TEX}/book.bib > ${DIR_MD}/bib.md

# Create the JSON table of contents.
${TOC_JSON} : ${PAGES_MD} bin/make_toc.py
	bin/make_toc.py _config.yml ${DIR_MD} > ${TOC_JSON}

# Dependencies with HTML file inclusions.
${DIR_HTML}/%/index.html : $(wildcard _includes/%/*.*)

## ----------------------------------------

## check          : check everything.
check : ${CONFIG_YML} ${BIB_MD} ${TOC_JSON}
	@bin/check.py ${lang} all

## check_anchors  : list all incorrectly-formatted H2 anchors.
check_anchors : ${CONFIG_YML}
	@bin/check.py ${lang} anchors

## check_chars     : look for non-ASCII characters.
check_chars :
	@bin/check.py ${lang} chars

## check_cites    : list all missing or unused bibliography entries.
check_cites : ${CONFIG_YML} ${BIB_MD}
	@bin/check.py ${lang} cites

## check_crossref : find all missing cross-references.
check_crossref : ${CONFIG_YML} ${TOC_JSON}
	@bin/check.py ${lang} crossref

## check_figref   : check all figure cross-references.
check_figref : ${CONFIG_YML} ${TOC_JSON}
	@bin/check.py ${lang} figref

## check_figures  : list all missing or unused figures.
check_figures : ${CONFIG_YML}
	@bin/check.py ${lang} figures

## check_gloss    : check that all glossary entries are defined and used.
check_gloss : ${CONFIG_YML}
	@bin/check.py ${lang} gloss

## check_langs    : check that all fenced code blocks have language types.
check_langs : ${CONFIG_YML}
	@bin/check.py ${lang} langs

## check_links    : check that all external links are defined and used.
check_links : ${CONFIG_YML}
	@bin/check.py ${lang} links

## check_pages    : make sure Markdown pages are properly structured.
check_pages : ${CONFIG_YML}
	@bin/check.py ${lang} pages

## check_src      : check source file inclusion references.
check_src : ${CONFIG_YML}
	@bin/check.py ${lang} src

## check_toc      : check consistency of tables of contents.
check_toc : ${CONFIG_YML}
	@bin/check.py ${lang} toc

## fixme          : look for FIXME markers in pages.
#  Output is piped to `cat` to prevent error reports if there are no FIXMEs.
fixme :
	@fgrep -C 1 -n FIXME ${PAGES_MD} | cat

## stats          : report summary statistics of completed chapters.
stats : ${CONFIG_YML}
	@bin/stats.py ${lang}

## ----------------------------------------

## spelling       : compare words against saved list.
spelling :
	@cat ${PAGES_MD} | bin/uncode.py | aspell list | sort | uniq | comm -2 -3 - .words

## undone         : which files have not yet been done?
#  Note: piping to 'cat' so that Make won't report an error if there are no undone chapters.
undone :
	@grep -l 'undone: true' _en/*.md | cat

## ----------------------------------------

## clean          : clean up junk files.
clean :
	@rm -r -f _config.yml _site dist
	@find . -name '*~' -delete
	@find . -name __pycache__ -prune -exec rm -r "{}" \;
	@find . -name '_minted-*' -prune -exec rm -r "{}" \;
	@rm -r -f tex/*/all.tex tex/*/*.aux tex/*/*.bbl tex/*/*.blg tex/*/*.log tex/*/*.out tex/*/*.toc
	@find . -name .DS_Store -prune -exec rm -r "{}" \;

## settings       : show macro values.
settings :
	@echo "CONFIG_YML=${CONFIG_YML}"
	@echo "JEKYLL=${JEKYLL}"
	@echo "DIR_MD=${DIR_MD}"
	@echo "PAGES_MD=${PAGES_MD}"
	@echo "BIB_MD=${BIB_MD}"
	@echo "DIR_HTML=${DIR_HTML}"
	@echo "PAGES_HTML=${PAGES_HTML}"
	@echo "DIR_TEX=${DIR_TEX}"
	@echo "BIB_TEX=${BIB_TEX}"
	@echo "ALL_TEX=${ALL_TEX}"
	@echo "BOOK_PDF=${BOOK_PDF}"
