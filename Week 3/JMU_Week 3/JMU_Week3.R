# Week 3 Assignment
#Joanne Unite

#Loading the packages I need

library(readr)
library(ggplot2)

#Importing/loading the data
#Here is the url where I downloaded the csv file: https://www.kaggle.com/datasets/yukawithdata/spotify-top-tracks-2023?resource=download
top50 <- read_csv("top_50_2023.csv")

#Checking the column names and data types. Also checking the summary info of the data.

spec(top50)
summary(top50)

#Creating a histogram where I can what tempo range the majority of the top 50 songs are in. Each bin has a designated color.

colors <- c(rep("red",1), rep("blue",1), rep("orange",1), rep("green",1), rep("yellow",1), rep("pink",1))
ggplot(top50, aes(x = tempo)) + 
  geom_histogram(binwidth = 25, fill = colors)

#In the spotify top 50 chart for 2023, the majority of song have a tempo speed between 75-150 bpm.
