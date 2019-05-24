library(tidyverse)   #Script requires tidyverse and reaxl libraries 
library(readxl)
X2019_spring_match_data_OraclesElixir_2019_05_01_1_ <- read_excel("D:/College/2019-spring-match-data-OraclesElixir-2019-05-01 (1).xlsx") #this is where I have stored the Excel file containing data. 

naADC <- filter(X2019_spring_match_data_OraclesElixir_2019_05_01_1_, league == "LCS", position == "ADC" )
naADC <- select(naADC, player, team, k, d, a)
naADC <- filter(naADC , player != "Asta", player != "Auto", player != "Keith", player != "Cody Sun")

ggplot(naADC, aes(x = (k + a), y = d , color= player, group = player)) + 
  geom_smooth(method = lm, se = FALSE) +
  xlab("Kills and Assists") + 
  ylab("Deaths") +
  labs(title = "Performance of ADCs in the North American LCS 2019")