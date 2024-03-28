
#Package used to simplify the building of packages
if (!require("devtools")) install.packages("devtools")
library(devtools)

#Package used to automate documentation
if (!require("roxygen2")) install.packages("roxygen2")
library(roxygen2)


#Once installed the first thing to do is make a directory
# 1. Let's see where we are?
wd <- getwd()

#2. Create a basic Directory Structure
create("MyFirstPackage")

#Move to directory
setwd( paste( wd, "/MyFirstPackage", sep = "" ) )
utils::browseURL( getwd())

#Let's make a file which has some functions
#I am going to copy a premade file into the R directory

#Add some documentation
# Roxygen references!
# https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html

#Generate the documents!
getwd()
document()

#Let's install our package
setwd("..")
getwd()
install("MyFirstPackage")

#Look at the help for the function created!
?fibonacci

#Awesome Let's publish it to github so everyone can use it!
# Simply copy the package directory to your repository



#Let's test to see if we can install from github!
library(devtools) # Make sure that the devtools library is loaded
install_github("Prof-Lasher/BIFX551_SPRING24/tree/main/Week%2010/Code%20Examples/MyFirstPackage");



