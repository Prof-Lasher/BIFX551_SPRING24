#' A fibonacci generator function
#'
#' This function allows you to generate N numbers of the
#'   Fibonacci Sequence
#' @param n, Number of Values returned
#' @keywords fibonacci
#' @export
#' @examples
#' fibonacci( 5 )
#' 

fibonacci <- function(n) {
  a <- 0
  b <- 1
  ret <- c(a,b)
  
  #Check starting cases
  if( n == 0)   # Return empty
    return(NULL)
  else if( n == 1 ) # return the first static value
    return (c(a))
  else if( n == 2 )   # return the first and second static value
    return (c(a, b))
  
  #Loop and create a sequence
  for (i in 3:n) {
    next_num <- a + b
    ret <- (c(ret, next_num))
    a <- b
    b <- next_num
  }
  
  ret
}