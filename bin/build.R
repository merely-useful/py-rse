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
src = normalizePath(args[1])
dst = normalizePath(args[2])
setwd(dirname(src))
knit(src, output = dst)
