#Converts miles to km or km to miles
# distance = distance in native units
# distType = native unit (km or mi)
#
#  Notes: 
#    - Will convert distType to lowercase, but does not handle all possible denotations of km and mile
#    - Returns NA with an invalid distType input
#
convertDistance <- function( distance, distType ){
  
  #Convert input to lowercase
  distType <- tolower(distType )
  
  # Use a switch statement to 
  res = switch( 
    distType, 
    "km"=distance*0.621371,
    "mi"=distance*1.60934,
    NA
  )
  return(res)
}

convertDistance(100,"mi") #Expected 160.934
convertDistance(100,"km") #Expected 62.1371
