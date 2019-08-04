We follow the [tidyverse style guide](https://style.tidyverse.org/) for R and
[PEP 8](https://www.python.org/dev/peps/pep-0008/) for Python as closely as
possible but specify some conventions further. We go against the style guides
only when it is considered that it will improve clarity.

Some specific conventions that were briefly discussed previously:

- `function_name` (snake_case)
- `variable_name` (snake_case)
- `folder-name/` (hyphens instead of underscores, trailing slash for clarity)
- `file-name`
- `'string'` and `"string"` (single or double quotes, It seems people prefer
  different options here)
- Method chaining in pandas:

    ```
    (dataframe
        .method()
        .method(short_arg)
        .method(
            long_arg1,
            long_arg2))
    ```

These are not set in stone, just collecting what was suggested in the issue.
There are more details for what we recommend for learners in [./style.Rmd]
(Python only so far). Discuss further in [issue
#116](https://github.com/merely-useful/merely-useful.github.io/issues/116).
