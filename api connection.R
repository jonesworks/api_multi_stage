#this worked for docker

setwd("/Users/a12517/Desktop/api/modelops-playground-master/crash-api")
read.csv("crash.csv") -> crash
library(dplyr)
library(jsonlite)
library(httr)

predictions <- POST("http://127.0.0.1:8080/predict", 
                    body = toJSON(list(df= select(crash[c(1:200),], -injuries)))) %>%
  content("text", encoding = "UTF-8") %>% 
  fromJSON()

predictions %>%
      tibble
   

str(list(df= select(crash[c(1:200),], -injuries)))
