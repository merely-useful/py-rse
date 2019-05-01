.PHONY : all clean commands

STEM=merely-useful

EPUB=_book/${STEM}.epub
HTML=_book/index.html
PDF=_book/${STEM}.pdf

CHAPTERS= \
shell.Rmd \
automate.Rmd \
syndicate.Rmd \
configure.Rmd \
logging.Rmd \
unit.Rmd \
verify.Rmd \
branches.Rmd \
backlog.Rmd \
style.Rmd \
process.Rmd \
integrate.Rmd \
remote.Rmd \
tools.Rmd \
docs.Rmd \
refactor.Rmd \
project.Rmd \
inclusive.Rmd \
package.Rmd \
publish.Rmd \
teamwork.Rmd \
pacing.Rmd \
finale.Rmd

SRC= \
index.Rmd \
${CHAPTERS} \
references.Rmd \
appendix.Rmd \
LICENSE.md \
CONDUCT.md \
CONTRIBUTING.md \
gloss.md \
objectives.Rmd \
keypoints.Rmd \
rules.Rmd

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

## clean        : clean up generated files.
clean :
	@rm -rf _book ${STEM}.Rmd
	@find . -name '*~' -exec rm {} \;

#-------------------------------------------------------------------------------

## chapters     : list chapter files.
chapters :
	@echo ${CHAPTERS}

#-------------------------------------------------------------------------------

${HTML} : ${SRC}
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook'); warnings()"

${PDF} : ${SRC}
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book'); warnings()"

${EPUB} : ${SRC}
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book'); warnings()"

#-------------------------------------------------------------------------------

## build_via_r  : build using directly the build.R file
build_via_r:
	@Rscript _build.R
