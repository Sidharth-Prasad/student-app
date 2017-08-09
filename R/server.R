library(plumber)
setwd("C:/Users/SidhPras/git/student-app/R")

r <- plumb("StudentRecommend.R")  # Where 'myfile.R' is the location of the file shown above
r$run(port=8000)  

library(plumber)
setwd("C:/Users/SidhPras/git/student-app/R")

r <- plumb("jsontester.R")  # Where 'myfile.R' is the location of the file shown above
r$run(port=8000)  