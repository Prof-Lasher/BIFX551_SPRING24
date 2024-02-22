

library(tidyverse)


# Reading in the file
mi_pollution <- read_csv("MI_pollutionB.csv")

# Checking out the data
spec(mi_pollution)

summary(mi_pollution)

# Histogram of NO2 Mean
hist(mi_pollution$'NO2 Mean ppb',
     main = "Detroit NO2, April-June 2000",
     xlab = 'Mean NO2 (ppb)',
     ylab = 'Frequency',
     breaks = 91,
     col = 'light blue',
     border = 'dark blue')
