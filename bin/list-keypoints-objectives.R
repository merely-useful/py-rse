library(commonmark)
library(tidyverse)
library(xml2)
library(glue)
library(fs)

# Extract chapter info ----------------------------------------------------

chapter_files <- dir_ls("chapters/")

extract_h1_text <- function(.file) {
  .file %>%
    read_lines() %>%
    markdown_xml() %>%
    read_xml() %>%
    xml_find_first(".//d1:heading") %>%
    xml_text() %>%
    str_remove(" \\{.*$")
}

chapter_name <- chapter_files %>%
  map_chr(extract_h1_text)

chapter_df <- tibble(
  id = chapter_files %>%
    str_remove("^.*\\/") %>%
    str_remove("\\.R?md$"),
  chapter_file = chapter_files,
  chapter_name = chapter_name
)

# Extract keypoint info ---------------------------------------------------

keypoint_files <- dir_ls("keypoints")

keypoint_df <- tibble(
  id = keypoint_files %>%
    str_remove("^.*\\/") %>%
    str_remove("\\.md$"),
  keypoint_files = keypoint_files
)

# Extract objectives info -------------------------------------------------

objectives_files <- dir_ls("objectives")

objectives_df <- tibble(
  id = objectives_files %>%
    str_remove("^.*\\/") %>%
    str_remove("\\.md$"),
  objectives_files = objectives_files
)

# Get chapter order -------------------------------------------------------

chapter_order <- yaml::read_yaml("_bookdown.yml")$rmd_files %>%
  str_match("py-rse\\/.*") %>%
  na.omit()

order_df <- tibble(
  ordering = 1:length(chapter_order),
  id = chapter_order %>%
    str_remove("^.*\\/") %>%
    str_remove("\\.R?md$")
)

# Combine, prepare, and paste ---------------------------------------------

# To look it over
reduce(list(chapter_df, keypoint_df, objectives_df, order_df),
       full_join,
       by = "id") %>%
  View()

combined_df <-
  reduce(list(chapter_df, keypoint_df, objectives_df, order_df),
         full_join,
         by = "id") %>%
  arrange(ordering) %>%
  # To get rid of unnecessary info
  na.omit()

keypoint_list_to_paste <- combined_df %>%
  glue_data("

  ## {chapter_name}

  ```{{r, child='{keypoint_files}'}}
  ```

  ") %>%
  glue_collapse()

# Send to clipboard to paste
clipr::write_clip(keypoint_list_to_paste)

objective_list_to_paste <- combined_df %>%
  glue_data("

  ## {chapter_name}

  ```{{r, child='{objectives_files}'}}
  ```

  ") %>%
  glue_collapse()

clipr::write_clip(objective_list_to_paste)
