#' Creating a function for rejecting negative input values
#'
#' @param r, Number input
#' @resturn n_check
#' @export
#' @examples
#' n_check(-2)


#Creating a function to reject the input of negative numbers
n_check <- function (r){
  if (r < 1) {
    print("Error")
  }
  else {
    return(r)
  }
}





