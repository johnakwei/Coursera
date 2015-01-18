complete <- function(directory, id = 1:332) {
  finalfilepath <- function(directory, id_num){
    if(id_num < 10){
      filepath <- paste(directory, "/00", id_num, '.csv', sep="")
    } else if (i < 100){
      filepath <- paste(directory, "/0", id_num, '.csv', sep="")
    } else {
      filepath <- paste(directory, "/", id_num, '.csv', sep="")
    }
    filepath
  }
  idregister = numeric()
  rowstotal = numeric()
  for(i in id) {
    filepath <- finalfilepath(directory, i)
    data <- read.csv(filepath)
    finaldata <- complete.cases(data[,2], data[,3])
    idregister = c(idregister, i)
    rowstotal = c(rowstotal, sum(finaldata))
  }
  complete <- data.frame(id = idregister, nobs = rowstotal)
  complete
}