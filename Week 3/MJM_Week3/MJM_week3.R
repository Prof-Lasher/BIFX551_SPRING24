# Find a csv or txt file, download it, read it into a dataframe, use summary() to describe it, and create a labeled graph. Submit as an .R file. It should run and produce your graph.
# Load packages
library("readr")
library("ggplot2")

# url
# https://www.kaggle.com/datasets/monkeybusiness7/marvel-cinematic-universe-box-office

# Read in CSV
df <- read.csv('marvel_box_office.csv',sep = ",", header=TRUE)
summary(df)

# This is a dataset for Marvel moveis that contains 66 observations (rows) over 23 different variables (columns)

# Factor months to be in order
df$Release.Month <- factor(df$Release.Month, levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

# Domestic Box office sales by month
ggplot(data = df, aes(x = `Release.Month`, y = `Domestic.Box.Office`)) + 
  geom_col() + # Bar plot
  theme_bw() + 
  xlab("Month Released") + 
  ylab("Domestic Box Office (USD)") + 
  ggtitle("Domestic Box Office Earnings By Month") + 
  theme(plot.title = element_text(hjust = 0.5)) # Centers title

# Based on the bar graph we can see that the biggest month for the box office when combining all Marvel movies is May, totaling over 6 billion USD in sales. 
# The lowest month in sales is January, with only one film released and grossing less than 25 million.


# Here I looked at the correlation between Domestic Box Office (inflation adjusted) earnings and movie budget. 
ggplot(data = df, aes(x = `Budget`, y = `Inflation.Adjusted.Domestic`)) + 
  geom_point() + 
  geom_smooth(method=lm, se = FALSE) +
  theme_bw() +
  xlab("Budget USD") +
  ylab("Domestic Box Office (USD)") +
  ggtitle("Domestic Box Office Earnings By Movie Budget (Adjusted for Inflation)") +
  theme(plot.title = element_text(hjust = 0.5))

# Higher budgets have a strong correlation with higher domestic box office sales

# I wanted to see if international box office followed the same trend with budget as domestic box office
ggplot(data = df, aes(x = `Budget`, y = `Inflation.Adjusted.International`)) + 
  geom_point() + 
  geom_smooth(method=lm, se = FALSE) +
  theme_bw() +
  xlab("Budget USD") +
  ylab("International Box Office (USD)") +
  ggtitle("International Box Office Earnings By Movie Budget (Adjusted for Inflation)") +
  theme(plot.title = element_text(hjust = 0.5))

# Overall it looks like the trend is similar, and that there is a positive correlation between budget and both domestic and international box office sales