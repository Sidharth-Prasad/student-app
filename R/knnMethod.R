library(plumber)
library(knncat)


student( 21,'','','','','','','','','')

#' @get


#' @post
findNearestNeighbors <- functions(student){
  
  data <- read.csv(file="CollectiveSampleData.csv",head=TRUE,sep=",")
  
  train <- data[1:12]
  
  Data <- as(data, "matrix")
  
  simScore <- matrix(100,1)
  
  catRec <- knncat (train, student, k = c(13, 4, 3, 3, 5, 6, 5, 8, 6, 6), xvals = 10, xval.ceil = -1,
          knots = 10, prior.ind = 4, prior, permute = 10, permute.tail = 1,
          improvement = .01, ridge = .003, once.out.alway6s.out = FALSE,
          classcol = 1, verbose = 0)
  
  for(i in 1:100){
    for(j in 1:12){
      if(train[i,j] == student[1,j]){
        simScore[i,1] <- simScore[i,1] + 1
      }
    }
  }
  
  weightData <- data[1:100,12:20] * t(simScore)
  
  itemScore <- colSums(weightData)
  
  
  
  
}