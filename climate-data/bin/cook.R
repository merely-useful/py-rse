library(tidyverse)

args = commandArgs(trailingOnly=TRUE)
data <- read_csv(args[1]) %>%
  select(-`Product code`) %>%
  rename(Station=`Bureau of Meteorology station number`) %>%
  mutate(Month=as.numeric(Month)) %>%
  mutate(Day=as.numeric(Day))

if ("Rainfall amount (millimetres)" %in% colnames(data)) {
  data <- data %>%
    rename(`Rainfall (mm)`=`Rainfall amount (millimetres)`) %>%
    select(-c("Period over which rainfall was measured (days)"))
}

if ("Maximum temperature (Degree C)" %in% colnames(data)) {
  data <- data %>%
    rename(`Max Temp (C)`=`Maximum temperature (Degree C)`) %>%
    select(-c("Days of accumulation of maximum temperature"))
}

data
