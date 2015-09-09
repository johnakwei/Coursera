library(stylo)
library(tm)
library(stringr)
library(stringi)
library(data.table)
load("NgramTable.RData")
# load("TrigramTable.RData")

#Eliminate Profanity
# profane <- read.csv("http://www.frontgatemedia.com/new/wp-content/uploads/2014/03/Terms-to-Block.csv", skip = 3)
# profane <- as.vector(profane[,2])
# profane <- gsub(",", "", profane)

# clean inputted text
InputTokens <- function(text){
  cleanText <- removePunctuation(text)
  cleanText <- removeNumbers(cleanText)
  cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
  cleanText <- stripWhitespace(cleanText)
  cleanText <- tolower(cleanText)
#   cleanText <- removeWords(cleanText, profane)
  return(cleanText)}

# separate text input into individual words
TextInput <- function(text){
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
  prediction <- as.character(NxtWrd[NxtWrd$n1==InputWords[1] &
                      NxtWrd$n2==InputWords[2] &
                      NxtWrd$n3==InputWords[3],][1:4,]$Pred)
  
  # 2 words inputted - find the prediction
  if(is.na(prediction)){
    prediction <- as.character(NxtWrd[NxtWrd$n2==InputWords[2] &
                        NxtWrd$n3==InputWords[3],][1:4,]$Pred)
  
  # 1 word inputted - find the prediction  
  if(is.na(prediction)){
    prediction <- as.character(NxtWrd[NxtWrd$n3==InputWords[3],][1:4,]$Pred)}}
  
  #return prediction unigram
  print(prediction)}