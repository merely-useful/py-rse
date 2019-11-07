# Contributing {#contributing}

Contributions of all kinds are welcome.
By offering a contribution, you agree to abide by our [Code of Conduct](CONDUCT.md)
and that your work may be made available under the terms of [our license](LICENSE.md).

1.  To report a bug or request a new feature,
    please check the [list of open issues](https://github.com/tidyblocks/tidyblocks/issues)
    to see if it's already there,
    and if not,
    file as complete a description as you can.

1.  If you have made a fix or improvement,
    please create a [pull request](https://github.com/tidyblocks/tidyblocks/pulls).
    We will review these as quickly as we can (typically within 2-3 days).
    If you are tackling an issue that has already been opened,
    please name your branch `number-some-description`
    (e.g., `20-highlighting-active-block`)
    and put `Closes #N` (e.g., `Closes #20`)
    on a line by itself at the end of the PR's long description.

## Style Guide {#contributing-style}

We follow the [tidyverse style guide](https://style.tidyverse.org/) for R and
[PEP 8](https://www.python.org/dev/peps/pep-0008/) for Python as closely as
possible but specify some conventions further. We go against the style guides
only when it is considered that it will improve clarity.

Specific conventions include:

- `variable_name` (snake_case)
- `function_name` and `method_name` (snake_case)
  - Please do _not_ include empty parentheses to indicate a function,
    as this makes it hard to distinguish a function name from a call with no arguments.
- `folder-name/` (hyphens instead of underscores, trailing slash for clarity)
- `file-name` (hyphens instead of underscores)
- `'string'` and `"string"`
  - We will settle on single vs. double quotes before we publish :-)
- Method chaining in pandas:

    ```
    (dataframe
        .method()
        .method(short_arg)
        .method(
            long_arg1,
            long_arg2))
    ```

For markdown, we use ATX-headers (`#` prefix) rather than Setext headers (`=/-`
underlines), links with `[linkname][tag]` rather than `[linkname](url)`, and
fenced code blocks rather than indented blocks.

There are more details for what we recommend for learners in
[rse-style.Rmd](rse-style.Rmd). Discuss further in [issue #116](https://github.com/merely-useful/merely-useful.github.io/issues/116).

Please note that we use Simplified English rather than Traditional English,
i.e., American rather than British spelling and grammar.

## Setting Up

This book is written in [Bookdown](https://bookdown.org/).
If you want to preview builds on your own computer, please:

1.  Follow the instructions for installing Bookdown.
2.  Run `make everything` to recompile everything.
    -   Run `make` on its own to see a list of targets for rebuilding specific volumes as HTML or PDF.

Please note that Bookdown works best with [TinyTeX](https://yihui.name/tinytex/).
After installing it, you can run `make tex-packages` to install all the packages this book depends on.
You do _not_ need to do this if you are only building and previewing the HTML versions of the books.
