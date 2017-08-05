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
  
  setwd("C:/Users/SidhPras/git/student-app/R")
  data <- read.csv("CollectiveSampleData2.csv", head=TRUE, sep=",")
  
  train <- data[1:100, 2:40]
  
  colnames(test) <- colnames(train)
  #test <- data[101, 2:40]
  
  cl <- t(data[1:100,1])
  
  studentKNN <- knn(train, test, cl, k = 1, l = 0, prob = FALSE, use.all = TRUE)
  
  neighbor <- as(studentKNN, "integer")
  
  neighbor
  
  items <- data[1:100,41:47]
  
  itemTrain <- as(items, "matrix")
  itemTrain <- as(itemTrain, "realRatingMatrix")
  
  studentRec <- Recommender(itemTrain[1:99,], "IBCF")
  
  studentPre <- predict(studentRec, itemTrain[neighbor,], n=3)
  
  output <- as(studentPre, "list")
  
  output
}  
