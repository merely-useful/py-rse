# Contributing Guidelines

## Decision Making

1.  Before each meeting, anyone who wishes may sponsor a proposal by filing an
    issue in the GitHub repository tagged "proposal", at least 24 hours before
    the meeting. Follow the "Proposal Issue Template".

2.  A quorum is established in a meeting if half or more of voting members are present.

3.  Once a person has sponsored a proposal, they are responsible for it.
    The group may not discuss or vote on the issue unless the sponsor or their delegate is present.
    The sponsor is also responsible for presenting the item to the group.

4.  After the sponsor presents the proposal, a "sense" vote is cast for the proposal prior to any discussion:
    -   Who likes the proposal? (+1)
    -   Who can live with the proposal? (0)
    -   Who disagrees with the proposal? (-1)

5.  If all or most of the group likes or can live with the proposal, it is
    immediately moved to a formal vote with no further discussion.

6.  If most of the group disagrees with the proposal, it is postponed for
    further rework by the sponsor.

7.  If some members disagree they can briefly state their objections.
    A timer is then set for a brief discussion moderated by the facilitator.
    After 10 minutes or when no one has anything further to add (whichever comes first),
    the facilitator calls for a yes-or-no vote on the question:
    "Should we implement this decision over the stated objections?"
    If a majority votes "yes" the proposal is implemented.
    Otherwise, the proposal is returned to the sponsor for further work.

## Building and Previewing

**Note:** we are using `book` as the master (published) branch because of the
way GitHub handles organization repositories, domain names, and the generation
of the website.

**Setup to locally preview the book**:

1.  Install R (we recommend that you also install and use the RStudio IDE).

1.  Open RStudio by clicking on the `merely-useful.github.io.Rproj` file (if not
    through RStudio, then open an R console in the location of the Merely Useful
    repo) and install the dependencies by typing in the console:

    ```r
    # Make sure you have remotes installed
    # install.packages("remotes")
    remotes::install_deps()
    ```

**Build and preview from the command line**:

1.  `make py-rse-html` and then open `_book/index.html`.
1.  `make py-rse-pdf` to build the pdf version (also in the `_book` folder).
1.  `make py-rse` to do both of the above.

Or via RStudio:

1.  When in the R Project (opened via the `.Rproj` file), use the key bindings
    `Ctrl-Shift-B` to build the `html` output.

## Workflow for Adding Content

-   Use the `book` branch as the main "development" branch (**not `master`**).
-   Since `book` is "protected", to add to the repo you must:
        1.  Submit a PR of a branch from your fork of the repo
        1.  Each PR must pass the Travis CI check and must get at least one (1)
            approval from someone else.
        1.  Generally @gvwilson or @lwjohnst86 merge into the main repo's
            `book` branch to make sure the content will generate correctly to
            the website. However, others should be able to merge as well.
    
**For larger changes**:

-   Create a branch to work on your chosen chapter.
-   Make edits.
-   Create a **[Draft Pull Request](https://github.blog/2019-02-14-introducing-draft-pull-requests/)**
    to the main repo.
-   Add the label "work in progress" to that PR.
-   When it's ready for review, remove the label, change the PR status to "Ready
    to review", and post a note in Slack asking for a reviewer.

**For other changes**:

-   If you are making a smaller change, please create a branch with a meaningful
    name, submit changes, and ask for a reviewer. 
-   Finally, if you are doing a major reorganization that involves multiple
    chapters, please put in a proposal first.

## Reviewing PRs

-   Add yourself as a reviewer to the PR.
-   If making a suggested change to the actual text, please use
    ["Insert a suggestion"](https://help.github.com/en/articles/commenting-on-a-pull-request#adding-line-comments-to-a-pull-request)
    -   For the **"reviewee"**, please accept those changes. GitHub will insert
        the suggestion directly as a commit, thus giving attribution to the
        reviewer. Note: This does not work for multi-line suggestions edits
        (though you can add more lines in the suggestion if desired).
-   For individual chapter reviews, look for consistency, content, clarity of
    material with exercises. Don't worry too much about grammar appearance,
    structure, etc. This will be done at the end stage.

## Specific Content Guidelines

1.  bookdown's behavior is controlled by the metadata in `_bookdown.yml` and in
    the YAML header of `index.Rmd`.  Please do not add YAML headers to other
    `.Rmd` files, since it is ignored when building the entire book.

1.  `_bookdown.yml` contains an ordered list of R Markdown chapters and
    appendices.  This list is repeated in `Makefile`.

1.  The first element of each chapter must be a level-1 heading.  Anything
    before this heading is silently ignored.

1.  The ID for each chapter and section heading is set by putting
    `{#some-label}` on the heading line.  Please use the stem of the file's name
    in labels, i.e., start all labels for chapter `stuff.Rmd` with the word
    `stuff`.  Also include the course type to the beginning (e.g. "r-", "py-",
    and "rse-").

1.  Each chapter ends with a list of key points.  These lists are kept in plain
    Markdown files in the `keypoints` folders so that they can be included in
    both the chapters and the `keypoints.Rmd` appendices.

1.  The last line in each chapter includes the file `links.md`, which gives
    symbolic names to all the external links used in the book and to all
    glossary entries.  Please always use `[text][label]` to refer to links and
    put the URL itself in this file to ensure consistency between chapters.

1.  Please use the free desktop version of [draw.io](https://www.draw.io/) to
    draw diagrams.  Save the source as `figures/stem/stem.drawio` and export
    drawings as all of PDF, PNG, and SVG.

1.  Since LaTeX doesn't understand SVG images, diagrams are included as follows:
    -   Create an R code block with the header
        `{r stem-label, echo=FALSE, fig.cap="Some Caption"}`, which means:
        -   Give this figure the ID `fig:stem-label`.
            (Bookdown automatically puts `fig:` in front of figure labels,
            though it doesn't prefix section labels with anything.)
        -   Don't show the R code used to load the image, just its output (i.e.,
            the image).
        -   Give the figure the specified caption.
    -   Use `insert_graphic("figures/stem/filename.ext")` to include your
        image. If you are using a `.pdf` image, make sure that you have the same
        file but as a `.svg` as well.

1.  Use `@Name1234` or `[@Name1234]` to refer to bibliography entries. These
    entries must exist in the `book.bib` file.  For multiple entries, separate
    the entries with `;`, i.e. `[@Name1234;@Name5678]`.

1.  Use `\@ref(label)` to refer to labels for sections and figures.  Note that:
    -   This only inserts the section number, not the words `Chapter`, `Appendix`,
        `Section`, or `Figure`.
    -   Those are round parentheses, not curly braces.
    -   If the figure's chunk ID is `stem-label`, use `fig:stem-label` to refer to
        it.

1.  Glossary entries are taken from the [glosario](https://github.com/carpentries/glosario/)
    project and from the local file `glossary.yml`. The mechanics for doing this
    still in flux, but:
    -   Use `make glossary` to create the combined Markdown glossary file in
        `glossary.md`. This assumes you have the latest version of `glosario`
        checked out of GitHub in your home directory.
    -   To refer to a glossary entry, use a direct link of the form
        `[text][label]`, where `label` is listed in the second half of
        `links.md` and refers to `glossary.html#label`.
    -   Use `make links` to check for missing or inconsistent entries.
        There are a handful of false positives because regular expressions
        are really hard to write...

1.  Do *not* use `View()` in your R snippets, as Travis will fail when it tries
    to launch a viewer from the command line.
    
## Using Python Code Chunks

The process for inserting Python code chunks in R Markdown is the same as for
inserting R code chunks. Simply replace `{r}` with `{python}` on the first line
of the fenced code chunk:
    
    ```{python}
    # Python chunks will also be syntax highlighted
    for num in range(5):
        print(num)
    ```

Code chunks have
[options](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)
that apply to both R and Python.
    
## When Using Other Software Packages

Travis needs to know what packages to install to build the website:

-   For R packages, it is very easy. When in the Merely Useful R Project (by
    opening the `merely-useful.github.io.Rproj` file), type
    `usethis::use_package("packagename")` in the R Console. This will add the
    package dependency to the `DESCRIPTION` file under the imports section.

-   For Python packages you'll need to add the package to the `.travis.yml` under
    the `addons` section:

```yaml
addons:
  apt:
    packages:
    - python3
    # Add more packages below here
    # and looks like "python3-packagename"
    # e.g.:
    - python3-numpy
```

## Documentation on Continuous Building using Travis CI

**NOTE**: This section is only to document what was done and why. This does not
need to be done, unless others want to clone this repository for their own
purposes.

Final building of the website is done via Travis CI. In order to get Travis set
up to push the final generated book to the `master` branch, a GitHub Personal
Access Token (PAT) must be added. This PAT can be generated and assigned to
Travis with the following steps:

1.  Create a [PAT](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line)
    for your account on GitHub (make sure to enable the "repo" scope so that
    using this token will enable writing to your GitHub repos) and copy the
    token to your clipboard.

1.  Go to https://travis-ci.org/USER/REPO/settings replacing `USER` with your
    GitHub ID and `REPO` with the name of the forked repository.

1.  Under the section "Environment Variables", type `GITHUB_TOKEN` in the "Name"
    text box and paste your personal access token into the "Value" text box.

1.  The `deploy` Travis commands found in [`.travis.yml`](.travis.yml) are then
    used to access this GitHub PAT.
