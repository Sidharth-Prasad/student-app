library(recommenderlab)
library(plumber)

setwd("C:/Users/SidhPras/R")
data <- read.csv("CollectiveSampleData2.csv", head=TRUE, sep=",")

data<-data[,-c(1)]

train <- data[1:100,]

test <- data[101,]

test[,40:46] <- NA

Train <- as(train, "matrix")

trainRec <- as(Train, "realRatingMatrix")

Test <- as(test, "matrix")

testRec <- as(test, "realRatingMatrix")

studentRec <- Recommender(trainRec,method="")

studentPre <- predict(studentRec, testRec, n = 7)

as(studentPre, "list")

