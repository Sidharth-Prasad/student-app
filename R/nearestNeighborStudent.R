library(recommenderlab)
library(plumber)
library(class)
library(jsonlite)


setwd("C:/Users/SidhPras/R")
data <- read.csv("CollectiveSampleData2.csv", head=TRUE, sep=",")

train <- data[1:100, 2:40]

test <- data[101, 2:40]

cl <- t(data[1:100,1])

studentKNN <- knn(train, test, cl, k = 1, l = 0, prob = FALSE, use.all = TRUE)

neighbor <- as(studentKNN, "integer")

neighbor

items <- data[1:100,41:47]

itemTrain <- as(items, "matrix")
itemTrain <- as(itemTrain, "realRatingMatrix")

studentRec <- Recommender(itemTrain[1:99,], "IBCF")

studentPre <- predict(studentRec, itemTrain[neighbor,], n=3)

as(studentPre, "list")



#' @post /recommend_TBD
recommend_TBD <- function(student) {
  inputdata <-fromJSON(student)
  #convert into a test data
  testData #-----
  neighbor <- as(studentKNN, "integer")
  
  # predict items
  studentPre <- predict(studentRec, itemTrain[neighbor,], n=3)
  
  #returns item
  
  studentPre
  

}

#' @post /recommend
recommend <- function(student) {
  inputdata <-fromJSON(student)
  setwd("C:/Users/SidhPras/R")
  data <- read.csv("CollectiveSampleData2.csv", head=TRUE, sep=",")
  
  train <- data[1:100, 2:40]
  
  test <- data[101, 2:40]
  
  cl <- t(data[1:100,1])
  
  studentKNN <- knn(train, test, cl, k = 1, l = 0, prob = FALSE, use.all = TRUE)
  
  neighbor <- as(studentKNN, "integer")
  
  neighbor
  
  items <- data[1:100,41:47]
  
  itemTrain <- as(items, "matrix")
  itemTrain <- as(itemTrain, "realRatingMatrix")
  
  studentRec <- Recommender(itemTrain[1:99,], "IBCF")
  
  studentPre <- predict(studentRec, itemTrain[neighbor,], n=3)
  
  #as(studentPre, "list")
  studentPre
}  

recommend("")
