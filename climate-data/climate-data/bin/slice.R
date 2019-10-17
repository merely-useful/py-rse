library(tidyverse)

args <- commandArgs(trailingOnly=TRUE)
firstYear <- as.numeric(args[1])
lastYear <- as.numeric(args[2])
filenames <- args[c(-1, -2)]

take_slice <- function(name, from, to) {
  read_csv(name) %>%
    filter(Year >= from) %>%
    filter(Year <= to)
}

data <- filenames %>%
  map_dfr(take_slice, firstYear, lastYear) %>%
  format_csv("") %>%
  cat()
