if (!require(dplyr)) install.packages("dplyr"); require(dplyr)
if (!require(tidyverse)) install.packages("tidyverse"); require(tidyverse)
if (!require(ggplot2)) install.packages("ggplot2"); require(ggplot2)
library(dplyr)
library(ggplot2)
library(tidyverse)

###################################################
#LoLFile Read
url <- "https://raw.githubusercontent.com/smerdov/eSports_Sensors_Dataset/master/matches/match_0/player_1/eeg_metrics.csv"
LoLFile <- read.csv(url)

#continuous line plot of all variables.
  #This graph takes a look at 4 variables tracked on one of the players. 
  #This is a little hard to read but you can kind of see trends in the spikes. 
  #Might be interesting to normalize the groups to overlay eachother a little better and see trends better  
ggplot() + geom_line(LoLFile, mapping= aes(x= time, y = Engagement), color = "red")+ 
  geom_line(LoLFile, mapping= aes(x= time, y = Excitement), color = "blue")+
  geom_line(LoLFile, mapping= aes(x= time, y = Stress), color = "green")+
  geom_line(LoLFile, mapping= aes(x= time, y = Relaxation), color = "black") +
  labs(x = "Seconds over time", y = "Serverity")

  #+geom_point(LoLFile, mapping= aes(x= time, y = Engagement), color = "red")+   
  #geom_point(LoLFile, mapping= aes(x= time, y = Excitement), color = "blue")+   Adds dots but looks super crowded
  #geom_point(LoLFile, mapping= aes(x= time, y = Stress), color = "green")+        So I removed it.
  #geom_point(LoLFile, mapping= aes(x= time, y = Relaxation), color = "black")


###################################################

#descrete bar graph of play time per player
#This takes the players IDs and then charts their Hours played. Has trouble separating the "Pros" and "Amateurs"
#I also decided to use more objects here because I was trying to remove amateurs and thought breaking it down might help
url <- "https://raw.githubusercontent.com/smerdov/eSports_Sensors_Dataset/master/players_info.csv"
stats <- read.csv(url)
stats_base <- ggplot(stats,aes(x=player_id, y = hours_played))
stats_base + geom_bar(stat="identity") + labs(x = "Player ID", y = "Hours Played")


#graph using size to show quantity of hours played
#The chart is a little similar to the last one but the amateur and pros are separated as well as the dots for each player
#is larger or smaller based on quantity.
url <- "https://raw.githubusercontent.com/smerdov/eSports_Sensors_Dataset/master/players_info.csv"
stats <- read.csv(url)
ggplot(stats, aes(x=player_id, y= hours_played)) + geom_point(aes(size=hours_played))



#Faceted bar graph split by amateurs and pros, comparing hours played. This is what I was trying to do on the second graph.
#Faceted seems really good at breaking information down. Also, the player IDs are the same to "position" they play 
#with is why I wanted to break it up but still have the Player IDs in order
url <- "https://raw.githubusercontent.com/smerdov/eSports_Sensors_Dataset/master/players_info.csv"
stats <- read.csv(url)
stats_base <- ggplot(stats,aes(x=player_id, y = hours_played))
stats_base + geom_bar(stat="identity") + labs(x = "Player ID", y = "Hours Played") + facet_grid(.~team)






