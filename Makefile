# Check that language is set.  Do NOT set 'LANG', as that would override the platform's LANG setting.
ifndef lang
$(error Must set 'lang' with 'lang=en' or similar.)
endif

# Tools.
JEKYLL=jekyll
LATEX=pdflatex
BIBTEX=bibtex
PANDOC=pandoc
PANDOC_FLAGS=--from=markdown --to=latex
REPO=FIXME

# Language-dependent settings.
DIR_MD=_chapters_${lang}
DIR_TEX=tex_${lang}
DIR_WEB=_site/${lang}
WORDS_SRC=misc/${lang}.txt

# Filesets.
ALL_MD=$(wildcard ${DIR_MD}/*.md)
BIB_SRC=${DIR_TEX}/book.bib
CHAPTERS_MD=$(filter-out ${DIR_MD}/bib.md ${DIR_MD}/index.md,${ALL_MD})
CHAPTERS_TEX=$(patsubst ${DIR_MD}/%.md,${DIR_TEX}/inc/%.tex,${CHAPTERS_MD})
EXTRAS_TEX=$(wildcard misc/*.tex)
ALL_TEX=${CHAPTERS_TEX} ${DIR_TEX}/book.tex ${DIR_TEX}/frontmatter.tex
CHAPTERS_HTML=$(patsubst ${DIR_MD}/%.md,${DIR_WEB}/%.html,${ALL_MD})
ALL_HTML=all-${lang}.html

# Controls
.PHONY : commands serve site bib crossref clean
all : commands

## commands    : show all commands.
commands :
	@grep -h -E '^##' Makefile | sed -e 's/## //g'

## serve       : run a local server.
serve :
	${JEKYLL} serve -I

## site        : build files but do not run a server.
site :
	${JEKYLL} build

## single      : regenerate all-in-one version of book.
single : ${ALL_HTML}

${ALL_HTML} : _config.yml files/crossref.js bin/mergebook.py
	bin/mergebook.py ${lang} _config.yml files/crossref.js ${DIR_WEB} > $@

## pdf         : build PDF version of book.
pdf : ${DIR_TEX}/book.pdf

## tex         : generate LaTeX for book, but don't compile to PDF.
tex : ${CHAPTERS_TEX}

${DIR_TEX}/book.pdf : ${ALL_TEX} ${BIB_SRC}
	@cd ${DIR_TEX} \
	&& ${LATEX} book \
	&& ${BIBTEX} book \
	&& ${LATEX} book \
	&& ${LATEX} book \
	&& ${LATEX} book

${DIR_TEX}/inc/%.tex : _config.yml ${DIR_MD}/%.md bin/texpre.py bin/texpost.py _includes/links.md
	mkdir -p ${DIR_TEX}/inc && \
	cat $< \
	| bin/texpre.py _config.yml \
	| ${PANDOC} ${PANDOC_FLAGS} -o - \
	| bin/texpost.py _includes/links.md \
	> $@

## bib         : rebuild Markdown bibliography from BibTeX source.
bib : ${DIR_MD}/bib.md

${DIR_MD}/bib.md : ${BIB_SRC} bin/bib2md.py
	bin/bib2md.py ${lang} < $< > $@

## crossref    : rebuild cross-reference file.
crossref : files/crossref.js

files/crossref.js : bin/crossref.py _config.yml ${ALL_MD}
	bin/crossref.py ${DIR_MD} < _config.yml > files/crossref.js

## ----------------------------------------

## check       : check everything.
check :
	@make lang=${lang} checkchars
	@make lang=${lang} checkcites
	@make lang=${lang} checkgloss
	@make lang=${lang} checklabels
	@make lang=${lang} checklinks
	@make lang=${lang} checktoc

## checkchars  : look for non-ASCII characters.
checkchars :
	@bin/checkchars.py ${ALL_MD}

## checkcites  : list all missing bibliography entries.
checkcites :
	@bin/checkcites.py --missing ${BIB_SRC} ${CHAPTERS_TEX}

## checkgloss  : check that all glossary entries are defined and used.
checkgloss :
	@bin/checkgloss.py ${ALL_MD}

## checklabels : make sure all labels conform to standards.
checklabels :
	@bin/checklabels.py ${CHAPTERS_TEX}

## checklinks  : check that all links in source Markdown resolve.
checklinks :
	@bin/checklinks.py _includes/links.md ${ALL_MD}

## checktoc    : check consistency of tables of contents.
checktoc :
	@bin/checktoc.py _config.yml ${DIR_TEX}/book.tex ${ALL_MD}

## ----------------------------------------

## authors     : list all authors.
authors :
	@bin/authors.py ${BIB_SRC}

## issues      : create single-page view of all GitHub issues.
issues :
	@bin/issues.py ${REPO} | ${PANDOC} -o issues.html -

## pages       : count pages per chapter.
pages : ${DIR_TEX}/book.toc
	@bin/pages.py < ${DIR_TEX}/book.toc

## publishers  : list all publishers.
publishers :
	@bin/fields.py ${BIB_SRC} publisher

## spelling    : check spelling.
spelling :
	@grep bibnote ${BIB_SRC} \
	| cat - ${CHAPTERS_MD} \
	| aspell --mode=tex list \
	| sort \
	| uniq \
	| comm -2 -3 - ${WORDS_SRC}

## unused      : list all unused bibliography entries.
unused :
	@bin/checkcites.py --unused ${BIB_SRC} ${CHAPTERS_TEX}

## words       : count words per chapter.
words :
	@wc -w ${CHAPTERS_MD} | sort -n -r

## years       : CSV histogram of publication years.
years :
	@bin/years.py ${BIB_SRC}

## ----------------------------------------

## clean       : clean up junk files.
clean :
	@rm -rf _site ${CHAPTERS_TEX} */*.aux */*.bbl */*.blg */*.log */*.out */*.toc
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;

## settings    : show macro values.
settings :
	@echo "JEKYLL=${JEKYLL}"
	@echo "LATEX=${LATEX}"
	@echo "BIBTEX=${BIBTEX}"
	@echo "PANDOC=${PANDOC}"
	@echo "PANDOC_FLAGS=${PANDOC_FLAGS}"
	@echo "REPO=${REPO}"
	@echo "DIR_MD=${DIR_MD}"
	@echo "DIR_TEX=${DIR_TEX}"
	@echo "DIR_WEB=${DIR_WEB}"
	@echo "BIB_SRC=${BIB_SRC}"
	@echo "WORDS_SRC=${WORDS_SRC}"
	@echo "CHAPTERS_MD=${CHAPTERS_MD}"
	@echo "CHAPTERS_TEX=${CHAPTERS_TEX}"
	@echo "CHAPTERS_HTML=${CHAPTERS_HTML}"
