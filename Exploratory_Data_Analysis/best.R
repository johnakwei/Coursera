best <- function(state, outcome)
{
  x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia"))
    stop("invalid outcome")
  
  if(! state %in% x$State)
    stop("invalid state")
  
  column <- if( outcome == "heart attack") { 11 }
  else if( outcome == "heart failure") { 17 }
  else { 23 }
  
  y <- x[x$State == state,]
  z <- y[, column] != "Not Available"
  min <- min(as.numeric(y[z, column]))
  
  y2 <- y[z,]
  z2 <- which(as.numeric(y2[, column]) == min)
  data <- y2[z2,"Hospital.Name"]
  
  sort(data)[1]
}

best("TX", "heart attack")
##[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure")
##[1] "FORT DUNCAN MEDICAL CENTER"