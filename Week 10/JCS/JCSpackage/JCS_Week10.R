install.packages("devtools")
library(devtools)
devtools::install_github("klutometis/roxygen")
library(roxygen2)

setwd("D:/PersonalFiles/-0722/Hood/551/BIFX551_SPRING24/Week 10/JCS/JCSpackage")
create("JCSpackage")

setwd("./JCSpackage")
document()

setwd("..")
install("JCSpackage")
