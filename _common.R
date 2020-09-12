#' Insert graphics sensibly into an R Markdown document.
#'
#' @param file The path to the figure.
#'
#' @return Inserts image as necessary for the output format.
#'
#' @examples
#'
#' insert_graphic("figures/automate/concept.pdf")
insert_graphic <- function(file) {
  filename_no_ext <- tools::file_path_sans_ext(file)
  file_extension <- tools::file_ext(file)

  if (file_extension %in% c("pdf", "svg")) {
    pdf_file <- paste0(filename_no_ext, ".pdf")
    svg_file <- paste0(filename_no_ext, ".svg")

    pdf_check <- file.exists(pdf_file)
    svg_check <- file.exists(svg_file)

    if (!all(pdf_check, svg_check))
      stop("Make sure both a svg and pdf version of the graphic exists.")

    if (knitr::is_latex_output()) {
      knitr::include_graphics(pdf_file)
    } else {
      knitr::include_graphics(svg_file)
    }
  } else {
    knitr::include_graphics(file)
  }
}

# To use Python inside the bookdown R Markdown files.
library(reticulate)

knitr::opts_chunk$set(fig.align = "center",
                      out.width = "100%")
