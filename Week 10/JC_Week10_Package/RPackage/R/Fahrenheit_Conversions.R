#roxygen2 Documentation
#' @title F_to_C Fahrenheit Conversion
#' @description This function allows you convert Fahrenheit to Celsius
#'  
#'  
#' @param F_temp The temperature in degrees Fahrenheit 
#' @return The temperaure in degrees Celsius 
#' @examples
#' 
#' temp1 <-F_to_C(50);
#' temp2 <-F_to_C(c(50,60,30));
#' @export

F_to_C <-function(F_temp){
  C_temp<-(F_temp-32)* 5/9
  return(C_temp)
}
