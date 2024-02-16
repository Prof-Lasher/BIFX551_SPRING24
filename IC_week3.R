library(readr)

df <- read.csv('~/GitHub/BIFX551_SPRING24/Week 3/homes.csv',sep = ",", header=TRUE) #reads the data and turns it into a home df

summary(df) #summary of data in each column

plot(df$Sell,
     df$Living,
     xlab="Sale Price of House (thousands)",
     ylab = "Living Space of House (x100 sq. ft)",
     main="Actual Sale Price of House Compared to Living Space")

