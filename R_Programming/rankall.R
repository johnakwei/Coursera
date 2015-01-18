rankall <- function(outcome, num = "best") 
{
  x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  if(! outcome %in% c("heart attack", "heart failure", "pneumonia"))
    stop("invalid outcome")
  
  column <- if( outcome == "heart attack") { 11 }
  else if( outcome == "heart failure") { 17 }
  else { 23 }
  
  hospital <- character(0)
  state <- character(0)
  
  for( s in unique(x$State))
  { y <- x[x$State == s,]
    if( is.numeric(num) && nrow(y) < num)
    { hospital <- c(hospital, NA)
      state <- c(state, s)
      next }
    
    z <- y[, column] != "Not Available"
    rate <- as.numeric(y[z, column])
    hospitals <- y[z,"Hospital.Name"]
    
    y2 <- order(rate, hospitals)
    hospitals <- hospitals[y2]
    rate <- rate[y2]
    
    h <- if( is.numeric(num) ) hospitals[num]
    else if (num == "best") hospitals[1]
    else hospitals[length(hospitals)]
    
    hospital <- c(hospital, h)
    state <- c(state, s) }
  
  z2 <- order(state, hospital)
  hospital <- hospital[z2]
  state <- state[z2]
  data.frame(hospital = hospital, state = state)
}