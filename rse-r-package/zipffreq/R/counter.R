#' Count words in a vector.
#'
#' @param all_words Character vector of words
#'
#' @return tibble with (word, n) pairs
#'
#' @export
#'
#' @import dplyr
#' @importFrom magrittr %>%
#' @importFrom rlang .data
tally_words <- function(all_words) {
  dplyr::tibble(word = all_words) %>%
    dplyr::group_by(.data$word) %>%
    dplyr::tally()
}
