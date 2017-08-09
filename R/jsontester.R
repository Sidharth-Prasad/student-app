library(recommenderlab)
library(plumber)
library(class)
library(jsonlite)


#' @get /iteminfo
iteminfo <- function(item){
  setwd("C:/Users/SidhPras/git/student-app/R")
  itemInfo <- read.csv("ItemInfo.csv", head=TRUE, sep=",")
  row.names(itemInfo) <- itemInfo[,1]
  itemInfo <- itemInfo[,-1]
  print(itemInfo)
  item <- fromJSON(item)
  item <- gsub(" ",".",item)
  print(item)
  return <- itemInfo[item,]
  print(return)
  return
}




