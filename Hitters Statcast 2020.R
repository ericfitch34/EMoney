library(tidyverse)
library(ggplot2)
library(dplyr)
library(ggrepel)
library(scales)

Hitters_Statcast <- read.csv("FanGraphs Leaderboard.csv")

Hitters_Statcast$HardHit. = as.numeric(gsub("[\\%,]", "", Hitters_Statcast$HardHit.))

Hitters_Statcast$HardHit. <- as.numeric(Hitters_Statcast$HardHit.) /100

Hitters_Statcast %>% 
 ggplot(aes(EV, LA)) + 
  geom_point()+ 
  geom_smooth(method = lm)+
  ggtitle("2020 MLB Statcast Hitting Leaderboards",
          subtitle = "Exit Velo vs Launch Angle")+
  xlab("Exit Velocity")+
  ylab("Launch Angle")


Hitters_Statcast %>% 
  ggplot(aes(HardHit., LA)) + 
  geom_point()+
  scale_x_continuous(labels=scales::percent) +
  ggtitle("2020 MLB Statcast Hitting Leaderboards",
          subtitle = "Hard Hit % vs Launch Angle")+
  xlab("Hard Hit %")+
  ylab("Launch Angle")

Hitters_Statcast %>% 
  ggplot(aes(maxEV, HardHit.)) + 
  geom_point()+
  geom_smooth(method = lm)+
  scale_y_continuous(labels=scales::percent) +
  ggtitle("2020 MLB Statcast Hitting Leaderboards",
          subtitle = "Max Exit Velocity vs Hard Hit %")+
  xlab("Max Exit Velocity")+
  ylab("Hard Hit %")

  

Hitters_Statcast %>% filter(Team %in% c("White Sox", "Athletics", "Twins", "Dodgers"))%>% group_by(Team)%>%
  ggplot(aes(maxEV, HardHit., color=Team)) + 
  geom_point()+
  scale_y_continuous(labels=scales::percent) +
  ggtitle("2020 MLB Max Exit Velocity vs Hard Hit %",
          subtitle = "Top Power Hitting Teams")+
  xlab("Max Exit Velocity")+
  ylab("Hard Hit %")+
  geom_text(aes(label=HardHit.),hjust=0,vjust=0, check_overlap = T)



Hitters_Statcast %>% filter(Team %in% c("White Sox", "Athletics", "Twins", "Dodgers"))%>% 
  group_by(Team)%>%
  summarise(HardHit. = mean(HardHit. , na.rm= TRUE)) %>% 
  ggplot(aes(Team, HardHit.)) + 
  geom_bar(stat = "identity", fill = "blue")+
  scale_y_continuous(labels=percent) +
  theme_bw()+
  ggtitle("2020 MLB Team Hard Hit %",
          subtitle = "Top Power Hitting Teams")+
  xlab("Teams")+
  ylab("Hard Hit %")



Hitters_Statcast %>% filter(Team %in% c("White Sox", "Athletics", "Twins", "Dodgers"))%>% 
  group_by(Team)%>%
  ggplot(aes(Team, Barrels, fill=LA)) + 
  geom_bar(stat = "identity")+
  ggtitle("2020 MLB Team Barrels",
          subtitle = "Top Power Hitting Teams (Stacked Bar fill w/Launch Angle")+
  xlab("Teams")+
  ylab("Barrels")




