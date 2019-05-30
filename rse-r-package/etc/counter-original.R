#' Count words in a vector.
#'
#' @param all_words Character vector of words
#'
#' @return tibble with (word, n) pairs
#'
#' @export
tally_words <- function(all_words) {
  tibble(word = all_words) %>%
    group_by(word) %>%
    tally()
}
