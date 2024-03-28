#' A Fibonacci plot function
#'
#' This function allows you to plot N numbers of the
#'   Fibonacci Sequence
#' @param n, Number of Values returned
#' @keywords plotfib
#' @export
#' @examples
#' plotfib( 20 )
#' 
#' 
plotfib <- function(n) {
  d <- reshape2::melt(fibonacci(n))
  plt <- ggplot2::ggplot(d, aes(x=seq_along(value),y=value)) + 
    ggplot2::geom_point(stat="identity")+
    ggplot2::labs( y="n", x="value", title = "Fibonacci for N numbers ") +
    ggplot2::scale_x_discrete( limits=factor(1:n) )
  
  #Display plot
  plt
  
  #Return for other use
  return(plt)
}


