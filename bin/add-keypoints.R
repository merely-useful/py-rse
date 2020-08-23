library(commonmark)
library(tidyverse)
library(xml2)
library(glue)

# Extract chapter info ----------------------------------------------------

chapter_files <- fs::dir_ls("py-rse/")

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

keypoint_files <- fs::dir_ls(c("keypoints/py-rse/", "keypoints/shared-rse/"))

keypoint_df <- tibble(
  id = keypoint_files %>%
    str_remove("^.*\\/") %>%
    str_remove("\\.md$"),
  keypoint_files = keypoint_files
)


# Get chapter order -------------------------------------------------------

chapter_order <- yaml::read_yaml("_py-rse.yml")$rmd_files %>%
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
# full_join(chapter_df, keypoint_df, by = "id") %>%
#   full_join(order_df, by = "id") %>%
#   View()

keypoint_list_to_paste <- full_join(chapter_df, keypoint_df, by = "id") %>%
  full_join(order_df, by = "id") %>%
  arrange(ordering) %>%
  # To get rid of unnecessary info
  na.omit() %>%
  glue_data("

  ## {chapter_name}

  ```{{r, child='{keypoint_files}'}}
  ```

  ") %>%
  glue_collapse()

# Send to clipboard to paste
clipr::write_clip(keypoint_list_to_paste)
