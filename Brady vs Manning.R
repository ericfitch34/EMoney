library(tidyverse)
library(ggplot2)
library(dplyr)
library(skimr)
library(ggrepel)
Brady.Manning <-read.csv("Brady vs Manning.csv")

Brady.Manning1 <-read.csv("Brady vs Manning 1.csv")

ggplot(data=Brady.Manning1, aes(x = Season, y = EPA.Per.Play, group=Player.Name, color=Player.Name)) +
  geom_line(size = 1)+
  geom_point()+
  scale_x_continuous(breaks = c(2006,2010, 2012,2015))+
  theme_bw()+
  labs(caption = "Figure: Eric Fitch | Data Source: @nflscrapR | EPA - Measures the value of individual plays in terms of points")+
  ggtitle("Tom Brady vs Peyton Manning",
          subtitle = "Season-by-Season EPA/Play (2006-2015)")+
  xlab("Year")+
  ylab("EPA/Play")+
  scale_color_brewer(palette = "Paired")+
  geom_text(aes(label=EPA.Per.Play),hjust=0,vjust=0, check_overlap = T)+
  ggsave('Peyton-BradyTotalEPA.png', dpi=600, width = 25, height = 25/1.4, units = "cm")

scale_y_continuous(breaks = c(0.516072, 1.310169, 2.17168))

coords <- paste(Brady.Manning1$grades_pass, Brady.Manning1$Season, sep = ", ")  

ggplot(data=Brady.Manning1, aes(x = grades_pass, y = grades_offense)) +
  geom_point()+
  facet_wrap(~ Player.Name)+
  theme_bw()+
  labs(x = "PFF Overall Passing Grade",
       y = "PFF Overall Offensive Grade",
       caption = "Figure: Eric Fitch | Data Source: Pro Football Focus",
       title = 'Tom Brady & Peyton Manning: PFF Offensive Grade vs PFF Passing Grade',
       subtitle = "Yearly Regular Season Totals (2006 - 2015)")+
  geom_label_repel(aes(label=coords), size = 3)+
  ggsave('Peyton-Brady.png', dpi=600, width = 25, height = 25/1.4, units = "cm")



Tom.Peyton <-read.csv("Brady vs Manning (2001-2009).csv")

  ggplot(data=Tom.Peyton, aes(x = Player.Name, y = Y.A, fill=ANY.A)) +
  geom_bar(stat = "identity")+
  facet_wrap(~ Season)+  
  theme_bw()+
    labs(x = "Player Name",
         y = "Yards Per Pass Attempt",
         caption = "Figure: Eric Fitch | Data Source: Pro Football Reference",
         title = "Tom Brady VS Peyton Manning",
         subtitle = "Yards/Pass Att with ANY/A (Adjusted Net Yards/Att) Per Season")+
    geom_text(aes(label=Y.A),hjust=0,vjust=0, check_overlap = T)+
    ggsave('Peyton-Brady01.png', dpi=600, width = 25, height = 25/1.4, units = "cm")
  
  
