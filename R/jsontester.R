library(recommenderlab)
library(plumber)
library(class)
library(jsonlite)



#' @post /recommend

recommend <- function(student) {
  test <- fromJSON(student)
  
  test <- as(test, "matrix")
  
  test <- as.data.frame(test)
  
  test <- t(test)
  
  data <- read.csv("CollectiveSampleData2.csv", head=TRUE, sep=",")
  
  train <- data[1:100, 2:40]
  
  colnames(test) <- colnames(train)
  
  print(test)
  print(train)
}  
