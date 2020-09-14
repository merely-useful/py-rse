library(tidyverse)
library(here)

tmp_md_file <- tempfile(fileext = ".md")

rmarkdown::pandoc_convert(
  here("includes/before_body.tex"),
  to = "markdown",
  output = tmp_md_file
)

tmp_md_file %>%
  read_lines() %>%
  str_replace_all("\\\\", "  ") %>%
  write_lines(here("includes/dedication.md"))
