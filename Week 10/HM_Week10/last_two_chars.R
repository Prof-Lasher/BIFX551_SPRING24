#' Last Two Characters
#'
#' This function returns the last two characters of a given string.
#'
#' @param word A character string.
#' @return The last two characters of \code{word}.
#' @examples
#' last_two_chars("hello")
#' @export
last_two_chars <- function(word) {
  return(substring(word, nchar(word)-1, nchar(word)))
}
