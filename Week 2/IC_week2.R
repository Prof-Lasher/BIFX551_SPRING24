# this function will convert stone (used as a weight measurement in the UK) to lbs, and vice versa
# weight = weight in numeric units
# type = type of weight measurement, either stone or lbs

weightConvert <- function( weight, type){
  
  type <- tolower(type )
  
  result = switch(
    type,
    "st"=weight*14, #if the input of weight is in stone then the weight should be multiplied by 14 to convert to lbs
    "lbs"=weight/14, #if the input of weight is in lbs then the weight should be divided by 14 to convert to stone
    NA
  )
  return(result)
}

weightConvert( 140, "lbs") #expected value is 10
weightConvert( 14, "st") #expected value is 196

