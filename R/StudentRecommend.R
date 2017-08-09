library(recommenderlab)
library(plumber)
library(class)
library(jsonlite)

#' @get /iteminfo
#' @json
iteminfo <- function(item){
  setwd("C:/Users/SidhPras/git/student-app/R")
  itemInfo <- read.csv("ItemInfo.csv", head=TRUE, sep=",")
  row.names(itemInfo) <- itemInfo[,1]
  itemInfo <- itemInfo[,-1]
  itemInfodim <- as.matrix(dim(itemInfo))
  item <- fromJSON(item)
  # item <- gsub(" ",".",item)
  item <- as.data.frame(item)
  item <- t(item)
  itemdim <- as.matrix(dim(item))
  results <- itemInfo[1:itemdim[2],]
  results[1:itemdim[2],1:itemInfodim[2]] <- 0
  for(i in 1:itemdim[2]){
    results[i,] <- itemInfo[item[i],]
  }
  results <- data.frame(results)
  results
}

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
  
  colnames(test) <- c("Age","Pittsburgh","West Lafayette","Boston","Seattle","Male","Female","Other Gender","GPA","American Indian/Alaska Native","Hispanic or Latino","White","Black or African American","Asian","Native Hawaiin or Pacific Islander","Hinduism","Christianity","Islam","Buddhism","Atheist","Other Religion","Finance","Education","Retail","Logistical/Utility Services","STEM","Arts","Social Studies","Natural Sciences","Business","Engineering","Humanities","Other Major","Visual Arts","Video Games","Theatre","Sports","Music","Literature")
  
  test[,"Age"] <- input[,"Age"]
  
  test[,"GPA"] <- input[,"GPA"]
  
  city <- input[,"City"]
  
  city <- toString(city)
  
  test[, city] <- 1
  
  gender <- input[,"Gender"]
  
  gender <- toString(gender)
  
  test[, gender] <- 1
  
  ethnicity <- input[,"Ethnicity"]
  
  ethnicity <- toString(ethnicity)
  
  test[, ethnicity] <- 1
  
  religion <- input[,"Religion"]
  
  religion <- toString(religion)
  
  test[, religion] <- 1
  
  industry <- input[,"Industry"]
  
  industry <- toString(industry)
  
  test[, industry] <- 1
  
  major <- input[,"Major"]
  
  major <- toString(major)
  
  test[, major] <- 1
  
  interests <- input[,"Interests"]
  
  interests <- toString(interests)
  
  test[, interests] <- 1
  
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
  
  print(output)
  
  output
  
}  
