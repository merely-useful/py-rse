# Merely Useful

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/merely-useful/merely-useful.github.io.svg?branch=master)](https://travis-ci.org/merely-useful/merely-useful.github.io)
<!-- badges: end -->

> I understand that students enjoy it, but it's merely useful.
>
> -- A research professor speaking about an early version of this material.

This repository contains material for two semester-long courses on computing skills for researchers.
Please see <https://merely-useful.github.io> for the rendered version,
and <https://merely-useful.github.io/conduct.html> for our Code of Conduct.

## Decision Making

1.  Before each meeting, anyone who wishes may sponsor a proposal by filing an issue in the GitHub repository tagged "proposal".
    Proposals must be filed at least 24 hours before a meeting in order to be considered at that meeting, and must include:
    -   a one-line summary (the subject line of the issue)
    -   the full text of the proposal
    -   any required background information
    -   pros and cons
    -   possible alternatives

2.  A quorum is established in a meeting if half or more of voting members are present.

3.  Once a person has sponsored a proposal, they are responsible for it.
    he group may not discuss or vote on the issue unless the sponsor or their delegate is present.
    The sponsor is also responsible for presenting the item to the group.

4.  After the sponsor presents the proposal, a "sense" vote is cast for the proposal prior to any discussion:
    -   Who likes the proposal?
    -   Who can live with the proposal?
    -   Who is uncomfortable with the proposal?

5.  If all or most of the group likes or can live with the proposal, it is immediately moved to a formal vote with no further discussion.

6.  If most of the group is uncomfortable with the proposal, it is postponed for further rework by the sponsor.

7.  If some members are uncomfortable they can briefly state their objections.
    A timer is then set for a brief discussion moderated by the facilitator.
    After 10 minutes or when no one has anything further to add (whichever comes first),
    the facilitator calls for a yes-or-no vote on the question:
    "Should we implement this decision over the stated objections?"
    If a majority votes "yes" the proposal is implemented.
    Otherwise, the proposal is returned to the sponsor for further work.

## Building and Previewing

**Note:** we are using `book` as the master (published) branch because of the way GitHub handles organization repositories.
Please always create your branches from `book` and merged completed work into `book` for publication:
do *not* commit anything manually to `master`.

To set up to preview locally:

1.  Install R.
    (We recommend that you also install and use the RStudio IDE.)

1.  Run R and use `install.packages("bookdown")` to install bookdown.

To build and preview from the command line:

1.  `make html` and then open `docs/index.html`.

1.  `make pdf` or `make epub` to build PDF and EPUB versions (also in the `docs` folder).

Or via RStudio:

1. When in the R project (opened via the `.Rproj` file), use the key bindings `Ctrl-Shift-B` to build the `html` output.

1. Or in the console `source("_build.R")` to build all the outputs.

## Workflow

If you are doing a major overhaul on material:

1.  Pick a chapter.
2.  Check that there isn't an outstanding branch with its name (i.e., that no one else is also doing a major overhaul).
3.  Create a branch from `book` named after the chapter file, e.g. `automate` or `publish`.
4.  Make some trivial change and create a PR with the subject line `revisions to automate` (or whatever the chapter name is).
5.  Add the label "work in progress" to that PR.
6.  When it's ready for review, remove the label and post a note in Slack asking for a reviewer.
7.  When the material is ready for publication, merge it into the `book` branch.

If you are making a smaller change, please create a branch with a meaningful name, submit changes, and ask for a reviewer.
Please do not assign PRs to people without first checking with them.

Finally, if you are doing a major reorganization that involves multiple chapters, please put in a proposal first.

## Content Guidelines

1.  `_bookdown.yml` contains an ordered list of R Markdown chapters and appendices.
    This list is repeated in `Makefile`.

1.  bookdown's behavior is controlled by the metadata in `_bookdown.yml` and in the YAML header of `index.Rmd`.
    Please do not add YAML headers to other `.Rmd` files, since it is ignored when building the entire book.

1.  The first element of each chapter must be a level-1 heading.
    Anything before this heading is silently ignored.

1.  The ID for each chapter and section heading is set by putting `{#some-label}` on the heading line.
    Please use the stem of the file's name in labels, i.e., start all labels for chapter `stuff.Rmd` with the word `stuff`.

1.  Each chapter starts with a list of questions and a list of learning objectives and ends with a list of key points.
    These lists are kept in Markdown files in the `questions`, `objectives`, and `keypoints` folders respectively
    so that they can be included in both the chapters and the `objectives.Rmd` and `keypoints.Rmd` appendices.

1.  The last line in each chapter includes the file `etc/links.md`, which gives symbolic names to all the external links used in the book.
    Please always use `[text][label]` to refer to links and put the URL itself in this file to ensure consistency between chapters.

1.  Please use the free desktop version of [draw.io](https://www.draw.io/) to draw diagrams.
    Save the source as `figures/stem/stem.drawio` and export drawings as all of PDF, PNG, and SVG.

1.  Since LaTeX doesn't understand SVG images, hand-drawn diagrams are included as follows:
    -   Create an R code block with the header `{r stem-label, echo=FALSE, fig.cap="Some Caption"}`, which means:
        -   Give this figure the ID `fig:stem-label`.
            (Bookdown automatically puts `fig:` in front of figure labels,
            though it doesn't prefix section labels with anything.)
        -   Don't show the R code used to load the image, just its output (i.e., the image).
        -   Give the figure the specified caption.
    -   Use `knitr::include_graphics("figures/stem/filename.ext")` to include a PNG image.
    -   Use `if (knitr::is_latex_output()) {...} else {...}` to include a PDF for the LaTeX version and an SVG for the web version.

1.  Use `@Name1234` to refer to bibliography entries.

1.  Use `\@ref(label)` to refer to labels for sections and figures.
    Note that:
    -   This only inserts the section number, not the words `Chapter`, `Appendix`, `Section`, or `Figure`.
    -   Those are round parentheses, not curly braces.
    -   If the figure's chunk ID is `stem-label`, use `fig:stem-label` to refer to it.

1.  Glossary entries are in `gloss.md`, which is plain Markdown rather than R Markdown.
    -   To refer to a glossary entry, use a direct link of the form `[text](glossary.html#term-label)`.
    -   Glossary definitions are set in bold and use an HTML anchor tag to provide the ID.
        We should find a more elegant way to do this.

1.  Many code fragments are accompanied by an HTML comment that contains `src="stem/filename.ext"`.
    This identifies the path to that file within the `./src` folder.
    We should find a more elegant way to handle these references.

1.  There are also some HTML comments containing the word `noindent` left over from formatting with an earlier template.
    These were used to prevent indentation of the first line of continuation paragraphs.
    We will find a more elegant way to handle this as we get closer to production.
