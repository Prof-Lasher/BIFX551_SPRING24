#' An Ignorance test function
#'
#' This function allows you to determine of you are ignorant by answering one question.
#'   Get a nice message if not and if you are, an explanation why.
#' @param Do you love pitbulls? Defaults to TRUE
#' @keywords pitbulls, ignorance
#' @export
#' @examples
#' pitbullsFunc()
#' 
pitbullsFunc <- function(love=TRUE){
  if (love==TRUE) {
    print("I really love pitbulls, sweetest of dogs.")
  }
  else {
    print("Because I equate an ill-trained, unsocialized, aggressive dog with all pitbulls, I am ignorant.")
  }
}
