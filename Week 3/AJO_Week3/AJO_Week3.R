# 1.) URL downloaded from : https://www.kaggle.com/datasets/sujithmandala/obesity-classification-dataset
# 2.) renamed the cvs file it "obesity_data.csv"

# Locate working directory

getwd()

# Set it to location on your computer where csv was downloaded

setwd("/Users/olssons/Documents/GitHub/BIFX551_SPRING24/Data_Sets")

# Read the file into R-studio 

file <- 'obesity_data.csv'

# Give file a name

data <- read.csv(file)

# Remove some columns using subset and name new df

data2 <- subset(data, select = -c(ID, Age, Gender, Height, Label))

# Learn info about df

View(data2)

nrow(data2)

ncol(data2)

colnames(data2)

str(data2)

summary(data2)


# summary(data2)
# Weight            BMI       
# Min.   : 10.00   Min.   : 3.90  
# 1st Qu.: 35.00   1st Qu.:16.70  
# Median : 55.00   Median :21.20  
# Mean   : 59.49   Mean   :20.55  
# 3rd Qu.: 85.00   3rd Qu.:26.10  
# Max.   :120.00   Max.   :37.20


# Create a scatter plot

x <- data2$Weight
y <- data2$BMI

# Plot with main and axis titles

# Change point shape (pch = 19) and remove frame.

plot(x, y, main = "Coorelation between BMI and Weight",
     xlab = "Weight (kg)", ylab = "BMI",
     pch = 19, frame = FALSE)

########################

# DATA SUMMARY 

# The data frame shows two variables, Weight, and BMI.
# There are 108 objects or observations for both Weight and BMI.
# The minimum weight recorded was 10.00 kg and the minimum BMI was 3.90
# The average weight was 59.59 kg and the average BMI was 20.55.
# The maximum weight was 120.00 kg and the maximum BMI was 37.20.
# Weight is represented as an integer and BMI as a number. 

##########################

