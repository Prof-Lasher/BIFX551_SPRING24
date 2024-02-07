#Converts Miles to Nautical Miles
# distance = distance in native units
# distType = native unit (nm or mi)
#
#  Notes: 
#    - Will convert distType to lowercase, but does not handle all possible denotations of nautical miles and miles
#    - Returns NA with an invalid distType input
#
convertDistance <- function( distance, distType ){
  
  #Convert input to lowercase
  distType <- tolower(distType )
  
  # Use a switch statement to 
  res = switch( 
    distType, 
    "nm"=distance*1.15078,
    "mi"=distance*0.868976,
    NA
  )
  return(res)
}

convertDistance(100,"mi") #Expected 86.8976
convertDistance(100,"nm") #Expected 115.078