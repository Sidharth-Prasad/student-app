library(recommenderlab)
library(plumber)
library(class)
library(jsonlite)


#' @get /iteminfo
itemInfo <- function(item){
  setwd("C:/Users/SidhPras/git/student-app/R")
  itemInfo <- read.csv("ItemInfo.csv", head=TRUE, sep=",")
  row.names(itemInfo) <- itemInfo[,1]
  itemInfo <- itemInfo[,-1]
  return <- itemInfo[item,]
  return
}




