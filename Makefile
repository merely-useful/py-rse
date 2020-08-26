.PHONY : all clean chapters commands crossrefs fixme html links nbspref proposals settings tex-packages

ALL_HTML=_book/index.html
ALL_PDF=_book/py-rse.pdf
EXTRA=src zipf
GLOSS=${HOME}/glosario

PY_RSE_FILES=\
  _bookdown.yml \
  index.Rmd \
  chapters/bash-basics.Rmd \
  chapters/bash-advanced.Rmd \
  chapters/scripting.Rmd \
  chapters/git-cmdline.Rmd \
  chapters/git-advanced.Rmd \
  chapters/automate.Rmd \
  chapters/config.Rmd \
  chapters/errors.Rmd \
  chapters/teams.Rmd \
  chapters/style.Rmd \
  chapters/testing.Rmd \
  chapters/packaging.Rmd \
  chapters/provenance.Rmd \
  chapters/finale.Rmd \
  chapters/install.Rmd \
  chapters/objectives.Rmd \
  chapters/keypoints.Rmd \
  chapters/solutions.Rmd \
  chapters/anaconda.Rmd \
  chapters/tree.Rmd \
  chapters/yaml.Rmd \
  chapters/ssh.Rmd

COMMON_FILES=\
  _common.R \
  appendix.Rmd \
  LICENSE.md \
  CONDUCT.md \
  CONTRIBUTING.md \
  glossary.md \
  references.Rmd \
  links.md \
  book.bib \
  preamble.tex

#-------------------------------------------------------------------------------

all : commands

## commands : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' | column -t -s ':'

## everything : rebuild all HTML and PDF.
everything : ${ALL_HTML} ${ALL_PDF}

##   py-rse : rebuild RSE PY HTML and PDF.
py-rse : _book/index.html _book/py-rse.pdf

#-------------------------------------------------------------------------------

## html           : build all HTML versions.
html : ${ALL_HTML}

##   py-rse-html : build RSE PY HTML.
py-rse-html : _book/index.html

_book/index.html : ${PY_RSE_FILES} ${COMMON_FILES}
	rm -f py-rse.Rmd
	Rscript -e "options(bookdown.render.file_scope = FALSE); bookdown::render_book(input='index.Rmd', output_format='bookdown::gitbook'); warnings()"
	cp -r ${EXTRA} _book

#-------------------------------------------------------------------------------

## pdf : build PDF version.
pdf : _book/py-rse.pdf

_book/py-rse.pdf : ${PY_RSE_FILES} ${COMMON_FILES}
	rm -f py-rse.Rmd
	Rscript -e "options(bookdown.render.file_scope = FALSE); bookdown::render_book(input='index.Rmd', output_format='bookdown::pdf_book'); warnings()"

#-------------------------------------------------------------------------------

## clean : clean up generated files.
clean :
	@rm -rf _book _bookdown_files py-rse.Rmd
	@rm -f *.aux *.lof *.log *.lot *.out *.toc
	@find . -name '*~' -exec rm {} \;

## chapters : check consistency of chapters.
chapters :
	@make settings | bin/chapters.py _bookdown.yml PY_RSE_FILES chapters/objectives.Rmd chapters/keypoints.Rmd

## crossrefs : check cross-references.
crossrefs :
	@bin/crossrefs.py "RSE PY" ${PY_RSE_FILES} ${COMMON_FILES}

## fixme : list all the FIXME markers
fixme :
	@fgrep FIXME ${PY_RSE_FILES} ${COMMON_FILES}

## glossary : rebuild the Markdown glossary file
glossary :
	echo '# Glossary {#glossary}' > glossary.md
	echo '' >> glossary.md
	${GLOSS}/utils/merge.py ${GLOSS}/glossary.yml ./glossary.yml \
	| bin/glossarize.py glossary-slugs.txt \
	>> glossary.md

## images : check that all images are defined and used.
images :
	@bin/images.py ./figures ${PY_RSE_FILES} ${COMMON_FILES}

## links : check that links and glossary entries are defined and used.
links :
	@bin/links.py ./links.md ./glossary.md ${PY_RSE_FILES} ${COMMON_FILES}

## exercises : check that exercises have solutions and solutions have exercises.
exercises :
	@bin/exercises.py ${PY_RSE_FILES}

## nbspref : check that all cross-references are prefixed with a non-breaking space.
nbspref :
	@bin/nbspref.py ${PY_RSE_FILES} ${COMMON_FILES}

## proposals : regenerate PDFs of proposals.
proposals :
	pandoc -o manning/manning-proposal-2020-07.pdf manning/manning-proposal-2020-07.md
	pandoc -o taylor-francis/taylor-francis-proposal-2020-07.pdf taylor-francis/taylor-francis-proposal-2020-07.md

## settings : echo all variable values.
settings :
	@echo ALL_HTML: ${ALL_HTML}
	@echo ALL_PDF: ${ALL_PDF}
	@echo PY_RSE_FILES: ${PY_RSE_FILES}
	@echo COMMON_FILES: ${COMMON_FILES}

## tex-packages : install required LaTeX packages.
tex-packages :
	-tlmgr install $$(cat ./tex-packages.txt)
