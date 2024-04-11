#roxygen2 Documentation
#' @title C_to_F Celsius Conversion
#' @description This function allows you convert Celsius to Fahrenheit
#'  
#'  
#' @param F_temp The temperature in degrees Celsius
#' @return The temperature in degrees Fahrenheit 
#' @examples
#' 
#' temp1 <-C_to_F(22);
#' temp2 <-C_to_F(c(-2,12,23));
#' @export
C_to_F <-function(C_temp){
  F_temp<-(C_temp*9/5)+32
  return(F_temp)
}