library(stylo)
library(tm)
library(stringr)
library(stringi)
library(data.table)
# load("NgramTable.RData")
load("TrigramTable.RData")
# Change trigramPred to trigramPred

 
# Profanity Filtering
# conprofane <- file("./profanity.txt", "r")
# profanity_vector <- VectorSource(readLines(conprofane))
# corpus <- tm_map(corpus, removeWords, profanity_vector)

InputTokens <- function(text){
  # clean inputted text
  cleanText <- removePunctuation(text)
  cleanText <- removeNumbers(cleanText)
  cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
  cleanText <- stripWhitespace(cleanText)
  cleanText <- tolower(cleanText)
  return(cleanText)}

TextInput <- function(text){
  # separate text input into individual words
  InputWords <- InputTokens(text)
  InputWords <- txt.to.words.ext(InputWords, language="English",
                                 preserve.case=T)
  return(InputWords)}

NextWordPrediction <- function(n, InputWords){
  # search ngram data table starting with the 3rd column of unigrams
  if (n>=3){InputWords <- InputWords[(n-2):n]}
  else if(n==2){InputWords <- c(NA, InputWords)}
  else {InputWords <- c(NA, NA, InputWords)}
  
  # 3 words inputted - find the prediction
  pt <- as.character(trigramPred[trigramPred$n1==InputWords[1] &
                      trigramPred$n2==InputWords[2] &
                      trigramPred$n3==InputWords[3],][1,]$Pred)
  
  # 2 words inputted - find the prediction
  if(is.na(pt)){
    pt <- as.character(trigramPred[trigramPred$n2==InputWords[2] &
                        trigramPred$n3==InputWords[3],][1,]$Pred)
  
  # 1 word inputted - find the prediction  
  if(is.na(pt)){
    pt <- as.character(trigramPred[trigramPred$n3==InputWords[3],][1,]$Pred)}}
  
  #return prediction unigram
  print(pt)}
