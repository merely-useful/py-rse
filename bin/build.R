#!/usr/bin/env Rscript

library(stringr)
library(purrr)
library(knitr)

USAGE = "Knit an RMarkdown files to create a Markdown file.

Usage: build.R source dest"

args <- commandArgs(trailingOnly = TRUE)
if (((length(args) == 1) && (args[1] %in% c("-h", "--help"))) || (length(args) != 2)) {
  message(USAGE)
  quit(status = 0)
}
knit(args[1], output = args[2])
