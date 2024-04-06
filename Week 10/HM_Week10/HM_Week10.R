#Loading necessary libraries
if (!require("devtools")) install.packages("devtools")
library(devtools)
if (!require("roxygen2")) install.packages("roxygen2")
library(roxygen2)

#setting a directory
setwd("Desktop/")
#making and creating a directory Structure
Direct <- getwd()
create("myfirstpackage")
#moving to the working directory
setwd( paste( Direct, "/myfirstpackage", sep = "" ) )
utils::browseURL( getwd())


#generating the documents
getwd()
document()

#installing the package
setwd("..")
getwd()
install("myfirstpackage")

#looking at help for the functions created
library(myfirstpackage)
?add_two_numbers
?last_two_chars


#install from github
install_github(repo = "https://github.com/hamogus123/HM_myfirstpackage.git", force = TRUE)

#testing
library(myfirstpackage)
add_two_numbers(x = 5, y = 5)
last_two_chars("Hello World")




