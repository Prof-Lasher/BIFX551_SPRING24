if (!require(dplyr)) install.packages("dplyr"); require(dplyr)
if (!require(tidyverse)) install.packages("tidyverse"); require(tidyverse)
if (!require(ggplot2)) install.packages("ggplot2"); require(ggplot2)
library(dplyr)
library(ggplot2)
library(tidyverse)
url <- "https://raw.githubusercontent.com/smerdov/eSports_Sensors_Dataset/master/matches/match_0/player_1/eeg_metrics.csv"

LoLFile <- read.csv(url)

#plot(LoLFile)
#print (LoLFile)

#LoLFile %>% select(time,Relaxation, Stress)

#continuous line plot of all variables
ggplot() + geom_line(LoLFile, mapping= aes(x= time, y = Engagement), color = "red")+ 
  geom_line(LoLFile, mapping= aes(x= time, y = Excitement), color = "blue")+
  geom_line(LoLFile, mapping= aes(x= time, y = Stress), color = "green")+
  geom_line(LoLFile, mapping= aes(x= time, y = Relaxation), color = "black") +
  labs(x = "Seconds over time", y = "Serverity")

  #+geom_point(LoLFile, mapping= aes(x= time, y = Engagement), color = "red")+   
  #geom_point(LoLFile, mapping= aes(x= time, y = Excitement), color = "blue")+   Adds dots but looks super crowded
  #geom_point(LoLFile, mapping= aes(x= time, y = Stress), color = "green")+
  #geom_point(LoLFile, mapping= aes(x= time, y = Relaxation), color = "black")

#descrete bar graph of play time per player
url <- "https://raw.githubusercontent.com/smerdov/eSports_Sensors_Dataset/master/players_info.csv"
stats <- read.csv(url)
#print(person1)
stats_base <- ggplot(stats,aes(x=player_id, y = hours_played))
stats_base + geom_bar(stat="identity") + labs(x = "Player ID", y = "Hours Played")


#graph using size to show quantity of hours played
url <- "https://raw.githubusercontent.com/smerdov/eSports_Sensors_Dataset/master/players_info.csv"
stats <- read.csv(url)
#print(person1)
ggplot(stats, aes(x=player_id, y= hours_played)) + geom_point(aes(size=hours_played))










