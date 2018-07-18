# Settings
JEKYLL=jekyll
D_DST=_site

# Controls
.PHONY : commands clean serve site
all : commands

## commands : show all commands.
commands :
	@grep -h -E '^##' Makefile | sed -e 's/## //g'

## serve    : run a local server.
serve :
	${JEKYLL} serve -I

## site     : build files but do not run a server.
site :
	${JEKYLL} build

## clean    : clean up junk files.
clean :
	@rm -rf ${D_DST}
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;
