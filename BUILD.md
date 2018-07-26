# Building This Book

Note: `XX` is used as a stand-in for a two-letter language code, such as `en` for English or `um` for Lorem Ipsum.

To rebuild this book:

- `pip install -r requirements.txt` to install required Python packages.
  - You only need to do this if you are rebuilding the bibliography and/or cross-reference database.

- `make lang=XX bib` to regenerate the Markdown version of the bibliography (`_chapters_XX/bib.md`) from the BibTeX version (`files/XX.bib`).
  - You only need to do this if the bibliography has changed.

- `make lang=XX crossref` to regenerate the JSON cross-reference table (`files/crossref.js`) from the Markdown source files.
  - You only need to do this if there have been changes to section numbering, figure numbering, etc.

- `make lang=XX site` to create HTML in `_site`.

- `make lang=XX serve -I` to dynamically regenerate HTML and serve it on `localhost:4000`.

## Design

The design goals for the Jekyll template created for this book were:

1. Source files in GitHub-Flavored Markdown (GFM) rather than LaTeX or some other dialect of Markdown.

2. Site rendered using only Jekyll and the plugins available on GitHub.

3. Markdown should be very simple to edit: every formatting convention should be simple to type and check.

4. It should be straightforward to support translations into other languages.

The result is:

- Chapters are stored in `_chapters_XX`, where `XX` is a two-letter language code.  The underscore in front of this name, and the corresponding entry in the `_config.yml` configuration file, tell Jekyll to treat these files as a collection so that the template can iterate over them.

- The root directory contains an overall index page `index.md` that simply links to language-specific pages stored in `_chapters_XX/index.md`.

- The root directory also contains un-Jekylled versions of the license, the code of conduct, and the citation guide, while `_chapters_XX` contains Jekylled versions of these three files.  They are duplicated because many open source projects expect these files in the root directory with these names, but managing them as special cases was proving annoying.

- Sections are given IDs using the syntax `## Section Title {#s:slug-something}`, which translates into an h-heading with an `id` attribute.  (The `s:` prefix is used for namespacing.)

- Figures are written out using HTML rather than Markdown because GFM doesn't have a syntax for the HTML5 `figure` element.  The `id` is put in the `figcaption`, and uses an `f:` prefix.

- Bibliographic citations are written `[key](#CITE)`.  The value of `key` must match the key of an entry in `_chapters_XX/bib.md`, and the string `#CITE` must be written literally.  The JavaScript in `js/youbou.js` looks for links with `#CITE` as their target and rewrites them.  Note that most citations actually appear with extra square brackets, e.g., `[[key](#CITE)]`, so that the final text appears as `[key]`.  This allows a single bracketed block to include several citations, e.g., `[[key1](#CITE),[key2](#CITE)]`.  It isn't pretty, but it's simpler than either writing out the full link to the citation or using a fancy `include` statement.

- Glossary references are written as `[term in text](#g:some-key)`, where `term in text` appears in the displayed page and `g:some-key` must be a key in `_chapters_XX/gloss.md`.  `js/youbou.js` looks for links whose targets have the `g:` namespace prefix and rewrites them to point at the right file.

- Appendix references are written `[s:some-key](#APPENDIX)`; chapter, section, and figure references are written similarly, with `#APPENDIX`, `#CHAPTER`, `#FIGURE`, and `#SECTION` all written literally.  `js/youbou.js` uses the data loaded from `files/crossref.js` to turn these into links to the appropriate headings in the appropriate files.

- The path from the root `XX/index.html` page for any language to other pages in that language is different from the path from any other page, since `XX/index.html` is in the language's root directory `_site/XX` and other pages are in named sub-directories `_site/XX/SLUG/index.html`.  To accommodate this, `index_XX.md` sets the value of `root` in its YAML header to `true`, and this is then passed into `js/youbou.js` during Jekyll template expansion and used to control the choice of `./` or `../` as a path prefix.

- There doesn't appear to be an easy way to dynamically select a collection based on a language key in Jekyll, so the top of `_includes/toc.html` decides which set of chapters to include in the table of contents on a language-by-language basis.  It's unpleasant, but it works.

- All external links (except for those defined in `_config.yml`) are in `_includes/links.md`, which is included at the bottom of every Markdown file.  (There doesn't appear to be a way to put the inclusion of their definitions in the layout file.)

## Miscellaneous

- Diagrams are drawn using [draw.io](http://draw.io) (which can be downloaded and installed for offline use).  Save the `.xml` file in `files`, and then export SVG and PDF into the same directory for use in the online and print versions of the book respectively.

- `_includes/toc-section.html` uses a double loop to match collection items to the ordered list in the configuration table of contents.  Since this is run once for each file, the process is actually N^3, which is nuts, but Jekyll doesn't have a way to force ordering of a collection or to turn a collection into a lookup table with a user-defined key.  <https://github.com/jekyll/jekyll/pull/5904> was supposed to fix this, but...
