pollutantmean <- function(directory, pollutant, id = 1:332) {
x = numeric()
for (i in id) { dataset = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
x = c(x, dataset[[pollutant]]) } mean(na.omit(x)) }