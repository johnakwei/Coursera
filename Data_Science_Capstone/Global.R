library(stylo)
library(tm)
library(stringr)
library(stringi)
load("tb4_2.RData")

# Creation of tb4_2.RData Code
# c1 <- file("Coursera-SwiftKey/final/en_US/en_US.twitter.txt","r")
# f1 <- readLines(c1, 3000)
# close(c1)
# c2 <- file("Coursera-SwiftKey/final/en_US/en_US.blogs.txt","r")
# f2 <- readLines(c2, 1000)
# close(c2)
# c3 <- file("Coursera-SwiftKey/final/en_US/en_US.news.txt","r")
# f3 <- readLines(c3, 1000)
# close(c3)
# table1 <- c(f1, f2, f3)
# save(table1, file="table1.RData")

clean_data<-function(text){
  cleanText <- removePunctuation(text)
  cleanText <- removeNumbers(cleanText)
  cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
  cleanText <- stripWhitespace(cleanText)
  cleanText <- tolower(cleanText)
  return(cleanText)}

clean_ipt <- function(text){
  ipt <- clean_data(text)
  ipt <- txt.to.words.ext(ipt, language="English.all", preserve.case=T)
  return(ipt)}

TextPrediction <- function(n,ipt){
  if (n>=3){ipt <- ipt[(n-2):n]}
  else if(n==2){ipt <- c(NA, ipt)}
  else {ipt <- c(NA, NA, ipt)}
  
  pt <- as.character(tb4[tb4$n1==ipt[1] & tb4$n2==ipt[2] & tb4$n3==ipt[3],][1,]$pred)
  
  if(is.na(pt)){
    pt <- as.character(tb4[tb4$n2==ipt[2] & tb4$n3==ipt[3],][1,]$pred)
    if(is.na(pt)){pt <- as.character(tb4[tb4$n3==ipt[3],][1,]$pred)}}
  print(pt)}
