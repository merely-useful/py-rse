.PHONY : all clean commands settings

STEM=merely-useful
CONFIG=_bookdown.yml _output.yml
SRC=${CONFIG} $(wildcard *.Rmd) $(wildcard *.md)
OUT=_book
EPUB=${OUT}/${STEM}.epub
HTML=${OUT}/index.html
PDF=${OUT}/${STEM}.pdf

all : commands

#-------------------------------------------------------------------------------

## commands     : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g'

## everything   : rebuild all versions.
everything : ${HTML} ${PDF} ${EPUB}

## html         : build HTML version.
html : ${HTML}

## pdf          : build PDF version.
pdf : ${PDF}

## epub         : build epub version.
epub : ${EPUB}

#-------------------------------------------------------------------------------

${HTML} : ${SRC}
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook'); warnings()"

${PDF} : ${SRC}
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book'); warnings()"

${EPUB} : ${SRC}
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book'); warnings()"

#-------------------------------------------------------------------------------

## clean        : clean up generated files.
clean :
	@rm -rf ${OUT} ${STEM}.Rmd
	@find . -name '*~' -exec rm {} \;

## check        : internal checks.
check :
	@bin/chunks.py ${SRC}
	@bin/gloss.py ./gloss.md ${SRC}
	@bin/links.py ./links.md ${SRC}

## test         : tests on utilities.
test :
	@pytest

## settings     : echo all variable values.
settings :
	@echo STEM ${STEM}
	@echo CONFIG ${CONFIG}
	@echo SRC ${SRC}
	@echo EPUB ${EPUB}
	@echo HTML ${HTML}
	@echo PDF ${PDF}
