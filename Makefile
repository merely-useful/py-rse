.PHONY : all clean chapters commands crossrefs fixme html links nbspref pdf settings tex-packages

HTML=_book/index.html

PDF=_book/py-rse.pdf

CHAPTERS=index.Rmd $(wildcard chapters/*.Rmd)

OBJECTIVES_KEYPOINTS=$(wildcard objectives/*.md) $(wildcard keypoints/*.md)

GLOSSARY=glossary/glossary.md
GLOSARIO=${HOME}/glosario

COMMON_FILES=\
  krantz.cls \
  _bookdown.yml \
  _output.yml \
  _common.R \
  appendix.Rmd \
  LICENSE.md \
  CONDUCT.md \
  CONTRIBUTING.md \
  ${GLOSSARY} \
  references.Rmd \
  links.md \
  book.bib

SOURCE=${CHAPTERS} ${OBJECTIVES_KEYPOINTS} ${COMMON_FILES}

EXTRA=\
  src\
  zipf

#-------------------------------------------------------------------------------

all : commands

## commands : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' | column -t -s ':'

## everything : rebuild HTML and PDF.
everything : ${HTML} ${PDF}

#-------------------------------------------------------------------------------

## html : build all HTML versions.
html : _book/index.html

_book/index.html : ${SOURCE} glossary/glossary-html.lua
	rm -f py-rse.Rmd
	Rscript -e "options(bookdown.render.file_scope = FALSE); bookdown::render_book(input='index.Rmd', output_format='bookdown::gitbook'); warnings()"
	cp -r ${EXTRA} _book

#-------------------------------------------------------------------------------

## pdf : build PDF version.
pdf : _book/py-rse.pdf

_book/py-rse.pdf : ${SOURCE}
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
	@make settings | bin/chapters.py _bookdown.yml CHAPTERS

## citations : check bibliography citations.
citations :
	@bin/citations.py book.bib ${CHAPTERS}

## crossrefs : check cross-references.
crossrefs :
	@bin/crossrefs.py "RSE PY" ${SOURCE}

## fixme : list all the FIXME markers
fixme :
	@fgrep FIXME ${SOURCE}

## gloss : rebuild the Markdown glossary file.
# Target cannot be called 'glossary' because there is a directory with that name.
gloss :
	echo '# Glossary {#glossary}' > ${GLOSSARY}
	echo '' >> ${GLOSSARY}
	bin/glossary-merge.py ${GLOSARIO}/glossary.yml glossary/glossary.yml \
	| bin/glossarize.py glossary/glossary-slugs.txt \
	>> ${GLOSSARY}

## glosscheck : check that glossary entries are defined and used.
glosscheck :
	@bin/glosscheck.py ${GLOSSARY} ${CHAPTERS}

## images : check that all images are defined and used.
images :
	@bin/images.py ./figures ${SOURCE}

## linkcheck : check that links are defined and used.
linkcheck :
	@bin/linkcheck.py ./links.md ${CHAPTERS}

## exercises : check that exercises have solutions and solutions have exercises.
exercises :
	@bin/exercises.py ${CHAPTERS}

## nbspref : check that all cross-references are prefixed with a non-breaking space.
nbspref :
	@bin/nbspref.py ${SOURCE}

## settings : echo all variable values.
settings :
	@echo HTML: ${HTML}
	@echo PDF: ${PDF}
	@echo CHAPTERS: ${CHAPTERS}
	@echo OBJECTIVES_KEYPOINTS: ${OBJECTIVES_KEYPOINTS}
	@echo COMMON_FILES: ${COMMON_FILES}

## tex-packages : install required LaTeX packages.
tex-packages :
	-tlmgr install $$(cat ./tex-packages.txt)
