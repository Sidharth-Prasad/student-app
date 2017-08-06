library(recommenderlab)
library(plumber)
library(class)
library(jsonlite)



#' @post /recommend

recommend <- function(student) {
  
  input <- fromJSON(student)
  
  input <- as(input, "matrix")
  
  input <- as.data.frame(input)
  
  input <- t(input)
  
  setwd("C:/Users/SidhPras/git/student-app/R")
  data <- read.csv("CollectiveSampleData2.csv", head=TRUE, sep=",")
  
  test <- matrix(nrow = 1, ncol = 39)
  
  test <- as.data.frame(test)
  
  test[,1:39] <- 0
  
  train <- data[1:100, 2:40]
  
  colnames(test) <- colnames(train)
  
  test[,"Age"] <- input[,"Age"]
  
  test[,"GPA"] <- input[,"GPA"]
  
  test[,input[,"City"]] <- 1
  
  test[,input[,"Gender"]] <- 1
  
  test[,input[,"Ethnicity"]] <- 1
  
  test[,input[,"Religion"]] <- 1
  
  test[,input[,"Industry"]] <- 1
  
  test[,input[,"Major"]] <- 1
  
  test[,input[,"Religion"]] <- 1
  
  
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
