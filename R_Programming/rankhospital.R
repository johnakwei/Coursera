rankhospital <- function(state, outcome, num)
{
  x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  if(! outcome %in% c("heart attack", "heart failure", "pneumonia"))
    stop("invalid outcome")
  
  if(! state %in% x$State)
    stop("invalid state")
  
  column <- if( outcome == "heart attack") { 11 }
  else if( outcome == "heart failure") { 17 }
  else { 23 }
  
  y <- x[x$State == state,]
  if( is.numeric(num) && nrow(y) < num)
    return(NA)
  
  z <- y[, column] != "Not Available"
  rate <- as.numeric(y[z, column])
  hospitals <- y[z,"Hospital.Name"]
  
  y2 <- order(rate,hospitals)
  hospitals <- hospitals[y2]
  rate <- rate[y2]
  
  if( is.numeric(num) ) hospitals[num]
  else if (num == "best") hospitals[1]
  else hospitals[length(hospitals)]
}