# Overall Design

-   Site-specific configuration is stored in:
    -   `./site.mk`: defines the stem used for this project, e.g., `merely-useful`.
        -   This file is included by `Makefile` automatically.
    -   `./site.yml`: defines the site-specific Jekyll configuration values.
        -   This file is combined with `./.config.yml` (the generic configuration values) to produce `./_config.yml`.
        -   You *must* commit `./_config.yml` to your repository, but do *not* edit it by hand.

-   Markdown source files for each human language are in a [Jekyll collection][jekyll-collections] named after the language.
    -   E.g., `_en` for English.

-   Every file has a unique slug.  Using the English version as an example:
    -   The entry in the Jekyll configuration's table of contents is `slug`.
    -   The file's name is `./_en/slug.md` (so the file's auto-generated slug is `slug`).
    -   The generated HTML file is `./_site/en/slug/index.html` (so the URL is `http://whatever/slug/`).
    -   The chapter ID `s:slug` is inserted automatically.
    -   All section IDs are `s:slug-something` (and must be written manually).
    -   The figure IDs are `f:slug-something`.
    -   The source for all diagrams for the file is in `./figures/slug.xml` (a [draw.io][draw-io] drawing).
    -   The PNG, SVG, and PDF versions of the diagrams are in `./figures/slug_something.suffix`.

-   Every Markdown file's YAML must contain one field:
    -   `title`: the file's title.

-   Lessons must also contain three lists (all Markdown-formatted):
    -   `questions`: a point-form list of motivating questions.
    -   `objectives`: a point-form list of learning objectives.
    -   `keypoints`: a point-form list of key points for a cheat sheet.

-   The `index.md` file for each language (e.g., `_en/index.md`) must also contain:
    -   `root: true` to control formatting.
    -   `permalink: "/en/"` (or whatever the language is) to override the default output path defined in `_config.yml`.
    -   This file becomes `./_site/en/index.html` (or whatever the language is).

-   The `index.md` file for one language should contain:
    -   `redirect: '/'` so that going to `http://whatever/` redirects to `http://whatever/en/` (or whatever the language is).

-   The goal was to use pure Jekyll to create HTML for GitHub Pages without having to commit any generated files.
    -   We came close, but we can't access section headings within files in Jekyll,
        so we wouldn't be able to use cross-references to sections (only to chapters).
    -   So we need to regenerate the table of contents in `./_data/toc.json` with a compilation step and commit that.
    -   Since we're doing that,
        we also use a script to regenerate the Markdown bibliography (e.g., `./_en/bib.md`)
        from the BibTeX source (e.g., `./tex/en/book.bib`).

-   Use Pandoc with pre- and post-processing to convert HTML to LaTeX to build PDF.
    -   Run `bin/transform.py --pre` to read the HTML in (for example) `./_site/en/.../*.html`
        and generate a stream with markers for problematic elements.
    -   Run this through Pandoc to do HTML-to-LaTeX conversion.
    -   Run `bin/transform.py --post` to find and convert the markers.
    -   It's clumsy, but easier to maintain than a custom Pandoc template
        (we know more Python programmers than Pandoc experts).

-   Use the JavaScript in `./assets/site.js` to:
    -   Add a disclaimer to the HTML version if `site.disclaimer` is set true in `./_config.yml`.
    -   Create a table of contents for each page.
    -   Patch up classes for tables.
    -   Fix cross-references and references to bibliography items and glossary entries.

-   `./_includes/summary.html` and `./_includes/toc-section.html` loop over the table of contents to match slugs to files
    because Jekyll doesn't support lookup by field in collections.
    -   This makes Jekyll's running time O(N^2), but there's nothing we can do about it.

## Configuration Entries

`./site.yml` should look like this:

```
# Display.
title: "A Merely Useful Template"
subtitle: "Build a GitHub Pages Site and a Nicely-Formatted Book from the Same Source"
editor: "Greg Wilson"
copyrightyear: "2019"
repo: "https://github.com/merely-useful/template"
website: "https://merely-useful.github.io/template/"
email: "gvwilson@third-bit.com"
organization: https://github.com/merely-useful/
disclaimer: true

# Order for table of contents.
toc:
  lessons:
  - intro
  bib:
  - bib
  extras:
  - license
  - conduct
  - citation
  - contributing
  - gloss
  - objectives
  - keypoints
```

-   The keys under `Display` should be self-explanatory.
-   The keys under `toc` *must* be `lessons`, `bib`, and `extras` in that order;
    the only entry allowed under `bib` is `bib`,
    and all of the entries shown under `extras` should be there
    (though others may be added).
-   The main index file (e.g., `_en/index.md`) is *not* included in the table of contents.
-   This file is combined with `./.config.yml` to create the Jekyll configuration file `./_config.yml`,
    which must then be committed to the Git repository.
    (Use `make lang=whatever config` to do this explicitly,
    or let Make take care of it when doing other tasks.)
-   It's clumsy, but since there is no "include" mechanism for Jeykll configuration files,
    and we can't layer those files on GitHub the way we can on the desktop using flags,
    it's the only way to keep generic configuration values in a shareable file.
-   Read about [Jekyll collections][jekyll-collections] to understand the following:
    -   The use of `output: true` to force output.
    -   The use of `permalink: /:collection/:title/` to turn `_en/something.md` into `_site/en/something/index.html`.
    -   The use of `defaults` to specify the `lesson` layout for all the files in `_en`.

## Typography

-   Refer to glossary entries using `{% raw %}[text](#g:key){% endraw %}`.
    -   This minimizes typing: without it, glossary entries would all need `../gloss/` in the path.
    -   The JavaScript in `./assets/site.js` patches these references and sets the style for glossary references when the page loads.
    -   Knows which ones to patch by looking for the leading `g:` in the reference.

-   Bibliographic citations are written using `{% raw %}[Name1901,Name2001](#BIB){% endraw %}`.
    -   Deliberately similar to LaTeX's `\cite{Name1901,Name2001}`.
    -   Again, `./assets/site.js` turns this into links into the bibligraphy: the `#BIB` link identifies elements to be modified.

-   Cross-references are written using `{% raw %}[s:whatever](#REF){% endraw %}`.
    -   `./assets/site.js` relies on an up-to-date cross-reference file `./_data/en_toc.json` to fix these
        (with some other language prefix in place of `en` if necessary).

-   External links are `[text][link-name]`, where `link-name` is a key in `./_includes/links.md`
    -   `./_includes/links.md` has to be included explicitly at the bottom of every Markdown file
        because including it in the template doesn't work
        (links are expanded before the inclusion is processed).

-   Use `{% raw %}{% include figure.html id="f:whatever" src="../../figures/whatever.svg" caption="Whatever" %}{% endraw %}`
    to include a figure.
    -   `./_includes/figure.html` translates this into HTML for use in Markdown.
    -   `./bin/transform.py` takes care of the LaTeX.

-   Use underscores rather than dashes in filenames, e.g., `a_b.md`.
    -   Need underscores for Python source files that are being imported.
    -   Might as well be consistent.
    -   Should probably switch all cross-reference keys to underscores as well...

-   If you would like to add code fragments,
    please put the source in `./src/chapter/long-name.ext`.
    Include it in a left-justified, triple-backquoted code block.
    -   Fenced code blocks *must* have a language type.
    -   `html` for HTML
    -   `js` for JavaScript and JSON
    -   `make` for Makefiles
    -   `python` for Python
    -   `r` for R
    -   `shell` for shell commands
    -   `yaml` for YAML
    -   `text` for output (including error output) and everything else.

-   If you want to leave out sections of code,
    use `# ...explanation...` (i.e., a comment with triple dots enclosing the text)
    in the Markdown file.

-   If you would like to add or fix a diagram, please:
    1.  Edit the XML file in `./figures/` corresponding to the chapter using [draw.io][draw-io].
    2.  Select the drawing and export as SVG with a 4-pixel boundary and transparency turned on,
        but *without* including the diagram source in the exported SVG.
    3.  Export a second time as PDF (selection only, cropped).
        We have tried automating the SVG-to-PDF conversion with various tools,
        but the results have been unsatisfying.
    4.  Edit the Markdown file and include an HTML `figure` element with an ID
        containing (in order) an `img` element with a `src` attribute but nothing else
        and a `figcaption` element with the figure's label.
        **These elements all have to be on one line**
        so that `./bin/transform.py` can find and translate the elements correctly.

-   When all else fails, put `<div markdown="1" replacement="something.tex">` in the Markdown file
    and a corresponding `</div>` after the block of Markdown that's to be replaced by
    the LaTeX inclusion.
    This can be used for complex tables,
    for displaying MathJax,
    and so on.

## Layout

-   `./.config.yml`: generic configuration values set by the template.
    -   This is combined with `site.yml` (described above) to produce the Jekyll configuration file `./_config.yml`.
-   `./site.mk`: Make configuration values for this project.
    -   This is included by `Makefile` automatically.
-   `./README.md`: this file.
    -   Not processed by Jekyll.
-   `./CITATION.md`, `./CONDUCT.md`, `./LICENSE.md`: how to cite, code of conduct, and license respectively.
    -   Not processed by Jekyll.
    -   Redundant (information is also in `./_en/filename.md`) but people expect to find these in the root directory.
-   `./Makefile`: re-build everything.
    -   `make` prints a list of targets.
    -   Can regenerate HTML and PDF, check file consistency, count words, etc.
    -   Use `make lang=xx` to run commands for a particular human language (e.g., `make lang=en` to build the English version).
-   `./_data/lang_toc.json`: JSON-formatted table of contents data.
-   `./_en/`: English-language collection of Markdown files.
-   `./_includes/`: inclusions
    -   `./_includes/foot.html`: everything needed in the foot of the page.
    -   `./_includes/head.html`: everything needed in the head of the page that doesn't depend on configuration variables.
    -   `./_includes/links.md`: table of Markdown-formatted links.
    -   `./_includes/listblock.html`: displays a point-form list of lesson metadata (e.g., questions or key points).
    -   `./_includes/summary.html`: summarizes metadata from all lessons (e.g., creates a page of learning objectives).
    -   `./_includes/toc-bib.html`: display the bibliography in the table of contents.
    -   `./_includes/toc-section.html`: display lessons or extras in the table of contents.
    -   `./_includes/toc.html`: display the entire table of contents.
    -   `./_includes/slug/file.ext`: an inclusion for the lesson with that slug.
-   `./_layouts/`: page layouts.
    -   `./_layouts/default.html`: base layout (used directly only for the overall index page for the whole site).
    -   `./_layouts/lesson.html`: derived layout for all lesson pages.
-   `./_site/`: if present, holds the HTML pages generated by Jekyll.
-   `./bin/`: scripts used to build and check the site.
    -   `./bin/bib2md.py`: convert BibTeX bibliography to Markdown.
    -   `./bin/check.py`: check various aspects of source files.
    -   `./bin/get_body.py`: get the body of a page for conversion to LaTeX.
    -   `./bin/get_main_div.py`: get the main `div` from a single page (used for testing purposes).
    -   `./bin/make_toc.py`: make the JSON cross-reference file.
    -   `./bin/stats.py`: report summary statistics on completed chapters.
    -   `./bin/transform.py`: handle HTML-to-intermediate-to-LateX transformation.
    -   `./bin/uncode.py`: remove code blocks (used in spell check).
    -   `./bin/util.py`: utilities used by other scripts.
-   `./assets/`: static files (CSS, JavaScript, images).
    -   `./assets/bootstrap.min.css`: [Bootstrap 4][bootstrap]
    -   `./assets/bootstrap.min.js`: [Bootstrap][bootstrap]
    -   `./assets/site.css`: custom definitions.
    -   `./assets/site.js`: used to clean up bibliographic citations and glossary entries, style tables, etc.
    -   `./assets/tango.css`: [Pygments Tango theme][pygments-tango]
    -   `./assets/*.svg`: image files used in template (as opposed to figures).
-   `./etc/`: holding area for files that aren't being used right now but might be (re-)added later.
-   `./favicon.ico`: toolbar icon.
-   `./figures/`: [draw.io][draw-io] source for figures and all exported figures.
    -   `./figures/slug.xml`: source for all diagrams in that lesson.
    -   `./figures/slug_something.suffix`: PDF, PNG, or SVG export of a single figure from the XML file.
-   `./index.md`: overall home page for site (currently redirects to English-language version).
-   `./requirements.txt`: Pip installation requirements.
    -   Run with `pip install -r requirements.txt`.
-   `./src/`: source files used in Markdown, broken down by chapter.
-   `./tex/`: LaTeX files used to create PDF.
    -   `./tex/settings.tex`: package inclusions, macro definitions, etc.
    -   `./tex/lang/book.tex`: main file for book.
    -   `./tex/lang/book.bib`: BibTeX bibliography for book.
    -   `./tex/lang/all.tex`: if present, holds the all-in-one LaTeX generated from the Markdown source.

[bootstrap]: https://getbootstrap.com/
[draw-io]: https://www.draw.io/
[jekyll-collections]: https://jekyllrb.com/docs/collections/
[pygments-tango]: https://jwarby.github.io/jekyll-pygments-themes/languages/javascript.html
