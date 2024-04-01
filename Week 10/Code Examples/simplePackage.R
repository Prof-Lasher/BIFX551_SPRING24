
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
# https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html

#Generate the documents!
getwd()
document()

#Let's install our package
setwd("..")
getwd()
install("MyFirstPackage")

#Look at the help for the function created!
library(MyFirstPackage)
?fibonacci

#Awesome Let's publish it to github so everyone can use it!
# Simply copy the package directory to your repository


#Let's test to see if we can install from github!
library(devtools) # Make sure that the devtools library is loaded
#detach("package:MyFirstPackage", unload=TRUE)

#This will pull down the full repo, before getting the package directory
install_github("Prof-Lasher/BIFX551_SPRING24", subdir="/Week 10/Code Examples/MyFirstPackage")

# Great!
# Lets talk about storing data in a package

#https://r-pkgs.org/data.html
#Let's save the first 100 entries of
library(MyFirstPackage)
fib100 <- fibonacci(100)

#Make sure we are in the package directory
setwd( paste( wd, "/MyFirstPackage", sep = "" ) )
#Save the data
usethis::use_data(fib100, overwrite = TRUE)

#Unload
rm( fib100 )
detach("package:MyFirstPackage", unload=TRUE)

#Load again to show it is part of the package
library(MyFirstPackage)
data("fib100")

#Sweet! we have data lets create another function to plot the fib
# This one will a dependency of ggplot
#  Copy plotfib
#  Add Imports to the DESCRIPTION file
#  #Reinstall library to check


#Now lets add a test to our
#Setup the test directory
# First make sure you are in the package directory
#https://r-pkgs.org/testing-basics.html
getwd()

#Be sure to opent he file you want to generate a test for
#usethis::use_test()
#Discuss the different testing methods






