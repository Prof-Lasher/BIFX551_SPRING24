#' Mouse or Rat Function
#'
#' Determines whether you have a mouse or rat based on the parameter
#' @param nakedtail Does your rodent have a naked tail? Defaults to FALSE.

mouseOrrat <- function(nakedtail=FALSE){
  if (nakedtail==FALSE){
    print("You have a mouse.")
  }
  else {
    print("You have a rat. Not correct.")
  }
}

#' Mice Nest Function
#'
#' Determines if you have a mice nest or not based on the number of mice you have
#' @param number If number is larger than 2 you have a nest.

mousemultiples <- function(number){
  if (number > 2){
    print("You have a nest of mice.")
  }
  else {
    print("No mice nest for you. How sad.")
  }
}
