library(tidyverse)
library(ggplot2)
library(dplyr)
library(ggrepel)
library(scales)
library(DT)
library(kableExtra)

install.packages("reactable")

library(reactable)

library(gt)


FanGraphs_Hitters <- read.csv("Hitting FanGraphs Leaderboard.csv")

colnames(FanGraphs_Hitters)

names(FanGraphs_Hitters)[names(FanGraphs_Hitters) == "ï..Name"] <- "Names"


FanGraphs_Hitters %>% 
  ggplot(aes(WAR, wRC.)) + 
  geom_point()+ 
  geom_smooth(method = lm)+
  ggtitle("2020 MLB FanGraphs WAR Best Hitters",
          subtitle = "Analyzing Players WAR vs WRC+ in 2020 Season")+
  xlab("WAR")+
  ylab("WRC+")

FanGraphs_Hitters %>% 
  ggplot(aes(Off, wRC.)) + 
  geom_point()+ 
  geom_smooth(method = lm)+
  ggtitle("2020 MLB FanGraphs Off WAR Best Hitters",
          subtitle = "Analyzing Players Offensive WAR vs WRC+ in 2020 Season")+
  xlab("Offensive WAR")+
  ylab("WRC+")

FanGraphs_Hitters %>% 
  ggplot(aes(SLG, ISO)) + 
  geom_point()+ 
  geom_smooth(method = lm)+
  ggtitle("2020 MLB FanGraphs Hitters Power",
          subtitle = "Analyzing SLG % vs ISO Power")+
  xlab("Slugging Percentage")+
  ylab("ISO")

FanGraphs_Hitters %>% 
  ggplot(aes(BABIP, wOBA)) + 
  geom_point()+ 
  geom_smooth(method = lm)+
  ggtitle("2020 MLB Hitters BABIP vs wOBA",
          subtitle = "How Sustainable Has Hitting Been in Shortended Season")+
  xlab("BABIP")+
  ylab("wOBA")


table <- FanGraphs_Hitters%>% select(Names, Team, G, wRC., wOBA, WAR, BABIP, ISO) %>% arrange(desc(wRC.)) %>% head(20) 
kable(table)

FanGraphs_Hitters %>% gt()




