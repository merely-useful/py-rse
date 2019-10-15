.PHONY : all clean commands html settings

INDEX_HTML=_book/index.html
ALL_HTML=_book/py/index.html _book/r/index.html _book/rse/index.html
ALL_PDF=_book/py/py.pdf _book/r/r.pdf _book/rse/rse.pdf

R_FILES=\
  _r.yml \
  r-index.Rmd \
  novice-goals.Rmd \
  r-intro.Rmd \
  r-practice.Rmd \
  r-reproducibility.Rmd \
  r-data-manipulation.Rmd \
  r-publishing.Rmd \
  r-objectives.Rmd \
  r-keypoints.Rmd

PY_FILES=\
  _py.yml \
  py-index.Rmd \
  novice-goals.Rmd \
  py-intro.Rmd \
  py-development.Rmd \
  py-objectives.Rmd \
  py-keypoints.Rmd

RSE_FILES=\
  _rse.yml \
  rse-index.Rmd \
  rse-bash.Rmd \
  rse-cmdline-git.Rmd \
  rse-advanced-git.Rmd \
  rse-automate.Rmd \
  verify.Rmd \
  backlog.Rmd \
  style.Rmd \
  project.Rmd \
  inclusive.Rmd \
  rse-ci.Rmd \
  rse-r-package.Rmd \
  rse-r-testing.Rmd \
  rse-py-package.Rmd \
  rse-publish.Rmd \
  teamwork.Rmd \
  finale.Rmd \
  rse-objectives.Rmd \
  rse-keypoints.Rmd

COMMON_FILES=\
  _common.R \
  appendix.Rmd \
  LICENSE.md \
  CONDUCT.md \
  CONTRIBUTING.md \
  gloss.md \
  rules.Rmd \
  references.Rmd \
  links.md

#-------------------------------------------------------------------------------

all : commands

## commands     : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g'

## everything   : rebuild all HTML and PDF.
everything : ${ALL_HTML} ${ALL_PDF} ${INDEX_HTML}

${INDEX_HTML} : ./_index.html
	cp ./_index.html ${INDEX_HTML}
	mkdir -p _book/static
	cp ./static/* _book/static
	mkdir -p _book/data
	cp ./data/*.* _book/data

#-------------------------------------------------------------------------------

## html         : build HTML version.
html : ${ALL_HTML} ${INDEX_HTML}

_book/r/index.html : ${R_FILES} ${COMMON_FILES}
	cp r-index.Rmd index.Rmd
	Rscript -e "bookdown::render_book(input='index.Rmd', output_format='bookdown::gitbook', config_file='_r.yml'); warnings()"

_book/py/index.html : ${PY_FILES} ${COMMON_FILES}
	cp py-index.Rmd index.Rmd
	Rscript -e "bookdown::render_book(input='index.Rmd', output_format='bookdown::gitbook', config_file='_py.yml'); warnings()"

_book/rse/index.html : ${RSE_FILES} ${COMMON_FILES}
	cp rse-index.Rmd index.Rmd
	Rscript -e "bookdown::render_book(input='index.Rmd', output_format='bookdown::gitbook', config_file='_rse.yml'); warnings()"

#-------------------------------------------------------------------------------

## pdf          : build PDF version.
pdf : ${ALL_PDF} ${INDEX_HTML}

_book/r/r.pdf : ${R_FILES} ${COMMON_FILES}
	cp r-index.Rmd index.Rmd
	Rscript -e "bookdown::render_book(input='index.Rmd', output_format='bookdown::pdf_book', config_file='_r.yml'); warnings()"

_book/py/py.pdf : ${PY_FILES} ${COMMON_FILES}
	cp py-index.Rmd index.Rmd
	Rscript -e "bookdown::render_book(input='index.Rmd', output_format='bookdown::pdf_book', config_file='_py.yml'); warnings()"

_book/rse/rse.pdf : ${RSE_FILES} ${COMMON_FILES}
	cp rse-index.Rmd index.Rmd
	Rscript -e "bookdown::render_book(input='index.Rmd', output_format='bookdown::pdf_book', config_file='_rse.yml'); warnings()"

#-------------------------------------------------------------------------------

## clean        : clean up generated files.
clean :
	@rm -rf _book _bookdown_files _main.Rmd *.log
	@find . -name '*~' -exec rm {} \;

## links        : check that all links are defined and used.
links :
	@bin/links.py ./links.md ${R_FILES} ${PY_FILES} ${RSE_FILES} ${COMMON_FILES}

## settings     : echo all variable values.
settings :
	@echo ALL_HTML: ${ALL_HTML}
	@echo ALL_PDF: ${ALL_PDF}
	@echo R_FILES: ${R_FILES}
	@echo PY_FILES: ${PY_FILES}
	@echo RSE_FILES: ${RSE_FILES}
@echo COMMON_FILES: ${COMMON_FILES}