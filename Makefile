.PHONY : all clean chapters commands crossrefs html link settings

INDEX_HTML=_book/index.html
ALL_HTML=_book/py/index.html _book/r/index.html _book/rse/index.html
ALL_PDF=_book/py/py.pdf _book/r/r.pdf _book/rse/rse.pdf
EXTRA=climate-data data src zipfs-law

R_FILES=\
  _r.yml \
  r-index.Rmd \
  novice-goals.Rmd \
  r-intro.Rmd \
  r-getting-started.Rmd \
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
  rse-bash-basics.Rmd \
  rse-bash-advanced.Rmd \
  rse-git-cmdline.Rmd \
  rse-git-advanced.Rmd \
  rse-automate.Rmd \
  rse-teams.Rmd \
  style.Rmd \
  rse-project.Rmd \
  rse-ci.Rmd \
  rse-package-r.Rmd \
  rse-package-py.Rmd \
  rse-correct.Rmd \
  rse-publish.Rmd \
  rse-finale.Rmd \
  rse-objectives.Rmd \
  rse-keypoints.Rmd \
  rse-solutions.Rmd

COMMON_FILES=\
  _common.R \
  appendix.Rmd \
  LICENSE.md \
  CONDUCT.md \
  CONTRIBUTING.md \
  gloss.md \
  references.Rmd \
  links.md

#-------------------------------------------------------------------------------

all : commands

## commands     : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g'

## everything   : rebuild all HTML and PDF.
everything : ${ALL_HTML} ${ALL_PDF} ${INDEX_HTML}

##   r          : rebuild novice R HTML and PDF.
r : _book/r/index.html _book/r/rse.pdf

##   py         : rebuild novice Python HTML and PDF.
py : _book/py/index.html _book/py/rse.pdf

##   rse        : rebuild RSE HTML and PDF.
rse : _book/rse/index.html _book/rse/rse.pdf

#-------------------------------------------------------------------------------

## html         : build all HTML versions.
html : ${ALL_HTML}

##   r-html     : build novice R HTML.
r-html : _book/r/index.html

##   py-html    : build novice Python HTML.
py-html : _book/py/index.html

##   rse-html   : build RSE HTML.
rse-html : _book/rse/index.html

_book/r/index.html : ${R_FILES} ${COMMON_FILES} ${INDEX_HTML}
	cp r-index.Rmd index.Rmd
	Rscript -e "bookdown::render_book(input='index.Rmd', output_format='bookdown::gitbook', config_file='_r.yml'); warnings()"

_book/py/index.html : ${PY_FILES} ${COMMON_FILES} ${INDEX_HTML}
	cp py-index.Rmd index.Rmd
	Rscript -e "bookdown::render_book(input='index.Rmd', output_format='bookdown::gitbook', config_file='_py.yml'); warnings()"

_book/rse/index.html : ${RSE_FILES} ${COMMON_FILES} ${INDEX_HTML}
	cp rse-index.Rmd index.Rmd
	Rscript -e "bookdown::render_book(input='index.Rmd', output_format='bookdown::gitbook', config_file='_rse.yml'); warnings()"

${INDEX_HTML} : ./_index.html
	mkdir -p _book
	cp ./_index.html ${INDEX_HTML}
	cp -r ${EXTRA} _book

#-------------------------------------------------------------------------------

## pdf          : build PDF version.
pdf : ${ALL_PDF} ${INDEX_HTML}

##   r-pdf      : build novice R PDF.
r-pdf : _book/r/r.pdf

##   py-pdf     : build novice Python PDF.
py-pdf : _book/py/py.pdf

##   rse-pdf    : build RSE PDF.
rse-pdf : _book/rse/rse.pdf

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
	@rm -rf _book _bookdown_files _main.Rmd *.log index.Rmd r.Rmd py.Rmd rse.Rmd
	@find . -name '*~' -exec rm {} \;

## chapters     : check consistency of chapters.
chapters :
	@make settings | bin/chapters.py _rse.yml RSE_FILES rse-objectives.Rmd rse-keypoints.Rmd

## crossrefs    : check cross-references.
crossrefs :
	@bin/crossrefs.py "Novice R" ${R_FILES} ${COMMON_FILES}
	@bin/crossrefs.py "Novice Python" ${PY_FILES} ${COMMON_FILES}
	@bin/crossrefs.py "RSE" ${RSE_FILES} ${COMMON_FILES}

## images       : check that all images are defined and used.
images :
	@bin/images.py ./figures ${R_FILES} ${PY_FILES} ${RSE_FILES} ${COMMON_FILES}

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
