Upload Milestone Report, App, Presentation
Finalize Milestone Report
Evaluation
Finish Ngram Table script
Finalize Presentation
Finalize App
Evaluation

# Ngram Table Creation Code
library(stylo)
library(tm)
library(stringr)
library(stringi)
library(data.table)
library(RWeka)

blogs <- readLines("Coursera-SwiftKey/final/en_US/en_US.blogs.txt", encoding="UTF-8", 500)
news <- readLines("Coursera-SwiftKey/final/en_US/en_US.news.txt", encoding="UTF-8", 500)
twitter <- readLines("Coursera-SwiftKey/final/en_US/en_US.twitter.txt", encoding="UTF-8", 500)
corpus <- c(blogs, news, twitter)
rm(blogs, news, twitter)
corpusWords <- txt.to.words.ext(tokenCorpus, language="English", preserve.case=T)
Unigram <- NGramTokenizer(corpus, Weka_control(min=1, max=1, delimiters=" \\r\\n\\t.,;:\"()?!"))

# functions to create trigram tables
unigramTable <- data.table(Unigram)
trigramPred <- as.data.table(c(unigramTable[1:44409], unigramTable[2:44410], unigramTable[3:44411], unigramTable[4:44412]))
names(trigramPred) <- c("n1", "n2", "n3", "Pred")

# also
NgramTab <- as.data.table(c(unigramTable[1:100], unigramTable[2:101], unigramTable[3:102], unigramTable[4:103]))
names(NgramTab) <- c("n1", "n2", "n3", "Pred")
NgramData <- data.frame(table(NgramTab))

# sorting the word distribution frequency  
TrigramDist <- NgramData[order(NgramData$Freq, decreasing=T),]

# save for later use
save(NgramData, file="NgramData.RData")

# other code
sum(grepl("love", corpus))
sentence <- grep("hate", corpus)
corpus[sentence]
tdm <- TermDocumentMatrix(Unigram)
m <- as.matrix(Unigram)
v <- sort(rowSums(m), decreasing=T)
d <- data.frame(word=names(v), freq=v)
