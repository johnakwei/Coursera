source("complete.R")

corr <- function(directory, threshold = 0) {
  data <- complete(directory)
  subbed <- data[data$nobs > threshold,]
  result <- c()
  for(i in subbed$id){
    id_char <- sprintf("%03d.csv", as.numeric(i))
    x <- read.csv(paste(directory,"/", id_char,sep=""))
    finaldata <- na.omit(x)
    result <- append(result, cor(finaldata$sulfate, finaldata$nitrate))
  }  
  result
}