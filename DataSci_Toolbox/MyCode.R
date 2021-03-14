##################################################
##################################################
##
## The MyCode.R file is used to store code
## that is useful for future programming.
##
## John Akwei, ECMp ERMp Data Scientist
## ContextBase, contextbase.github.io
## johnakwei1@gmail.com
##
##################################################
##################################################

##################################################
##################################################
##
## 1) Terms and Conditions
##
##################################################
##################################################

# 1) The Vendor, (John Akwei, ECMp ERMp Data Scientist, ContextBase), has
# established a record of successful R programming projects via the Internet
# that have met, or exceeded, the expectations of the Clients. Verification of
# this is found at www.fiverr.com/johnakwei.

# 2) The Client, (or "Buyer"), agrees that lack of knowledge, (by the Client), of
# the R programming language is not grounds for cancellation, or non-payment, of
# the R language deliverable by the Vendor, (or "Seller").

# 3) The Client agrees that lack of knowledge of RStudio is not grounds for
# cancellation, or non-payment, of the R language deliverable by the Vendor.

# 4) The Vendor provides help with the R programming language, and with RStudio,
# upon delivery of the Client's ordered R language software.

# 5) Sofware deliverables, (by the Vendor), are assured to operate without errors,
# and proof of error-free operation of Vendor-provided software is also a free
# inclusion with delivery of the internet project.

# 6) The Client agrees that certain Data Science projects, (i.e. Natural Language
# Processing, Webscraping, Predictive Analytics), are continuously refinable and
# the capabilities of the delivered software is dependent on the time/budget
# scope of the project. Therefore, the Client agrees to reasonable software
# capabilities in keeping with the time/budget scope of the project.

# 7) The Client's agreement to the above Terms and Conditions is made by
# acceptance of the Custom Offer from the Vendor.

############################################
############################################
##
## 2) Session Information
##
############################################
############################################

sessionInfo()
citation <- citation()
citation$title

session <- sessionInfo()
SessionTable <- data.frame(matrix(nrow=5, ncol=1))
rownames(SessionTable) <- c("R Version", "Platform", "Running",
                            "RStudio Citation","RStudio Version")
colnames(SessionTable) <- "Session Information"
SessionTable[1,] <- session$R.version$version.string
SessionTable[2,] <- session$platform
SessionTable[3,] <- session$running
SessionTable[4,] <- "RStudio: Integrated Development Environment for R"
SessionTable[5,] <- "1.0.153"
kable(SessionTable)

############################################
############################################
##
## 3) Online Publishing
##
############################################
############################################

# ContextBase Logo
# <img src="ContextBase_Logo.jpg" alt="ContextBase Logo"  width="550" height="300">

#HTML code for markdown documents
# <br />
#
# <h1 align="center" style="color:blue;font-weight:bold;">Working Directory,
# and Required Packages</h1>

# Publish to RPubs
# install.packages("markdown")
# library(markdown)
# rpubsUpload(title, htmlFile, id=NULL, properties=list(),
# method=getOption("rpubs.upload.method", "internal"))

# Publish to Shinyapps.io
# setAccountInfo("user", "token", "secret")
# rsconnect::deployApp()("C:/Users/Administrator/Dropbox/Programming/NLP/CaseStudyAnalysis/Decision_Mining_App")

# https://johnakwei1.shinyapps.io/seci_app/

# Royalty-free images: pixabay, stocksnap, pexel and unsplash.
# http://stats.stackexchange.com/
# https://data.library.virginia.edu/diagnostic-plots/
# http://www.gardenersown.co.uk/education/lectures/r/correl.htm#correlation
# http://rpubs.com/etanabe/musical_taste_likelihood

############################################
############################################
##
## 4) Education
##
############################################
############################################

# References
# http://rpubs.com/m3cinc/Benchmarking_20_Machine_Learning_Models_Accuracy_and_Speed
# http://rpubs.com/aashishkpandey/Data-Collection-from-API
# http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html

# List of R data sets - data()

# Swirl R programming lesssons
# install.packages("swirl")
# library("swirl")
# swirl()

browseVignettes("data.table")

# When you are at the R prompt (>):
# Typing skip() allows you to skip the current question.
# Typing play() lets you experiment with R on your own;
# swirl will ignore what you do...
# UNTIL you type nxt() which will regain swirl's attention.
# Typing bye() causes swirl to exit. Your progress will be saved.
# Typing main() returns you to swirl's main menu.
# Typing info() displays these options again.

##################################################
##################################################
##
## 5) Set path to Working Directory
##
##################################################
##################################################

# Input path to working directory
wd <- "...Input path to working directory here..."
setwd(wd)

# Set "Working Directory" to the folder containing all script files:
setwd("C:/Users/...")

# Finds the current Working Directory:
getwd()

##################################################
##################################################
##
## 6) Load Required Packages
##
##################################################
##################################################

required <- function(wd) {
  setwd(wd)
  if (!require("data.table")) { install.packages("data.table"); require("data.table") }
  if (!require("datasets")) { install.packages("datasets"); require("datasets") }
  if (!require("plyr")) { install.packages("plyr"); require("plyr") }
  if (!require("ggplot2")) { install.packages("ggplot2"); require("ggplot2") }
}
required("C:/Users/johnakwei/Desktop/Coursera/ExploratoryDataAnalysis/CourseProject2")

# Required Packages/Libraries
if (!require("data.table")) {install.packages("data.table"); require("data.table")}
if (!require("lubridate")) {install.packages("lubridate"); require("lubridate")}
any(grepl("<name of your package>", installed.packages()))

# install.packages("readr")
library(readr)

# check if all the packages are installed, if not, install the missing packages
libs=c("readxl", "ggplot2", "gmnl", "mlogit", "dummies", "dplyr")
if(sum(!(libs %in% .packages(all.available=TRUE)))>0){
  install.packages(libs[!(libs %in% .packages(all.available=TRUE))])}

# load these packages
require(readxl)
require(ggplot2)
require(gmnl)
require(mlogit)
require(dummies)
require(dplyr)

PackageTable <- data.frame(matrix(nrow=1, ncol=1))
rownames(PackageTable) <- "Required Packages"
colnames(PackageTable) <- "List of Required Packages"
PackageTable[1,] <- paste("'twitteR'","'tm'", "'syuzhet'", "'httr'", "'plyr'",
                          "'dplyr'", "'data.table'", "'ggplot2'", "'stringr'",
                          "'ggplot2'", "'wordcloud'", "'knitr'")
kable(PackageTable)

##################################################
##################################################
##
## 7) Updating R
##
##################################################
##################################################

# updating R
if(!require("installr")) {install.packages("installr"); require("installr")}
library("installr")
updateR()
# this will start the updating process of your R installation.
# It will check for newer versions, and if one is available,
# will guide you through the decisions you'd need to make.
sessionInfo()

##################################################
##################################################
##
## 8) Basic R Scripting
##
##################################################
##################################################

# Basic R Scripting
x <- 4
x <- c(4, "a", TRUE)
x <- c(1, 3, 5)
y <- c(3, 2, 10)

rbind(x,y)

x <- list(2, "a", "b", TRUE)
x[[1]]
x <- 1:4; y <- 2:3
z <- x + y

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>=11] <- 4

m <- matrix(nrow=2, ncol=3)
m <- matrix(1:6, nrow=2, ncol=3)
m <- 1:10
dim(m) <- c(2,5)

x <- 1:3
y <- 10:12

bindColumns <- cbind(x, y)
bindRows <- rbind(x, y)

row.sums <- apply(bindColumns, 1, sum)
col.sums <- apply(bindColumns, 2, sum)

# rbind and cbind sums
rbind(cbind(bindColumns, Rtot = row.sums),
      Ctot = c(col.sums, sum(col.sums)))

x <- list(1, "a", TRUE, 1+4i)
x <- factor(c("yes","yes","no","yes","no"), levels=c("yes", "no"))
table(x)
unclass(x)

x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)

A <- matrix(1:16, 4, 4)

x <- 1:10
if(x > 5) { x <- 0 }

x <- 5
y <- if(x < 3) { NA } else { 10 }

# for loops
for(i in 1:10) { print(i) }
for(i in 1:nrow(x)) { print(i) }
for(i in seq_along(x)) { print(x[i]) }
for(letter in x) { print(letter) }
for(i in 1:4) print(x[i]); x <- matrix(1:6, 2,3)
for(i in seq_len(nrow(x))) { for(j in seq_len(ncol(x))) { print(x[i,j]) } }

count <- 0
while(count < 10) { print(count); count <- count+1 }
randomloop <- function(){ z <- 5; while(z >= 3 && z <= 10)
{ print(z)
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1) { z <- z+1 } else
  { z <- z-1 } } }
randomloop()

x = 1:10
x = seq(1,10)
y = seq(1,10)

add2 <- function(x, y) { x + y }
above10 <- function(x) { use <- x>10; x[use] }
above <- function(x, n = 10) { use <- x>n; x[use] }
columnmean <- function(y, RemoveNA=T) {
  nc <- ncol(y); means <- numeric(nc)
  for(i in 1:nc)
  { means[i] <- mean(y[, i], na.rm=RemoveNA) } means }

f <- seq(1, 10)

f <- function(x) { g <- function(y) { y + z } z <- 4; x+g(x) }
z <- 10
f(3)

s <- split(airquality, airquality$Month)

# Data Manipulation
install.packages("ISLR")
library(ISLR)
Auto[1:4,]
Auto <- na.omit(Auto)

Auto$cylinders <- as.factor(Auto$cylinders)
pairs(Auto)

pairs(~ mpg+displacement+horsepower+weight+acceleration, Auto)

myfunction <- function() { x <- rnorm(100); mean(x) }

library(datasets)
names(airquality)
plot(airquality$Ozone)
hist(airquality$Wind)

x <- c(0.5, 0.6)
x <- c(T, F)
x <- c("a", "b", "c")
x <= c(1+0i, 2+4i)
x <- vector("numeric", length=10)
x <- 10:20

x <- c(1+0i, 2+4i)
y <- c(TRUE, 2)
y <- c(0.5, 0.6)
y <- c(1.7, "a")
y <- C(TRUE, 2)

con <- url("http://www.johnakwei1.com", "r")
browseURL("http://www.google.com", browser=getOption("browser"),
          encodeIfNeeded=F)
con <- url("http://www.google.com", "r")
x <- readLines(con)
head(x)
body(x)
con <- gzfile("words.gz")
x <- readLines(con, 10)

body(Auto)
body(Auto$Ozone)
table(Auto$Ozone)

fix(na.omit(Auto))

table(na.omit(Auto$Ozone))
mean(na.omit(Auto$Ozone))
x <- na.omit(Auto$Ozone)

mean(x)
x <- is.numeric(Auto$Ozone)
x <- Auto$Ozone
bad <- is.na(x)
x[!bad]

Auto[1]
good <- complete.cases(Auto)
Auto[good, ][1:6, ]

TrainingSet <- read.txt("training.txt")
TestSet <- read.txt("text.txt")

# Append
mydata <- rbind(mydata7, mydata8)
edit(mydata)

# Rewrite Names
head(myList)
mylist[1]
mylist$letters
mylist[[1]]
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)
sub("_", "", names(training))
testName <- "this_is_a_test"
gsub("_", "", testName)

lm(airquality)
lapply(x, mean)

complete <- function(directory, id=332) {
  specdata_comp <- list.files(directory, full.names=T)
  dat <-data.frame()
  for (i in id) { dat <- read.csv(specdata_comp[i], header=T)
  nobs <- c(sum(complete.cases(dat))) } complete("specdata", 5)
}

x <- c(lapply(phonememory[4], mean), lapply(airquality[4], mean))
apply(airquality, 2, mean)
lapply(airquality[4], mean)

##################################################
##################################################
##
## 9) Import Data into R
##
##################################################
##################################################

# Append date to output file names:
IncludeDateTime <- function(str, sep='_', date.format="%Y_%m_%d_%H_%M") {
  stopifnot(is.character(str))
  return(paste(str, format(Sys.time(), date.format), sep=sep))}

## Download and Extract Data
if (!file.exists("./data")){dir.create("./data")}
dataLocation1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
dataLocation2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(dataLocation1, destfile="./data/reviews.csv")
download.file(dataLocation2, destfile="./data/solutions.csv")

unextracted <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
extracted  <- "exdata-data-household_power_consumption"
dataLocation <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists(unextracted)) { download.file(dataLocation, unextracted) }
if (!file.exists(extracted)) { unzip(unextracted) }

dataLocation <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
q4q1 <- function(){
  if(!file.exists("./data/housingsurvey.csv")) { download.file(dataLocation, destfile="./data/housingsurvey.csv") }
  df <-read.table("./data/housingsurvey.csv", sep=",", header=T)
  hd <- names(df); lis <- lapply(hd, strsplit, "wgtp")
  return(lis[[123]]) }
q4q1()

## Set Data Variables
filepath <- "C:/Users/johnakwei/Dropbox/Programming/CorrelationAnalysis/IoT dataset/Map/"
df.traffic <- read.csv(paste0(filepath, 'trafficMetaData.csv'))

reviews <- read.csv("./data/reviews.csv")

x <- read.csv("Data1.csv", sep = ";")

ScanData <- read.table("household_power_consumption.txt",
                       header=T, sep=";", na.strings="?")

Final_Dataset <- read_excel("Final_Dataset.xlsx")

load("intermediate.rdata")

##################################################
##################################################
##
## 10) Exploratory Data Analysis
##
##################################################
##################################################

# Examine data
ls()
class()
dir()
object.size()
dim()
attributes()
nrow()
ncol()
head()
tail()
names()
summary()
str()
fix()
View()
table()

library(knitr)
# kable(USPersonalExpenditure)
# hist(flags$sunstars)

# Data exploration with dplyr
subset <- select(chicago, city:dptp)
select(chicago, -(city:dptp))
chic.f <- filter(chicago, pm25tmean2 > 30)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
select(chic.f, date, tmpd, pm25tmean2)
chicago <- arrange(chicago, date)

zeroMg <- subset(absorbance1, absorbance1[,1]==0)
zeroMg <- filter(absorbance1,
                 absorbance1$Powder_mg_vs_Absorbance_E_coli==0)
sample1 <- aggregate(absorbance1$Powder_mg_vs_Absorbance_E_coli~
                       absorbance1$Sample_1, FUN=sum)

# Subsetting Dataframes
sw <- swiss[1:5, 1:4] # select a manageable subset of rows and columns
sw[4:5, 1:3]          # select rows and columns
sw[1:3]               # select columns
sw[,1:3]              # select columns
sw[1:3,]              # select rows
sw[1]                 # a one-column data frame
sw[, 1, drop=F]       # the same
x[1,]                 # select the first row
x[,1]                 # select the first column
sw[, 1]               # a (unnamed) vector
sw[[1]]               # the same
x[c(1, 3, 4)]         # select specific columns
x[x > "a"]            # subset with a logical vector
sw[1,, drop=T]        # a list
sw["C", ]             # partially matches
sw[match("C", row.names(sw)), ] # no exact match
try(sw[, "Ferti"])    # column names must match exactly
DT[order(x,v)]        # sort data.table ascending by x then by v

FinalData <- ScanData[ScanData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <- strptime(paste(FinalData$Date, FinalData$Time,
                          sep=" "),"%d/%m/%Y %H:%M:%S")
FinalData <- cbind(SetTime, FinalData)

# Convert to date field
data1$date <- as.character(data1$date)
data1$date <- as.Date(data1$date, format="%m/%d/%y")

# Generate Data
y <- rnorm(100)
x <- seq(-pi, pi, length=50)
z <- rnorm(100, 2, 4)
summary(z)
f <- gl(40, 10)

# generate data for medical example
clinical.trial <-
  data.frame(patient = 1:100, age = rnorm(100, mean = 60, sd = 6),
             treatment = gl(2, 50, labels = c("Treatment", "Control")),
             center = sample(paste("Center", LETTERS[1:5]),
                             100, replace=T))

############################################
############################################
##
## 11) Tables
##
############################################
############################################

# Get Median value
tapply(flags$sunstars, flags$circles, mean)

# gather the columns that are not variables
tb2 <- tb %>% gather(demographic, n, m04:fu, na.rm=T)

# Then separate the variables into sex and age
tb3 <- tb2 %>% separate(demographic, c("sex", "age"), 1)

# rename variables
tb4 <- tb3 %>%  rename(country = iso2) %>% arrange(country,
                                                   year, sex, age)

data(mpg, package="ggplot2")
mpg %>%
  ggvis(~displ, ~hwy) %>%
  layer_points() %>%
  layer_smooths(span=input_slider(0.2, 1))

table()
margin.table()
prop.table()
summary()
ftable()
print.table()
read.table()
write.table()

vec = c(3,5,7,9,11,3,6,2,1,9,0,5,4)
table(vec)
sort(vec)

library(dplyr)
toy_data <- data.frame(c1 = sample(letters[1:5], 25, replace = TRUE), 
                      c2 = sample(LETTERS[1:5], 25, replace = TRUE))
print.data.frame(toy_data)
table0 <- table(toy_data$c1, toy_data$c2)
print.table(table0)
table1 <- as.data.frame.matrix(table0) # convert it to dataframe
print.data.frame(table1)
table2 <- prop.table(table0, margin = 1) %>% 
  as.data.frame.matrix() # convert it to dataframe   

# have a look at the table
print.data.frame(table2, digits = 2)

table3 <- prop.table(table0, margin = 2) %>% 
  as.data.frame.matrix() # convert it to dataframe   

# have a look at the table
print.data.frame(table3, digits = 2)

table(table1$A)

table(table1[,1])

t(table1)

bird <- matrix( c(47, 10, 40, 2, 5, 2, 19, 3, 5, 0, 2, 50,
                 0, 10, 7, 0, 46, 8, 4, 0, 9, 4, 0, 0, 2,
                 4 ,0, 6, 0,0), nrow=6, ncol=5,byrow = TRUE)                      # fill matrix by rows 
dimnames(bird) <- list( c("Blackbird", "Chaffinch", "Great Tit",
                         "House Sparrow", "Robin", "Song Thrush"),         # row names 
                       c("Garden", "Hedgerow", "Parkland", 
                         "Pasture", "Woodland"))
# Column names
table(bird)

table(as.matrix(bird)[1,], as.matrix(bird)[2,], 
      dnn = c("Garden", "Hedgerow"))

bird.mat <- as.matrix(bird)
table(bird.mat[1,], bird.mat[4,], dnn = c("Garden", "Hedgerow"))

# Below some commands are listed for selecting parts of a table object:
  
str(pw.tab) # Examines the structure of the table object named tab.
pw.tab[1:3,] # Displays the first three rows of the contingency table.
pw.tab[1:3,1] # Displays the first three rows of the first column.
pw.tab[1:3,1:2] # Displays the first three rows of the first and second columns.
pw.tab[,'hi'] # Displays the column labeled hi.
pw.tab[1:3, c('hi', 'mid')] # Displays the first three rows of two of the columns.
pw.tab[1:3, c('mid', 'hi')] # Displays some of the columns in a new order.
pw.tab[,c('hi',3)] # Displays two columns using a mix of name and number.
length(pw.tab) # Displays the length of the table object.

as.table(as.matrix(bird))
is.table(bird)
is.table(table0)
ftable(toy_data)
if(class(table1) == 'ftable') TRUE else FALSE

table1.t <- xtabs(A ~ B + C, data = table1)
table1.t

class(table1.t)

if(class(table1.t) == 'xtabs') TRUE else FALSE

as.data.frame(table1.t)

as.data.frame(table1.t, responseName = 'B')

class(bird)
attributes(bird)$class <- "table"
bird
class(bird)

bird.df = as.data.frame(bird)

bird.tt = bird
class(bird.tt) = 'table'  #DataFlair  
bird.tt = as.data.frame(bird.tt)
names(bird.tt) = c('Species', 'Habitat', 'Qty')
bird.tt = bird.tt[which(bird.tt$Qty > 0),]
rownames(bird.tt) = as.numeric(1:length(rownames(bird.tt))) #dataflair
bird.tt

############################################
############################################
##
## 12) Functions
##
############################################
############################################

############################################
############################################
##
## 13) Classes
##
############################################
############################################

############################################
############################################
##
## 14) Array Creation
##
############################################
############################################

############################################
############################################
##
## 15) Statistics
##
############################################
############################################

############################################
############################################
##
## 16) Linear Regression
##
############################################
############################################

setwd("C:/Users/johna/Dropbox/Programming/CorrelationAnalysis/LinearRegression")
library(ggplot2)
input_data <- read.table("height.csv", sep=",", header=TRUE)
# attach(input_data)
ggplot(input_data, aes(x,y)) +
  geom_point() +
  geom_smooth(method="lm")
lm <- lm(y~x, input_data)
predicted_heights <- predict(lm, data.frame(input_data$x),
                             interval="predict")
predicted_heights[0:6]
y[0:6]
summary(lm)$r.squared
detach(input_data)

# Linear Regression, Regression Modelling, & Machine Learning
model <- lm(as.numeric(Data1$Gender)~as.numeric(Data1$Status))
print(model)

test <- data.frame(Data1$Gender=="Male")
result <- predict(model,test)
print(result)

############################################
############################################
##
## 17) Logistic Regression
##
############################################
############################################

##################################################
##################################################
##
## 18) Polynomial Regression
##
##################################################
##################################################

p <- 0.5
q <- seq(0,100,1)
y <- p*q
plot(q,y,type='l',col='red',main='Linear relationship')

y <- 450 + p*(q-10)^3
plot(q,y,type='l',col='navy',main='Nonlinear relationship',lwd=3)

set.seed(20)

# Predictor (q). Use seq for generating equally spaced sequences fast
q <- seq(from=0, to=20, by=0.1)

# Value to predict (y):
y <- 500 + 0.4 * (q-10)^3

# Some noise is generated and added to the real signal (y):
noise <- rnorm(length(q), mean=10, sd=80)
noisy.y <- y + noise

# Plot of the noisy signal:
plot(q,noisy.y,col='deepskyblue4',xlab='q',main='Observed data')
lines(q,y,col='firebrick1',lwd=3)

# Our model should be something like this: y = a*q + b*q2 + c*q3 + cost
# Let's fit it using R. When fitting polynomials you can either use

model <- lm(noisy.y ~ poly(q,3))
# or
model <- lm(noisy.y ~ x + I(X^2) + I(X^3))

summary(model)
confint(model, level=0.95)

plot(fitted(model),residuals(model))

# Predicted values and confidence intervals:
predicted.intervals <- predict(model,data.frame(x=q),interval='confidence',
                               level=0.99)

# Add lines to the existing plot:
plot(q,noisy.y,col='deepskyblue4',xlab='q',main='Observed data')
lines(q,y,col='firebrick1',lwd=3)
lines(q,predicted.intervals[,1],col='green',lwd=3)
lines(q,predicted.intervals[,2],col='black',lwd=1)
lines(q,predicted.intervals[,3],col='black',lwd=1)
# Add a legend:
legend("bottomright",c("Observ.","Signal","Predicted"), 
       col=c("deepskyblue4","red","green"), lwd=3)

##################################################
##################################################
##
## 19) Correlation Between Variables
##
##################################################
##################################################

# Load the data set
mydata <- read.csv("data.csv", header = TRUE)

# Data Processing and Cleaning
names(mydata)
str(mydata)
head(mydata,5)
tail(mydata,5)
library(tidyverse)
glimpse(mydata)
summary(mydata)

# Count the missing values
mydata %>%
  summarise(count = sum(is.na(thc_emissions)))

mydata %>%
  summarise(count = sum(is.na(nox_emissions)))
mydata %>%
  summarise(count = sum(is.na(thc_nox_emissions)))
mydata %>%
  summarise(count = sum(is.na(fuel_cost_12000_miles)))
mydata %>%
  summarise(count = sum(is.na(standard_12_months)))
mydata %>%
  summarise(count = sum(is.na(first_year_12_months)))
mydata %>%
  summarise(count = sum(is.na(first_year_6_months)))
mydata %>%
  summarise(count = sum(is.na(standard_6_months)))
mydata %>%
  summarise(count = sum(is.na(date_of_change)))

# Removing Variables which contains missing values
mydata1 <- mydata[ -c(18,20:23,25:29) ]
mydata1 <- na.omit(mydata1)
names(mydata1)
str(mydata1)
mydata1$euro_standard <- as.numeric(mydata1$euro_standard)
mydata1$transmission <- as.factor(mydata1$transmission)
mydata1$transmission_type <- as.factor(mydata1$transmission_type)
mydata1$fuel_type <- as.factor(mydata1$fuel_type)
mydata1$co2 <- as.numeric(mydata1$co2)
mydata1$fuel_cost_6000_miles <- as.numeric(mydata1$fuel_cost_6000_miles)
mydata1$engine_capacity <- as.numeric(mydata1$engine_capacity)
str(mydata1)
head(mydata1,5)
tail(mydata1,5)
summary(mydata1)
duplicated(mydata1)
unique(mydata1)

mydata1 <- mydata1 %>% distinct(co2, .keep_all = TRUE)

# Histogram for Distribution of data
hist(mydata1$year)
hist(mydata1$euro_standard)
hist(mydata$engine_capacity)
hist(mydata1$combined_metric)
hist(mydata1$noise_level)
hist(mydata1$co2)
hist(mydata1$co_emissions)
hist(mydata1$fuel_cost_6000_miles)

# Plot
plot(mydata1$co2~mydata1$year, main="Relationship between CO2 and Year",xlab="Year", ylab="CO2")
plot(mydata1$co2~mydata1$euro_standard, main="Relationship between CO2 and Euro standard",xlab="Euro standard", ylab="CO2")
plot(mydata1$co2~mydata1$transmission, main="Relationship between CO2 and Transmission",xlab="Transmission ", ylab="CO2")
plot(mydata1$co2~mydata1$transmission_type, main="Relationship between CO2 and Transmission Type",xlab="Transmission Type ", ylab="CO2")
plot(mydata1$co2~mydata1$engine_capacity, main="Relationship between CO2 and Engine Capacity",xlab="Engine Capacity", ylab="CO2")
plot(mydata1$co2~mydata1$fuel_type, main="Relationship between CO2 and Fuel Type",xlab="Fuel Type", ylab="CO2")
plot(mydata1$co2~mydata1$noise_level, main="Relationship between CO2 and Noise Level",xlab="Noise Level", ylab="CO2")
plot(mydata1$co2~mydata1$fuel_cost_6000_miles, main="Relationship between CO2 and Fuel Cost per 6000 Miles",xlab="Fuel Cost per 6000 Miles", ylab="CO2")

# Find the association between the observed variables
cor(mydata1[,unlist(lapply(mydata1, is.numeric))])

# Regression to analyze the effect of all other varaibles on Co2
mydata2 <- (mydata1[,unlist(lapply(mydata1, is.numeric))])

# For regreesion model we used all variables
M1  <- lm(co2 ~ .,  data = mydata2)
summary(M1)

# Significant varaibles
M2 <- lm(co2 ~ year+engine_capacity+extra_urban_metric+co_emissions+fuel_cost_6000_miles , data = mydata2)
summary(M2)
anova(M2)

# Ploting of our model
layout(matrix(c(1,2,3,4),2,2))
plot(M2)

# Comaprison of our both models
anova(M1, M2)

############################################
############################################
##
## 20) Naive Bayes
##
## https://www.r-bloggers.com/2018/01/understanding-naive-bayes-classifier-using-r/
##
############################################
############################################

# Loading the library
library(e1071)

?naiveBayes #The documentation also contains
# an example implementation of Titanic dataset

# Next load the Titanic dataset
data("Titanic")

# Save into a data frame and view it
Titanic_df <- as.data.frame(Titanic)

#Creating data from table
repeating_sequence <- rep.int(seq_len(nrow(Titanic_df)), Titanic_df$Freq)
# This will repeat each combination equal to the frequency of
# each combination

# Create the dataset by row repetition created
Titanic_dataset <- Titanic_df[repeating_sequence,]

# We no longer need the frequency, drop the feature
Titanic_dataset$Freq <- NULL

# Fitting the Naive Bayes model
Naive_Bayes_Model <- naiveBayes(Survived ~., data=Titanic_dataset)

# What does the model say? Print the model summary
Naive_Bayes_Model

# Prediction on the dataset
NB_Predictions <- predict(Naive_Bayes_Model,Titanic_dataset)

# Confusion matrix to check accuracy
table(NB_Predictions,Titanic_dataset$Survived)

# NB_Predictions   No  Yes
# No  1364  362
# Yes  126  349

# Getting started with Naive Bayes in mlr

# Loading the library
library(mlr)

# Create a classification task for learning on Titanic Dataset and specify the target feature
task <- makeClassifTask(data = Titanic_dataset, target = "Survived")

# Initialize the Naive Bayes classifier
selected_model <- makeLearner("classif.naiveBayes")

# Train the model
NB_mlr <- train(selected_model, task)

# Read the model learned  
NB_mlr$learner.model

# Predict on the dataset without passing the target feature
predictions_mlr <- as.data.frame(predict(NB_mlr,
                                         newdata = Titanic_dataset[,1:3]))

# Confusion matrix to check accuracy
table(predictions_mlr[,1],Titanic_dataset$Survived)

############################################
############################################
##
## 21) Decision Tree Classification
## https://www.facebook.com/1026788430809320/videos/360230405081773
##
############################################
############################################


############################################
############################################
##
## 23) Random Forest Classification
## https://www.facebook.com/1026788430809320/videos/907846826409491
##
############################################
############################################

############################################
############################################
##
## 56) Feature Selection
##
############################################
############################################

pairs(data_impute[1:100,1:10])

# Remove Redundant Features

# ensure the results are repeatable
set.seed(7)

# calculate correlation matrix
correlationMatrix <- cor(data_impute)

# summarize the correlation matrix
print(correlationMatrix)
plot(correlationMatrix)

# find attributes that are highly corrected (ideally >0.75)
highlyCorrelated <- findCorrelation(!is.na(correlationMatrix), cutoff=0.5)

# print indexes of highly correlated attributes
print(highlyCorrelated)

# Rank Features By Importance

# prepare training scheme
control <- trainControl(method="repeatedcv", number=10, repeats=3)

# train the model
model <- train(y~., data=na.omit(data),
               method="lvq", preProcess="scale", trControl=control)

# estimate variable importance
importance <- varImp(model, scale=FALSE)

# summarize importance
print(importance)

# plot importance
plot(importance)

# Automatically Select Features

# define the control using a random forest selection function
control <- rfeControl(functions=rfFuncs, method="cv", number=10)

# run the RFE algorithm
results <- rfe(data_impute, data_impute[,305],
               sizes=c(1:8), rfeControl=control)

# summarize the results
print(results)

# list the chosen features
predictors(results)

# plot the results
plot(results, type=c("g", "o"))

############################################
############################################
##
## 25) Feature Scaling, Feature Normalization
##
############################################
############################################

# https://medium.com/swlh/data-normalisation-with-r-6ef1d1947970
# setwd("C:/Users/johna/Dropbox/Programming/MachineLearning")

library(magrittr)
library(dplyr)
library(ggplot2)

salary <- read.csv("Salary.csv")
stanardise_salary <-  as.data.frame(scale(salary,
                                          center = TRUE,
                                          scale = TRUE))
head(stanardise_salary)

stanardise_salary %>% summarise(Min = min(YearsExperience,na.rm = TRUE),
                                Q1 = quantile(YearsExperience,probs = .25,na.rm = TRUE),
                                Median = median(YearsExperience,na.rm = TRUE),
                                Q3 = quantile(YearsExperience,probs = .75,na.rm = TRUE),
                                Max = max(YearsExperience,na.rm = TRUE),
                                Mean = mean(YearsExperience,na.rm = TRUE),
                                SD = sd(YearsExperience,na.rm = TRUE),
                                n = n(),
                                Missing = sum(is.na(YearsExperience)))

stanardise_salary %>% summarise(Min = min(Salary,na.rm = TRUE),
                                Q1 = quantile(Salary,probs = .25,na.rm = TRUE),
                                Median = median(Salary, na.rm = TRUE),
                                Q3 = quantile(Salary,probs = .75,na.rm = TRUE),
                                Max = max(Salary,na.rm = TRUE),
                                Mean = mean(Salary, na.rm = TRUE),
                                SD = sd(Salary, na.rm = TRUE),
                                n = n(),
                                Missing = sum(is.na(Salary)))

# Robust Scaler
robust_scalar<- function(x){
  (x- median(x)) /(quantile(x,probs = .75)-quantile(x,probs = .25))}

robust_scalar_salary <- as.data.frame(lapply(salary, robust_scalar))

head(robust_scalar_salary)

robust_scalar_salary %>% summarise(Min = min(YearsExperience,na.rm = TRUE),
                                   Q1 = quantile(YearsExperience,probs = .25,na.rm = TRUE),
                                   Median = median(YearsExperience, na.rm = TRUE),
                                   Q3 = quantile(YearsExperience,probs = .75,na.rm = TRUE),
                                   Max = max(YearsExperience,na.rm = TRUE),
                                   Mean = mean(YearsExperience, na.rm = TRUE),
                                   SD = sd(YearsExperience, na.rm = TRUE),
                                   n = n(),
                                   Missing = sum(is.na(YearsExperience)))

robust_scalar_salary %>% summarise(Min = min(Salary,na.rm = TRUE),
                                   Q1 = quantile(Salary,probs = .25,na.rm = TRUE),
                                   Median = median(Salary, na.rm = TRUE),
                                   Q3 = quantile(Salary,probs = .75,na.rm = TRUE),
                                   Max = max(Salary,na.rm = TRUE),
                                   Mean = mean(Salary, na.rm = TRUE),
                                   SD = sd(Salary, na.rm = TRUE),
                                   n = n(),
                                   Missing = sum(is.na(Salary)))

# MinMax Scaler
norm_minmax <- function(x){
  (x- min(x)) /(max(x)-min(x))
}
normalise_salary <- as.data.frame(lapply(salary, norm_minmax))
head(normalise_salary)


normalise_salary %>% summarise(Min = min(YearsExperience,na.rm = TRUE),
                               Q1 = quantile(YearsExperience,probs = .25,na.rm = TRUE),
                               Median = median(YearsExperience, na.rm = TRUE),
                               Q3 = quantile(YearsExperience,probs = .75,na.rm = TRUE),
                               Max = max(YearsExperience,na.rm = TRUE),
                               Mean = mean(YearsExperience, na.rm = TRUE),
                               SD = sd(YearsExperience, na.rm = TRUE),
                               n = n(),
                               Missing = sum(is.na(YearsExperience)))

normalise_salary %>% summarise(Min = min(Salary,na.rm = TRUE),
                               Q1 = quantile(Salary,probs = .25,na.rm = TRUE),
                               Median = median(Salary, na.rm = TRUE),
                               Q3 = quantile(Salary,probs = .75,na.rm = TRUE),
                               Max = max(Salary,na.rm = TRUE),
                               Mean = mean(Salary, na.rm = TRUE),
                               SD = sd(Salary, na.rm = TRUE),
                               n = n(),
                               Missing = sum(is.na(Salary)))
# Mean Normalisation
mean_norm_minmax <- function(x){
  (x- mean(x)) /(max(x)-min(x))
}

mean_normalise_salary <- as.data.frame(lapply(salary, mean_norm_minmax))

# First 6 rows of Mean Normalisation
head(mean_normalise_salary)

# Unit Length Normalization
unit_length <- function(x) {
  x / sqrt(sum(x^2))
}

unit_length_salary <- as.data.frame(lapply(salary, unit_length))
head(unit_length_salary)

# Plotting the original data
ggplot() + 
  geom_point(salary, aes(x=YearsExperience, y=Salary),
             color='darkgreen')

# Plotting all the normalized data
ggplot() + 
  geom_point(normalise_salary, mapping = aes(x=YearsExperience, y=Salary, color="Min-Max Normalisation"))+
  geom_point(stanardise_salary, aes(x=YearsExperience, y=Salary, color="Z-score Standardisation")) +
  geom_point(robust_scalar_salary, aes(x=YearsExperience, y=Salary, color="Robust Scalar"))+ 
  geom_point(mean_normalise_salary, aes(x=YearsExperience, y=Salary, color="Mean Normalisation")) + geom_point(unit_length_salary, mapping = aes(x=YearsExperience, y=Salary, color="Unit Length Normalisation")) + 
  scale_color_manual(name = "Different Scaling Techniques",
                     values = c( "Min-Max Normalisation" = "blue", "Z-score Standardisation" = "red", "Robust Scalar" = "darkgrey", "Mean Normalisation" = "orange", "Unit Length Normalisation" = "black"))

# Normalization vs Standardization
ggplot() +
  geom_point(normalise_salary, aes(x=YearsExperience,
             y=Salary, color="Min-Max Normalisation")) +
  geom_point(stanardise_salary, aes(x=YearsExperience,
                           y=Salary, color="Z-score Standardisation")) +
  xlim(-3,3) + ylim(-3,3) +
  scale_color_manual(name = "Standardisation vs Normalisation",
                     values = c( "Min-Max Normalisation" = "darkblue",
                                 "Z-score Standardisation" = "red"))

# The effect of Normalization vs Standardization on KNN
install.packages("caTools")
library(caTools)
library(caret)

set.seed(101) 
# splitting the original data 
sample <- sample.split(salary$Salary, SplitRatio = .75)
train_original <- subset(salary, sample == TRUE)
test_original  <- subset(salary, sample == FALSE)

# Original Data KNN
original_model <- train(Salary~YearsExperience, data = train_original,
                        method = "knn")

# Predicting the trained model on test data set
original_predictions <- original_model %>% predict(test_original)

# Calculating the root mean square error
RMSE(original_predictions, test_original$Salary)

# Normalised
# splitting the normalised data 
norm_sample <- sample.split(normalise_salary$Salary, SplitRatio = .75)
train_norm <- subset(normalise_salary, norm_sample == TRUE)
test_norm  <- subset(normalise_salary, norm_sample == FALSE)

# Normalised Data KNN
norm_model <- train(Salary~YearsExperience, data = train_norm,
                    method = "knn")

# Predicting the trained model on test data set
norm_predictions <- norm_model %>% predict(test_norm)

# Calculating the root mean square error
RMSE(norm_predictions, test_norm$Salary)

# Standardised
# splitting the Standardised data 
stan_sample <- sample.split(stanardise_salary$Salary, SplitRatio = .75)
train_stan <- subset(stanardise_salary, stan_sample == TRUE)
test_stan  <- subset(stanardise_salary, stan_sample == FALSE)

# Standardised Data KNN
standard_model <- train( Salary~YearsExperience, data = train_stan, method = "knn")

# Predicting the trained model on test data set
stan_predictions <- standard_model %>% predict(test_stan)

# Calculating the root mean square error
RMSE(stan_predictions, test_stan$Salary)

############################################
############################################
##
## 26) Machine Learning
## https://www.geeksforgeeks.org/cross-validation-in-r-programming/
##
############################################
############################################
# loading required packages
# package to perform data manipulation and visualization 
library(tidyverse) 

# package to compute cross - validation methods 
library(caret) 

# installing package to import desired dataset 
install.packages("datarium") 
library(datarium)

# loading the dataset
data("marketing",package="datarium")

# inspecting the dataset
head(marketing)

# R program to implement validation set approach

# setting seed to generate a reproducible random sampling 
set.seed(123)

# creating training data as 80% of the dataset 
random_sample <- createDataPartition(marketing$sales,p=0.8,list=F)

# generating training dataset from the random_sample 
training_dataset  <- marketing[random_sample, ] 

# generating testing dataset from rows which are not
# included in random_sample 
testing_dataset <- marketing[-random_sample, ] 

# Building the model 

# training the model by assigning sales column 
# as target variable and rest other columns as independent variables 
model <- lm(sales ~., data=training_dataset) 

# predicting the target variable 
predictions <- predict(model, testing_dataset) 

# computing model performance metrics
data.frame(R2=R2(predictions, testing_dataset$sales),
           RMSE=RMSE(predictions, testing_dataset$sales),
           MAE=MAE(predictions, testing_dataset$sales)) 

############################################
############################################
##
## 27) Neural Networks / Deep Learning
##
############################################
############################################

set.seed(500)
library(MASS)
data <- Boston

# Check columns for missing values 
apply(data,2,function(x) sum(is.na(x)))

maxs <- apply(data, 2, max) 
mins <- apply(data, 2, min)

scaled <- as.data.frame(scale(data, center=mins, scale=maxs - mins))

index <- sample(1:nrow(data),round(0.75*nrow(data)))

train_ <- scaled[index,]
test_ <- scaled[-index,]

library(neuralnet)
n <- names(train_)
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = " + ")))
nn <- neuralnet(f,data=train_,hidden=c(5,3),linear.output=T)

plot(nn)

pr.nn <- compute(nn,test_[,1:13])

pr.nn_ <- pr.nn$net.result*(max(data$medv)-min(data$medv))+min(data$medv)
test.r <- (test_$medv)*(max(data$medv)-min(data$medv))+min(data$medv)
head(pr.nn_)

MSE.nn <- sum((test.r - pr.nn_)^2)/nrow(test_)
MSE.nn

test <- data[-index,]

plot(test$medv, pr.nn_, col='red',main='Real vs Predicted NN',pch=18,cex=0.7)
abline(0,1,lwd=2)
legend('bottomright',legend='NN',pch=18,col='red', bty='n')

############################################
############################################
##
## 28) Random Forest Bagging in Machine Learning
##
############################################
############################################

############################################
############################################
##
## 29) Goodness-Of-Fit
## https://www.facebook.com/1026788430809320/videos/2636605556652321
##
############################################
############################################

############################################
############################################
##
## 31) Boosting
## https://www.datatechnotes.com/2018/03/classification-with-adaboost-model-in-r.html
##
############################################
############################################

library(adabag)
library(caret)

indexes <- createDataPartition(iris$Species, p=.90, list=F)
train <- iris[indexes, ]
test <- iris[-indexes, ]

model <- boosting(Species~., data=train, boos=TRUE, mfinal=50)

print(names(model))
print(model$trees[1])

pred <- predict(model, test)
print(pred$confusion)
print(pred$error)

result <- data.frame(test$Species, pred$prob, pred$class)
print(result)

##################################################
##################################################
##
## 32) Gradient Boosting
## https://www.storybench.org/tidytuesday-bike-rentals-part-2-modeling-with-gradient-boosting-machine/
##
##################################################
##################################################

# How to model with gradient boosting machine in R
# packages
install.packages("rsample")
install.packages("caret")        
install.packages("ggthemes")        
install.packages("wesanderson")        
install.packages("tidyverse")        
install.packages("gbm")        
install.packages("Metrics")        
install.packages("here")        
library(rsample)      
library(caret)        
library(ggthemes)
library(scales)
library(wesanderson)
library(tidyverse)
library(gbm)
library(Metrics)
library(here)

BikeData %>% glimpse()

BikeDataModel <- BikeData %>% dplyr::select(cnt, season_fct,
                                            yr_fct, month_fct,
                                            holiday_fct, weekday_fct,
                                            workingday_fct,
                                            weathersit_fct, temp,
                                            atemp, hum, windspeed)
BikeDataModel %>% dplyr::glimpse(78)

set.seed(123)
BikeSplit <- initial_split(BikeDataModel, prop=.7)
BikeTrain <- training(BikeSplit)
BikeTest  <- testing(BikeSplit)

# model
set.seed(123)
bike_fit_1 <- gbm::gbm(cnt ~., 
                       # the formula for the model (recall that the period means, "all 
                       # variables in the data set")
                       data = BikeTrain, 
                       # data set
                       verbose = TRUE, 
                       # Logical indicating whether or not to print
                       #  out progress and performance indicators
                       shrinkage = 0.01, 
                       # a shrinkage parameter applied to each tree in the expansion. 
                       # Also known as the learning rate or step-size reduction; 0.001 
                       # to 0.1 usually work, but a smaller learning rate typically 
                       # requires more trees.
                       interaction.depth = 3, 
                       # Integer specifying the maximum depth of each tree (i.e., the 
                       # highest level of variable interactions allowed). A value of 1 
                       # implies an additive model, a value of 2 implies a model with up
                       #  to 2-way interactions
                       n.minobsinnode = 5,
                       # Integer specifying the minimum number of observations in the 
                       # terminal nodes of the trees. Note that this is the actual number 
                       # of observations, not the total weight.
                       n.trees = 5000, 
                       # Integer specifying the total number of trees to fit. This is 
                       # equivalent to the number of iterations and the number of basis 
                       # functions in the additive expansion.
                       cv.folds = 10
                       # Number of cross-validation folds to perform. If cv.folds>1 then
                       # gbm, in addition to the usual fit, will perform a 
                       # cross-validation, calculate an estimate of generalization error
                       #  returned in cv.error
)

# model performance
perf_gbm1 <- gbm.perf(bike_fit_1, method = "cv")

bike_prediction_1 <- stats::predict(
  # the model from above
  object = bike_fit_1, 
  # the testing data
  newdata = BikeTest,
  # this is the number we calculated above
  n.trees = perf_gbm1)
rmse_fit1 <- Metrics::rmse(actual = BikeTest$cnt, 
                           predicted = bike_prediction_1)
print(rmse_fit1)

gbm::plot.gbm(bike_fit_1, i.var = 9)

gbm::plot.gbm(bike_fit_1, i.var = c(5, 11))

# summarize model
BikeEffects <- tibble::as_tibble(gbm::summary.gbm(bike_fit_1, 
                                                  plotit = FALSE))
BikeEffects %>% utils::head()

# plot effects
BikeEffects %>% 
  # arrange descending to get the top influencers
  dplyr::arrange(desc(rel.inf)) %>%
  # sort to top 10
  dplyr::top_n(10) %>%
  # plot these data using columns
  ggplot(aes(x = forcats::fct_reorder(.f = var, 
                                      .x = rel.inf), 
             y = rel.inf, fill = rel.inf)) +
  geom_col() +
  coord_flip() +
  scale_color_brewer(palette = "Dark2") +
  theme_fivethirtyeight() +
  theme(axis.title = element_text()) + 
  xlab('Features') +
  ylab('Relative Influence') +
  ggtitle("Top 10 Drivers of Bike Rentals")

# Predicted bike rentals
BikeTest$predicted <- base::as.integer(predict(bike_fit_1, 
                                               newdata=BikeTest, 
                                               n.trees=perf_gbm1))

# plot predicted v actual
ggplot(BikeTest) +
  geom_point(aes(y=predicted, x=cnt, 
                 color=predicted - cnt), alpha=0.7) +
  theme_fivethirtyeight() +
  # strip text
  theme(axis.title = element_text()) + 
  scale_x_continuous(labels = comma) +
  scale_y_continuous(labels = comma) +
  scale_color_continuous(name = "Predicted - Actual", 
                         labels = comma) +
  ylab('Predicted Bike Rentals') +
  xlab('Actual Bike Rentals') +
  ggtitle('Predicted vs Actual Bike Rentals')

##################################################
##################################################
##
## 34) Stacking
## https://www.facebook.com/1026788430809320/videos/2686715038308486
##
##################################################
##################################################

# ensemble learning, explain what is stacking and its
# connection to deep learning

# Multi-Level Stacking is Deep Learning.

############################################
############################################
##
## 35) Stock Price Prediction
##
############################################
############################################

library(ggplot2)
library(xts)
library(zoo)
library(tseries)
library(forecast)
library(quantmod)
library(PerformanceAnalytics)
library(caret)
library(rugarch)

# Import Original data
ticker_lookup <- getSymbols("HPQ", auto.assign=F,
                            from="1970-01-01", to="2017-01-01")

# write.csv(ticker_lookup, "ticker_lookup.csv")

ticker_lookup2 <- as.data.frame(cbind(ticker_lookup[,1], ticker_lookup[,2], ticker_lookup[,3], ticker_lookup[,4], ticker_lookup[,5], ticker_lookup[,6]))

TCKR <-  as.data.frame(cbind(date = rownames(ticker_lookup2), ticker_lookup2))
colnames(TCKR) <- c("date","open","high ","low ","close ","volume ","adjusted")
rownames(TCKR) <- NULL

rm(ticker_lookup, ticker_lookup2)

# Create Training and Test Data
TCKRTrain <- TCKR[1:567,]
TCKRTest <- TCKR[568:756,]

# Time Series Processing
TCKRTrainTS <- ts(TCKRTrain$close, start=c(2014, 1, 1),
                  end=c(2016, 4, 5), frequency=250)

TCKRTestTS <- ts(TCKRTest$close, start=c(2016, 4, 4),
                 end=c(2017, 1, 1), frequency=250)

# Forecasting Model #1 - Holt Winters Filtering
# Fit Exponential Smoothing
fit_ES <- HoltWinters(TCKRTrainTS)

# Forecast 20 Days
TCKRForecast <- forecast(fit_ES, h=20)

# Accuracy of Exponential Smoothing Predictive Model
accuracy(TCKRForecast, TCKRTestTS)

# Realized Data Plot
plot(TCKR$date, TCKR$close, col="orange", xlab="Date",
     ylab="Prices", main="Plot of Ticker Data")

# Exponential Smoothing Plot
plot(TCKRForecast, xlab="Time", ylab="Prices",
     main="Holt-Winters Forecast - 20 Days")

# Output Exponential Smoothing Data to Excel
TCKRFrcstSeries <- c(TCKRTrain$close[1:567], TCKRForecast$mean[1:20])

# .csv of original data and all 3 forecasted values
TCKRMerge <- c(TCKRTrain$close[1:567], rep(NA, 20))

dateColumn <- c(as.Date(TCKRTrain$date[1:567]),
                as.Date(TCKRTest$date[1:20]))

TCKRMergeTest <- c(rep(NA, 567), as.numeric(TCKRTest$close[1:20]))

allData <- data.frame(TCKRMerge, TCKRFrcstSeries)

Comparison <- data.frame(dateColumn, TCKRMerge,
                         TCKRMergeTest, TCKRFrcstSeries)
names(Comparison) <- c("Date", "Train_Data", "Test_Data", "HW_Forecast")

tail(Comparison, 30)

plot(Comparison$HW_Forecast[1:587], type="l", col="blue",
     main="Forecast Comparison Plot", xlab="Time", ylab="Values")
lines(Comparison$Test_Data[1:587], col="green")
lines(Comparison$Train_Datat[1:587], col="red")

# write.csv(allData, "allTickerData.csv")
# write.csv(Comparison, "TickerDataComparison.csv")

# Forecasting Model #2 - Holt Winters Exponential Smoothing
tickerData.xts <- xts(as.numeric(Cl(TCKRTrain)),
                      order.by=as.Date(TCKRTrain$date))
tickerData.z = zoo(x=Cl(TCKRTrain),
                   order.by=as.Date(TCKRTrain$date))

# Specify the prices and store our models
prices <- tickerData.xts[,1]

# Create indicator
sma <- SMA(tickerData.xts, n=1)

# Calculate the indicators we need for our strategy
CCI20 <- CCI(prices, 20)
RSI3 <- RSI(prices, 3)
DEMA10 <- DEMA(prices, n = 10, v = 1, wilder = FALSE)
DEMA10c <- prices - DEMA10  
DEMA10c <- DEMA10c/.0001

buy.signal <- ifelse(RSI3 < 30 & CCI20 > -290 & CCI20 <
                       -100 & DEMA10c > -40 & DEMA10c < 750, 1, NA)

# Construct trading rule
sig <- Lag(ifelse(sma$SMA < buy.signal, 1, -1))

# The trading rules/equity curve
retSMA <- ROC(tickerData.xts) * sig

chartSeries(tickerData.xts, theme=chartTheme('white'),
            TA=c(addVo(),addBBands(),addMACD()))

TCKRTS <- ts(TCKRTrain$close, start=c(2014, 1, 1),
             end=c(2016, 1, 1), frequency=250)

# Seasonal decomposition
fit <- stl(TCKRTS, s.window="period")
monthplot(TCKRTS, col="green",
          main="Month Plot of TWTR, Seasonal Adjustment")

# triple exponential - models level, trend, and seasonal components
fit <- HoltWinters(TCKRTS)

# predict next three future values
TWTRForecast <- forecast(fit, 20)
plot(TWTRForecast,
     main="TWTR Price Forecast (20 Days) from Holt-Winters Filtering")

# New Forecast Data
TWTRFrcstSeries <- c(TCKRTrain$close[1:567], TWTRForecast$mean[1:20])

Comparison$NewForecast <- TWTRFrcstSeries
names(Comparison) <- c("Date", "Train_Data","Test_Data",
                       "HW_Forecast", "New_Forecast")

tail(Comparison, 30)

plot(Comparison$HW_Forecast[1:587], type="l", col="blue",
     main="Forecast Comparison Plot", xlab="Time", ylab="Values")
lines(Comparison$New_Forecast[1:587], col="black")
lines(Comparison$Test_Data[1:587], col="green")
lines(Comparison$Train_Datat[1:587], col="red")

spec <- ugarchspec()
nrow(expand.grid(GARCH=1:14, VEX=0:1, VT=0:1, Mean=0:1, ARCHM=0:2,
                 ARFIMA=0:1, MEX=0:1, DISTR=1:10))

spec <- ugarchspec(variance.model=list(model='eGARCH',
                                       garchOrder=c(1, 1)),
                   distribution='std')

# Fit models with Generalized Auto-Regressive Conditional Heteroskadacity
all.fitted.model <- ugarchfit(spec, TCKRTrainTS, solver='hybrid')

coefBMtable <- data.frame(coef(all.fitted.model))
names(coefBMtable) <- "GARCH Parameters"
coefBMtable

par(mfrow = c(1,2))
plot(all.fitted.model, which=8)
plot(all.fitted.model, which=9)

par(mfrow = c(1,1))
forc1 = ugarchforecast(all.fitted.model, n.ahead=20)
plot(forc1, which = 3)

# GARCH Forecast Data
GARCHFrcstSeries <- c(TCKRTrain$close[1:567],
                      forc1@forecast$seriesFor[1:20])

Comparison$GARCHForecast <- GARCHFrcstSeries
names(Comparison) <- c("Date", "Train_Data", "Test_Data", "HW_Forecast",
                       "New_Forecast", "GARCH_Forecast")

tail(data.frame(Comparison[1], Comparison[3:6]), 30)

plot(Comparison$HW_Forecast[1:587], type="l", col="blue",
     main="Forecast Comparison Plot", xlab="Time", ylab="Values")
lines(Comparison$GARCH_Forecast[1:587], col="orange")
lines(Comparison$New_Forecast[1:587], col="black")
lines(Comparison$Test_Data[1:587], col="green")
lines(Comparison$Train_Datat[1:587], col="red")

############################################
############################################
##
## 36) Text Mining
##
############################################
############################################

# Text Mining Code
reason2 <- sum(grepl("baseline", as.character(chicagobooking[,13])))
biostatsTwitter <- grep("biostats",lineTwitter)
lineTwitter[biostatsTwitter]

rquote <- "workspace loaded from"
chars <- strsplit(rquote, split = "")[[1]]

# Print without quotes
cat(dollar(TotalClintonDisbursements), "\n")

##################################################
##################################################
##
## 53) Image Classification
##
##################################################
##################################################

library(keras)
install_keras()

fashion_mnist <- dataset_fashion_mnist()

c(train_images, train_labels) %<-% fashion_mnist$train
c(test_images, test_labels) %<-% fashion_mnist$test

# Each image is mapped to a single label.
# Since the class names are not included with the dataset,
# we'll store them in a vector to use later when plotting the images.
class_names = c('T-shirt/top',
                'Trouser',
                'Pullover',
                'Dress',
                'Coat', 
                'Sandal',
                'Shirt',
                'Sneaker',
                'Bag',
                'Ankle boot')

# There are 60,000 images in the training set,
# with each image represented as 28 x 28 pixels:
dim(train_images)

# Likewise, there are 60,000 labels in the training set:
dim(train_labels)

# Each label is an integer between 0 and 9:
train_labels[1:20]

# Preprocess the data
# The data must be preprocessed before training the network.
# If you inspect the first image in the training set,
# you will see that the pixel values fall in the range of 0 to 255:
library(tidyr)
library(ggplot2)

image_1 <- as.data.frame(train_images[1, , ])
colnames(image_1) <- seq_len(ncol(image_1))
image_1$y <- seq_len(nrow(image_1))
image_1 <- gather(image_1, "x", "value", -y)
image_1$x <- as.integer(image_1$x)

ggplot(image_1, aes(x = x, y = y, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "black", na.value = NA) +
  scale_y_reverse() +
  theme_minimal() +
  theme(panel.grid = element_blank())   +
  theme(aspect.ratio = 1) +
  xlab("") +
  ylab("")

# We scale these values to a range of 0 to 1 before
# feeding to the neural network model. For this, we simply divide by 255.

# It's important that the training set and the testing set
# are preprocessed in the same way:

train_images <- train_images / 255
test_images <- test_images / 255

# Display the first 25 images from the training set and
# display the class name below each image. Verify that
# the data is in the correct format and we're ready to
# build and train the network.

par(mfcol=c(5,5))
par(mar=c(0, 0, 1.5, 0), xaxs='i', yaxs='i')
for (i in 1:25) { 
  img <- train_images[i, , ]
  img <- t(apply(img, 2, rev)) 
  image(1:28, 1:28, img, col = gray((0:255)/255), xaxt = 'n', yaxt = 'n',
        main = paste(class_names[train_labels[i] + 1]))
}

# SETUP THE LAYERS
# The basic building block of a neural network is the layer.
# Layers extract representations from the data fed into them.
# And, hopefully, these representations are more meaningful
# for the problem at hand.

# Most of deep learning consists of chaining together simple layers.
# Most layers, like layer_dense, have parameters that are learned
# during training.

model <- keras_model_sequential()
model %>%
  layer_flatten(input_shape = c(28, 28)) %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 10, activation = 'softmax')

# COMPILE THE MODEL
model %>% compile(
  optimizer = 'adam', 
  loss = 'sparse_categorical_crossentropy',
  metrics = c('accuracy')
)

# TRAIN THE MODEL
model %>% fit(train_images, train_labels, epochs = 5, verbose = 2)

# EVALUATE ACCURACY
score <- model %>% evaluate(test_images, test_labels, verbose = 0)
cat('Test loss:', score$loss, "\n")
cat('Test accuracy:', score$acc, "\n")

predictions <- model %>% predict(test_images)
predictions[1, ]

which.max(predictions[1, ])

class_pred <- model %>% predict_classes(test_images)
class_pred[1:20]

test_labels[1]

par(mfcol=c(5,5))
par(mar=c(0, 0, 1.5, 0), xaxs='i', yaxs='i')
for (i in 1:25) { 
  img <- test_images[i, , ]
  img <- t(apply(img, 2, rev)) 
  # subtract 1 as labels go from 0 to 9
  predicted_label <- which.max(predictions[i, ]) - 1
  true_label <- test_labels[i]
  if (predicted_label == true_label) {
    color <- '#008800' 
  } else {
    color <- '#bb0000'
  }
  image(1:28, 1:28, img, col = gray((0:255)/255), xaxt = 'n', yaxt = 'n',
        main = paste0(class_names[predicted_label + 1], " (",
                      class_names[true_label + 1], ")"),
        col.main = color)
}

# Finally, use the trained model to make a prediction about a single image.

# Grab an image from the test dataset
# take care to keep the batch dimension, as this is expected by the model
img <- test_images[1, , , drop = FALSE]
dim(img)

# Now predict the image:
predictions <- model %>% predict(img)
predictions

# predict returns a list of lists, one for each image in the
# batch of data.
# Grab the predictions for our (only) image in the batch:

# subtract 1 as labels are 0-based
prediction <- predictions[1, ] - 1
which.max(prediction)

class_pred <- model %>% predict_classes(img)
class_pred

##################################################
##################################################
##
## 37) Plot Creation - Data Visualization
##
##################################################
##################################################

# Plot Creation
require(grDevices) # for colours
plot(require(grDevices))

plot(columnmean(airquality))
plot(x * airquality$Ozone)
plot(lm(airquality))
plot(Auto$cylinders, Auto$mpg)
plot(Auto$cylinders,Auto$mpg, col="red", varwidth=T,
     xlab="cylinders", ylab="MPG")
hist(Auto$mpg, col=2, breaks=15)
plot(Auto$mpg, Auto$cyl, col = "red",
     abline(lm(Auto$cyl~Auto$mpg)), cex = 1.3, pch = 16,
     main = "Example of Linear Regression",
     xlab = "Mpg", ylab = "Cylinders")

hist(data_protein$v3, main="Histogram of v3", col.main="blue",
     xlab="v3 Levels", ylab="Frequency of Occurrence",
     col.lab="darkblue", col="Dodger Blue")

barplot(USArrests$Rape, names.arg = row.names(USArrests),
        las = 2, ylab = "Rape Rate per 100,000",
        main = "Rape Rate in the United States in 1973")

# Plot creation with qplot
qplot(ngramPlotTen$ngramData, ngramPlotTen$Freq, ngramPlotTen)

# Plot Creation with ggplot2
# http://www.analyticsvidhya.com/blog/2016/03/questions-ggplot2-package-r/?utm_content=buffer2e0d0&utm_medium=social&utm_source=plus.google.com&utm_campaign=buffer

data <- ChickWeight

library(ggplot2)
ggplot(data=data, aes(x=Time, y=weight, group=Chick, colour=Chick)) +
  geom_line() +
  geom_point()

png('Plot2.png', width=720, height=480)
ggplot(PlotData, aes(year~Emissions)) +
  stat_summary(geom="line", fun.y="sum") +
  labs(color="Supplement type", x="Year", y="Total PM25 Emissions",
        title="Variation in Total PM25 Emissions (Baltimore, Maryland)")
dev.off()

ggplot (data=ToothGrowth, aes(x=dose, y=len, color=supp)) +
  geom_point() +
  stat_summary (fun.y=mean, geom="line", size=1, aes(color=supp)) +
  stat_summary (fun.y=mean, geom="line", size=1, colour="black") +
  labs(color="Supplement type", x="Dose in milligrams",
        y="Tooth length",
        title="The Effect of Vitamin C on Tooth Growth in Guinea Pigs")

ggplot(price_df, aes(Date, Price)) +
  geom_step() + geom_point() +
  scale_y_continuous(labels=dollar) +
  theme(plot.title=element_text(vjust=1, color="blue", size=16,
                              face="bold.italic")) +
  theme(axis.text.x=element_text(angle=90, hjust=1, color="orange",
                                 size=14, face="bold")) +
  theme(axis.text.y=element_text(color="orange", size=14, face="bold")) +
  theme(axis.title.x=element_text(color="darkblue", size=14, vjust=0.5),
        axis.title.y=element_text(color="darkblue", size=14, vjust=0.5))

# Other ggplot2 code
coord_flip() +

geom_line(colour="#8224e3",stat="summary", fun.y=mean) +
geom_smooth()

legend("right", title="Milligrams",
       legend=absorbance1$Powder_mg_vs_Absorbance_E_coli,
       col=absorbance1$Powder_mg_vs_Absorbance_E_coli, cex=.5,
       pch=19)

# Pie Chart
ggplot(Final_Dataset[Final_Dataset$`Consumer disputed?` %in% "Yes",],
       aes(x = factor(1), fill = Product)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  theme(axis.text.x = element_blank(), axis.text.y = element_blank(),
        axis.title.y = element_blank(), axis.title.x = element_blank()) +
  scale_fill_manual(values = getPalette(colcount.product)) +
  labs(title = "Products that customers disputed")

ggplot(data=Investments, aes(Type, Amount)) +
  geom_bar(aes(), stat="identity", fill=rainbow(31))

data(whiskey,package="flexmix")
ggplot(subset(whiskey_brands,Brand!="Other brands")
       ,aes(x=Type, fill=Brand)) +
  geom_bar(position="fill")

# Plot Creation with a slider
library(manipulate)
k <- 1000
xvals <- seq(-5, 5, length=k)
myplot <- function(df){
  d <- data.frame(y=c(dnorm(xvals), dt(xvals, df)), x=xvals,
                  dist=factor(rep(c("Normal", "T"), c(k, k))))
  g <- ggplot(d, aes(x=x, y=y))
  g <- g + geom_line(size=2, aes(col=dist))
  g
}
manipulate(myplot(mu), mu=slider(1, 20, step=1))

manipulate(
  plot(cars, xlim = c(0, x.max), type = type, ann = label),
  x.max = slider(10, 25, step=5, initial = 25),
  type = picker("Points" = "p", "Line" = "l", "Step" = "s"),
  label = checkbox(TRUE, "Draw Labels"))

# Plot creation with GoogleVis
require(googleVis)
df=data.frame(country=c("US", "GB", "BR"), val1=c(10, 13, 14),
              val2=c(23, 12, 32))
Line <- gvisLineChart(df)
plot(Line)

# GoogleVis Bar Chart
Bar <- gvisBarChart(df)
plot(Bar)

# GoogleVis Column Chart
Column <- gvisColumnChart(df)
plot(Column)

# Other GoogleVis examples
# http://cran.r-project.org/web/packages/googleVis/vignettes/googleVis_examples.html

install.packages("scales"); packageVersion("scales")
library(scales)
library(plotly)

# volcano is a numeric matrix that ships with R
plot(volcano, main="Volcano", col.main="blue", xlab="Time",
     ylab="Surface", col.lab="darkblue")

plot_ly(z=volcano, type="surface")

kd <- with(MASS::geyser, MASS::kde2d(duration, waiting, n=50))
with(kd, plot_ly(x=x, y=y, z=z, type="surface"))

set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000), ]
plot(d$carat)
plot(d$color)
plot(d$price)
plot(d$carat, d$price, main="Diamonds, (Carat vs. Price)",
     col.main="blue", xlab="carat", ylab="Price", col.lab="darkblue")

iris %>%
  ggvis(~Petal.Length, ~Petal.Width, fill = ~Species) %>%
  layer_points()

d %>%
  ggvis(~carat, ~price, fill= ~carat) %>%
  layer_points() %>% layer_smooths()

d %>%
  ggvis(~table, ~price, fill= ~table) %>%
  layer_points() %>% layer_smooths()

Diamonds <- gvisScatterChart(data.frame(d$table, d$price))
plot(Diamonds)

plot_ly(d, x=carat, y=price, text=paste("Clarity: ", clarity),
        mode="markers", color=carat, size=carat)

##################################################
##################################################
##
## 39) Cartography
##
##################################################
##################################################

library(leaflet)
# http://rstudio.github.io/leaflet/

# a map with the default DSM tile layer
m <- leaflet() %>% addTiles()
m

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map

# or
m <- leaflet()
m <- addTiles(m)
m <- addMarkers(m, lng=174.768, lat=-36.852,
                popup="The birthplace of R")
m

# Set bounds
m %>% fitBounds(0, 48, 18, 50)

# Move the center to Hall
m <- m %>% setView(-93.65, 42.0205, zoom=17)
m

# Add PopUps
m <- m %>% addPopups(-93.65, 42.0205, "Here is the <b>Department
                     of Statistics</b>, ISU")
m

# Add Markers
m <- m %>% addMarkers(-93.65, 42.0211)
m

library(maps)
mapStates <- map("state", fill=T, plot=F)
leaflet(data=mapStates) %>% addTiles() %>%
  addPolygons(fillColor=topo.colors(10, alpha=NULL), stroke=F)

m <- leaflet() %>% setView(lng=-71.0589, lat=42.3601, zoom=12)
m %>% addTiles()

##################################################
##################################################
##
## 40) Shinyapps
##
##################################################
##################################################

library(shiny)
ui <- basicPage(
  plotOutput("plot"),
  sliderInput("bins", "Number of bins:", 1, 50, 20)
)

server <- function(input, output) {
  output$plot <- renderPlot({
    hist(faithful$waiting, breaks=input$bins)
  })
}
shinyApp(ui, server)

# Direct Interaction - Clicking
ui <- basicPage(
  plotOutput("plot1", click="plot_click", width=400),
  verbatimTextOutput("info")
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })

  output$info <- renderText({
    paste0("x=", input$plot_click$x, "\n",
           "y=", input$plot_click$y)
  })
}
shinyApp(ui, server)

# Direct Interaction - Nearest Point
ui <- basicPage(
  plotOutput("plot1", click="plot_click", width=400),
  verbatimTextOutput("info")
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })

  output$info <- renderPrint({
    row <- nearPoints(mtcars, input$plot_click,
                      xvar="wt", yvar="mpg",
                      threshold=5, maxpoints=1)

    cat("Nearest point within 5 pixels:\n")
    print(row)
  })
}

shinyApp(ui, server)

# State Accumulation
ui <- basicPage(
  plotOutput("plot1", click="plot_click", width=400)
)

server <- function(input, output) {
  vals <- reactiveValues(mtc=mtcars[, c("wt", "mpg")])

  observeEvent(input$plot_click, {
    vals$mtc <- rbind(vals$mtc,
    data.frame(wt=input$plot_click$x, mpg=input$plot_click$y)
    )
  })

  output$plot1 <- renderPlot({
    plot(vals$mtc$wt, vals$mtc$mpg)
  })
}

shinyApp(ui, server)

# Brushing
library(ggplot2)
ui <- basicPage(
  fluidRow(
    column(width=6,
           plotOutput("scatter1", brush=brushOpts(id="brush"))
    ),
    column(width=6, plotOutput("scatter2"))
  )
)

server <- function(input, output) {
  output$scatter1 <- renderPlot({
    ggplot(mtcars, aes(disp, hp)) +
      geom_point(size=3, shape=21, fill="white", colour="black") +
      theme_bw(base_size=16)
  })

  output$scatter2 <- renderPlot({
    brushed <- brushedPoints(mtcars, input$brush)
    ggplot(mtcars, aes(wt, mpg)) +
      geom_point(size=3, shape=21, fill="white", colour="black") +
      geom_point(data=brushed, colour="#4488ee", size=3) +
      theme_bw(base_size=16)
  })
}

shinyApp(ui, server)

# Linked Zooming
ui <- basicPage(
  plotOutput("zoom", height = "350px"),
  plotOutput("overall", height = "150px",
             brush =  brushOpts(id = "brush", direction = "x")
  )
)

server <- function(input, output) {
  ss <- data.frame(n=as.numeric(sunspots),
                    year=rep(1749:1983, each=12) + (0:11)/12)

  p <- ggplot(ss, aes(year, n)) +
    geom_line() + theme_bw(base_size=16)

  output$zoom <- renderPlot({
    if (!is.null(input$brush)) {
      p <- p + xlim(input$brush$xmin, input$brush$xmax)
    }
    p
  })
  output$overall <- renderPlot(p)
}

shinyApp(ui, server)

library(leaflet)
library(dplyr)
library(htmltools)

mapVis <- function(x, radius=~10, color="Blue") {
  leaflet(x) %>%
    setView(lng=-81.3754, lat=28.616, zoom=9) %>%
    addTiles() %>%
    addCircleMarkers(radius=radius, color=color,
                     popup=~htmltools::htmlEscape(name))
}
mapVis()

require(grDevices) # for colours
x <- -6:16
op <- par(mfrow = c(2, 2))

# Contour plot in R
f <- outer(x, y, function(x,y) cos(y) / (1+x^2))
contour(x, y, f, nlevels=45, add=T)
fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels=15)
image(x, y, fa)
persp(x, y, fa)
persp(x, y, fa, theta=30, phi=20)
persp(x, y, fa, theta=30, phi=70)

contour(outer(x, x), method="edge", vfont=c("sans serif", "plain"))
z <- outer(x, sqrt(abs(x)), FUN="/")
image(x, x, z)
contour(x, x, z, col="pink", add=T, method="edge",
        vfont=c("sans serif", "plain"))
contour(x, x, z, ylim=c(1, 6), method="simple", labcex=1,
        xlab=quote(x[1]), ylab=quote(x[2]))

n <- matrix(runif(50),5,5)
contour(n)
op <- par(mfrow=c(1,1))

# Matrix plot
m <- matrix(runif(100),10,10)
image(m)

m <- matrix(runif(100),10,10)
image(m, axes=F, col=grey(seq(0, 1, length=256)), oldstyle=T)

# Interactive Reports
if(!require("dygraphs")) {install.packages("dygraphs");
  require("dygraphs")}
if(!require("htmlwidgets")) {install.packages("htmlwidgets");
  require("htmlwidgets")}
library(dygraphs)
library(htmlwidgets)

# Generate some data
lungDeaths <- cbind(mdeaths, fdeaths)

# Plot
dygraphs::dygraph(lungDeaths) %>%
  dySeries("mdeaths", label = "Male") %>%
  dySeries("fdeaths", label = "Female") %>%
  dyOptions(stackedGraph = TRUE) %>%
  dyRangeSelector(height = 20)

if(!require("DT")) {install.packages("DT"); require("DT")}
library(DT)

# Create Sample Dataset
m <- matrix(runif(1000 * 4), ncol = 4,
           dimnames = list(NULL, letters[1:4]))
m <- cbind(id = seq_len(nrow(m)), round(m, 2))

# Create table
DT::datatable(m, extensions = "Scroller",
              options = list(dom = "frtiS", scrollY = 200, scrollCollapse = TRUE))

# Swap_data <- subset(Swap_data, X10.Years.Mid.Rate.in.bps != "N/A")
# swap_date <- as.Date(Swap_data$Date, format="%m/%d/%Y")

# knitr::opts_chunk$set(fig.width=9, fig.height=6, fig.align='center')

# : reference_docx: "Chartpack 8_29 closing.docx"

# knitr::opts_chunk$set(fig.width=9, fig.height=6, fig.align='center')


##################################################
##################################################
##
## 41) Twitter Analysis
##
##################################################
##################################################

# Access Twitter API
# library(twitteR)
# consumer_key <- "UowkpfBq1IfPl4sgHPfuxhzwO"
# consumer_secret <- "1A1kp5sYhARgk9pQT2YAzj8AUWMNyhVVRRBf4LKVP9lEmJGbge"
# access_token <- "758080422345531398-GKSngPSzL5Sm7kJKw1T1KAvs5UWSu2R"
# access_secret <- "OTGFuH93JapGEqGBzHDu8Ld8S0Nk0lyHLtFNgXUEADYbE"
# setup_twitter_oauth(consumer_key, consumer_secret,access_token,access_secret)

# library(twitteR)
# api_key <- "kHKPGpLcPtp1Gdoi1Hvd7TeyC"
# api_secret <- "wK43Hr9w6TpZRPWGZxBc6pF1AFLfFsauJqgajX5RfrPLP2JCpv"
# access_token <- "11265142-D1H3VV0ktAzWSKT6dXsI9LpXq46chrFMZSZ2J0DOn"
# access_token_secret <- "Zbwtux2UWrQpCljsZuJnw9fROV2O3ghWmm5YFhsuY8LIX"
# options(httr_oauth_cache=T)
# setup_twitter_oauth(api_key, api_secret, access_token=NULL, access_secret=NULL)
# setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

# johnakweitweets <- userTimeline('JohnAkwei', n = 1000)
# johnakweitweets_df <- twListToDF(johnakweitweets)
# write.csv(johnakweitweets_df, "johnakweitweets.csv")
#
# j363jtweets <- userTimeline('j363j', n = 1000)
# j363jtweets_df <- twListToDF(j363jtweets)
# write.csv(j363jtweets_df, "j363jtweets.csv")

############################################
############################################
##
## 42) Correlation Analysis with Cross-Tabulation
##
############################################
############################################

# In this section, the Independent, (or Explanatory), Variables
# are examined for correlation
# with the Dependent, (or Response) Variable. The independent
# variables are "Company", "State",
# and "Product". The dependent variable is "Company Response".
# A two factor cross-tabulation,
# (with the "xtabs()" function), with the dependent variable
# as the first condition, and the
# independent variable as the second condition, produces the
# Chisq, df, and p-value

summary(xtabs(~Company.response.to.consumer + Company, data=Final_Dataset))
plot(BankAdditionalNum$Age, as.numeric(as.factor(bank_additional$y)))

Population <- data.frame(Population = rep(1:100))
Population[1:50,] <- paste("Woman", rep(1:50), sep="")
Population[51:100,] <- paste("Man", rep(1:50), sep="")
Population$Overweight <- "Overweight"
Population$Overweight[71:100] <- "Non-Overweight"
Population$Obese <- "Obese"
Population$Obese[26:50] <- "Non-Obese"
Population$Obese[61:100] <- "Non-Obese"
barplot(table(Population$Overweight))
barplot(table(Population$Obese))
ftable(Population$Overweight)

setwd("C:/Users/Administrator/Dropbox/Programming/Coursera/CommunityHealthApp/chsi_dataset")
getwd()
dt <- read.csv("RISKFACTORSANDACCESSTOCARENA.csv")
names(dt)
length(unique(dt$CHSI_County_Name))
length(dt$CHSI_County_Name[dt$CHSI_County_Name=="Montgomery"])
data.frame(sort(table(dt$CHSI_County_Name),decreasing=TRUE)[1:10])

Doc_Table <- matrix(1:16, 4, 2)
m <- matrix(1:16, 4, 2)
Doc_Table <- rbind(Doc_Table, m)

library(data.table)
Doc_Table <- data.table(Doc_Table)
colnames(Doc_Table) <- c("acct", "Doc_ID")
Doc_Table$acct[2] <- 55
Doc_Table$Doc_ID[4] <- 120
class(Doc_Table)

Doc_Table$acct[duplicated(Doc_Table$acct)==TRUE]
Doc_Table$Doc_ID[duplicated(Doc_Table$Doc_ID)==TRUE]

DuplicatesTable <- data.table(acct_duplicates=
                                Doc_Table$acct[duplicated(Doc_Table$acct)==TRUE],
                              Doc_ID_duplicates=
                                Doc_Table$Doc_ID[duplicated(Doc_Table$Doc_ID)==TRUE])

##################################################
##################################################
##
## 43) Web Scraping
##
##################################################
##################################################

# Set working directory
setwd("C:/Users/Administrator/Dropbox/Programming/StockTrading/AutomatedTradingStrategies")
getwd()

# Installing the web scraping package rvest
# install.packages("rvest")
library(rvest)
library(ggplot2)
library(reshape2)

# Get cryptocurrency data
url <- "https://www.worldcoinindex.com/trending/overview"
index <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="myTable"]') %>%
  html_table()
index <- index[[1]]

# View start of table
head(index,1)

# categories
names(index) <- c("#", "empty", "Name", "Ticker", "Price", "Percent_Change", "day7",
                  "day30", "day90", "day180", "day365", "Total_Supply", "Market_Cap", "MC_Rank")

# Remove "#", "empty", and "MC_Rank" columns
index <- index[,c(-1,-2, -14)]

# Convert character columns to numeric
index$Price <- round(as.numeric(gsub( "[$,]","", index$Price)),6)
index$Percent_Change <- as.numeric(sub("%","",index$Percent_Change))
index$day7 <- as.numeric(sub("%","",index$day7))
index$day30 <- as.numeric(sub("%","",index$day30))
index$day90 <- as.numeric(sub("%","",index$day90))
index$day180 <- as.numeric(sub("%","",index$day180))
index$day365 <- as.numeric(sub("%","",index$day365))

# Convert Market Cap column to numeric
index$Conversion <- as.character(rep(1:nrow(index)))
index$Conversion[grep("M", index$Market_Cap)] <- 1000000
index$Conversion[grep("B", index$Market_Cap)] <- 1000000000
index$Market_Cap <- as.numeric(gsub("[$,MB]", "", index$Market_Cap))
index$Market_Cap <- index$Market_Cap * as.numeric(index$Conversion)

# Convert Total Supply column to numeric
index$Conversion <- as.character(rep(1:nrow(index)))
index$Conversion[grep("M", index$Total_Supply)] <- 1000000
index$Conversion[grep("B", index$Total_Supply)] <- 1000000000
index$Conversion[grep("T", index$Total_Supply)] <- 1000000000000
index$Total_Supply <- as.numeric(gsub("[MBT]", "", index$Total_Supply))
index$Total_Supply <- index$Total_Supply * as.numeric(index$Conversion)

# Remove "Conversion" column
index <- index[,c(-12)]

# Remove "CUBE", a cryptocurrency with unreliable stats
# index <- index[!index$Ticker=="CUBE",]

# Sort by 365 day column
index_sort_365 <- index[order(index$day365, decreasing = T),]

# Sort by 7 day column
index_sort_7 <- index[order(index$day7, decreasing = T),]

# Sort by price column
index_sort_price <- index[order(index$Price, decreasing = T),]

# Sort by Market_Cap column
index_sort_marketcap <- index[order(index$Market_Cap),]

# new row numbers for new dataframes
rownames(index) <- NULL

LowCap <- na.omit(index[na.omit(index$Market_Cap) < 2e+6,])
MidCap <- na.omit(index[na.omit(index$Market_Cap) > 2e+6 &
                          na.omit(index$Market_Cap) < 1e+8,])
HighCap <- na.omit(index[!is.na(index$Market_Cap) > 1e+8,])

# Return after 365 days, for all coins
Day365_Percent_Change <- apply(index[9], 2, mean)

# Return after 180 days, for all coins
Day180_Percent_Change <- apply(index[8], 2, mean)

# Return after 90 days, for all coins
Day90_Percent_Change <- apply(index[7], 2, mean)

# Return after 30 days, for all coins
Day30_Percent_Change <- apply(index[6], 2, mean)

# Return after 7 days, for all coins
Day7_Percent_Change <- apply(index[5], 2, mean)

Day365_Percent_Change
Day180_Percent_Change
Day90_Percent_Change
Day30_Percent_Change
Day7_Percent_Change

as.data.frame(index[grepl("green", index$Name),]$Name)

# Save .csv file
write.csv(index, "WorldCoinIndex.csv")

CryptoMarket <- read.csv("Icobox_Upcoming_ICOs - CryptoMarket.csv", header = T)

# Set Date range for graph
# CryptoMarket$Date <- as.Date(CryptoMarket$Date)
CryptoMarket$Date <- seq(as.Date("2018/2/9"), as.Date("2018/3/12"), "days")

meltdf <- melt(CryptoMarket,id="Date")
ggplot(meltdf,aes(x=Date,y=value,colour=variable,group=variable)) +
  geom_line() +
  labs (y="Percent Change",
        title="7 Day through 1 Year Percent Change - All Cryptocurrencies")

# Get medical data
url <- "https://www.diabetes.co.uk/forum/threads/metformin-not-working.113436/"
index <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="messageList"]') %>%
  html_table()
index <- index[[1]]

##################################################
##################################################
##
## 44) Reliability
##
##################################################
##################################################

# Calculating the Reliability with Components in Parallel

# Consider a system consisting of three subsystems arranged
# reliability-wise in parallel. Subsystem 1 has a reliability
# of 99.5%, Subsystem 2 has a reliability of 98.7% and Subsystem
# 3 has a reliability of 97.3% for a mission of 100 hours.
# What is the overall reliability of the system for a 100-hour mission?

# Since the reliabilities of the subsystems are specified
# for 100 hours, the reliability of the system for a 100-hour
# mission is:

Rs <- 1 - (1 - 0.26) * (1 - 0.26) * (1 - 0.26) *
  (1 - 0.26) * (1 - 0.26) * (1 - 0.26) * (1 - 0.26) *
  (1 - 0.26) * (1 - 0.26) * (1 - 0.26)

# Rs = 0.9507601
# Number of wires = 10
# HD #1 is 0.9, HD #2 is 0.88 and HD #3 is 0.85

Data1 <- data.frame(Reference = c("KRXH", "KRPT", "FHRA", "CZKK", "CQTN", "PZXW", "SZRZ", "RMZE", "STNX", "TMDW"), Status = c("Accepted", "Accepted", "Rejected", "Accepted", "Rejected", "Accepted", "Rejected", "Rejected", "Accepted", "Accepted"), Gender = c("Female", "Male", "Male", "Female", "Female", "Female", "Male", "Female", "Female", "Female"), Test = c("Test1", "Test1", "Test2", "Test3", "Test1", "Test4", "Test4", "Test2", "Test3", "Test1"), NewOrFollowUp = c("New", "New", "New", "New", "New", "Follow-up", "New", "New", "New", "New"))

xtabs(~Status, data=Data1)

#######################################################
#### Created by Rolf Lohaus, EEB Dept., Rice University
####
#### Part of the code modified and extended from
####    Robert I. Kabacoff's Quick-R website
####    (http://www.statmethods.net)
#######################################################

###############  HIGH-LEVEL PLOTTING FUNCTIONS  ###############

# load some data (dataset of types of cars and their specs used earlier in our meetings)
data(mtcars)

# create a basic scatterplot (e.g weight vs. miles per gallon)
plot(mtcars$wt, mtcars$mpg)

# specify better axis labels and add a title (note plot always creates a new plot erasing the current one)
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")

#####  SAVING GRAPHS  #####

# save the graph either by using 'Export' in the 'Plots' tab in RStudio or using the following functions
pdf("weight_mpg.pdf")       # create PDF in current working directory
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
dev.off()                   # "save" the PDF

# pdf("C:/Graphs/weight_mpg.pdf")         # create PDF in some other directory
# plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
# dev.off()                               # "save" the PDF

# change the size of the PDF (in inches)
pdf("weight_mpg.pdf", width=6, height=5)        # create PDF in current working directory
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
dev.off()                                       # "save" the PDF

# change the font family of the text in the PDF (default is sans-serif "Helvetica")
pdf("weight_mpg.pdf", width=6, height=5, family="Times")        # create PDF in current working directory
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
dev.off()                                                       # "save" the PDF

png("weight_mpg.png")       # create PNG in current working directory
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
dev.off()                   # "save" the PNG

# jpeg("weight_mpg.jpg")      # create JPEG in current working directory
# plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
# dev.off()                   # "save" the JPEG

#####  HISTOGRAMS  #####

# create a basic histogram
hist(mtcars$mpg)
hist(mtcars$mpg, xlab="Miles per gallon", main="Histogram of Miles per Gallon")

# control number of bins with parameter 'breaks'
hist(mtcars$mpg, breaks=12)
hist(mtcars$mpg, breaks=seq(10,34))

# get information about histogram
hInfo <- hist(mtcars$mpg, breaks=seq(10,34))
hInfo

# plot probability density instead of frequencies
hist(mtcars$mpg, breaks=seq(10,34), freq=F)

# create a kernel density plot
plot(density(mtcars$mpg))

#####  BAR PLOTS  #####

# create a basic barplot
gearCounts <- table(mtcars$gear)
gearCounts
barplot(gearCounts)
barplot(gearCounts, xlab="Number of gears")
# label the bars individually with parameter 'names.arg'
barplot(gearCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"))

barplot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)")

# horizontal bar plot
barplot(gearCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), horiz=TRUE)

# stacked bar plot
gearTransmissionCounts <- table(mtcars$am, mtcars$gear)
gearTransmissionCounts
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"))
# add a legend with automatic labels with parameter 'legend.text'
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), legend.text=T)
# add a legend with custom labels
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), legend.text=c("automatic", "manual"))

# grouped bar plot with parameter 'beside=TRUE'
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), legend.text=c("automatic", "manual"), beside=TRUE)

#####  BOX PLOTS  #####

# create a boxplot for an individual variable (e.g. miles per gallon)
boxplot(mtcars$mpg, ylab="Miles per gallon")

# create a boxplot for a variable by group (e.g. miles per gallon by cylinders)
boxplot(mpg ~ cyl, data=mtcars, xlab="Number of cylinders", ylab="Miles per gallon")
# do not draw outliers
boxplot(mpg ~ cyl, data=mtcars, xlab="Number of cylinders", ylab="Miles per gallon", outline=FALSE)

#####  LINE PLOTS  #####

# load some time data (dataset of growth of five orange trees over time)
data(Orange)
Orange

# extract data for 1st tree
tree1 <- subset(Orange, Orange$Tree==1)

# plot age vs circumference
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)")
# use lines with parameter 'type="l"'
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="l")
# use both points and lines with parameter 'type="b"'
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="b")
# use both points and lines overlayed with parameter 'type="o"'
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="o")

##################################################
##################################################
##
## 46) Example Parameters
##
##################################################
##################################################

setwd("C:/Users/johna/Dropbox/Programming/WebScraping")

library(httr)
library(jsonlite)

# Fiverr client authenticate information
fiverr_clientid <- "72a5e0fce39f435ebccfc1862fd052fa"
fiverr_clientsecret <- "650b10b21628444fabf2ddea36daa922"
fiverr_username <- "ayed.alsabawi@predacitycapital.com"
fiverr_password <- "Abcd1234@"
fiverr_payload <- "grant_type=password&client_id=72a5e0fce39f435ebccfc1862fd052fa&client_secret=650b10b21628444fabf2ddea36daa922&username=ayed.alsabawi@predacitycapital.com&password=Abcd1234@"
fiverr_payload004 <- list(
  grant_type='password',
  client_id=fiverr_clientid,
  client_secret=fiverr_clientsecret,
  username=fiverr_username,
  password=fiverr_password
)

# All API access information
Prosper_Base_Address <- "https://api.prosper.com/v1"
Request_URL <- "https://api.prosper.com/v1/security/oauth/token"
ClientID_Username <- "b7cdc9351d6d41c984bca165f00dd52e"
ClientSecret_Password <- "0699ad550d544b93a3dbd1f73be7269d"
Prosper_Account_Username <- "johnakwei1@gmail.com"
Prosper_Account_Password <- "qxUa4KHnbuebiV!"

headers <- gsub("\\[|\\]", "",
                toJSON(
                  data.frame(Accept='application/json',
                             `Content-Type` = 'application/json')))

payload002 <- list(grant_type='password',
                   client_id=ClientID_Username,
                   client_secret=ClientSecret_Password,
                   username=Prosper_Account_Username,
                   password=Prosper_Account_Password)

##################################################
##################################################
##
## 47) Trial Code
##
##################################################
##################################################

# Create the endpoints
prosper_endpoints <- oauth_endpoint(NULL, "authorize", "accessToken",
                                    base_url = "https://api.prosper.com/v1/security/oauth/token")

# Create the request app
prosper_app <- oauth_app("prosper_endpoints",
                         key = ClientID_Username,
                         secret = ClientSecret_Password)

prosper_app <- oauth_app("prosper_endpoints",
                         key = fiverr_clientid,
                         secret = fiverr_clientsecret)

# Get OAuth 2.0 credentials
prosper_token <- oauth2.0_token(prosper_endpoints, prosper_app,
                                config_init = headers,
                                user_params = payload002)

prosper_token <- oauth2.0_token(prosper_endpoints, prosper_app,
                                config_init = c('accept'= 'application/json',
                                                         'content-type'= 'application/x-www-form-urlencoded'),
                                user_params = list(grant_type='password',
                                             client_id=client_id,
                                             client_secret=client_secret,
                                             username=username,
                                             password=password))


prosper_token <- oauth2.0_token(prosper_endpoints, prosper_app,
                                config_init = headers,
                                user_params = fiverr_payload004)

# Produces a response
prosper_token <- HEAD(Request_URL, add_headers(unlist(payload002)))
prosper_token <- POST(Request_URL,
                      authenticate(Prosper_Account_Username,
                                   Prosper_Account_Password),
                      body = payload002)

# Inspect Token Request Response
prosper_token$request$opts$httpheader
status_code(prosper_token)
headers(prosper_token)
str(content(prosper_token))
headers(prosper_token)$date
http_status(prosper_token)
content(prosper_token, "text")
str(content(prosper_token, "parsed"))
content(prosper_token, "text")

# API call specification
base <- "https://api.prosper.com/v1"
endpoint <- "/accounts/prosper/"
call1 <- paste(base, endpoint, sep="")

# Download data
prosper_download <- GET(call1, config(token = prosper_token))

# Examine downloaded data
stop_for_status(prosper_download)
output <- content(prosper_download)
status_code(prosper_download)
str(content(prosper_download))

# Prosper_Account_Password <- "Wheatonmd12!"
# Prosper_Account_Password <- "tT6DB9FA!gVDKDj"

headers002 <- c('accept' = 'application/json',
                `Content-Type` = 'application/json')

headers003 <- fromJSON('{ "accept": "application/json", "content-type": "application/x-www-form-urlencoded" }')

payload <- "grant_type=password&client_id=b7cdc9351d6d41c984bca165f00dd52e&client_secret=0699ad550d544b93a3dbd1f73be7269d&username=johnakwei1@gmail.com&password=qxUa4KHnbuebiV!"

payload003 <- list(accept='application/json',
                   'content-type'='application/x-www-form-urlencoded',
                   grant_type='password',
                   client_id=ClientID_Username,
                   client_secret=ClientSecret_Password,
                   username=Prosper_Account_Username,
                   password=Prosper_Account_Password)

##################################################
##################################################
##
## 42) References
##
##################################################
##################################################

# Prosper API Wrapper Library
# https://github.com/jsumner5/Prosper-Api-Wrapper-Library
# https://github.com/bdelliott/prosper

# Assign Orders to Portfolios
# https://github.com/Friede80/Prosper/blob/master/Prosper.hs

# https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
# https://cran.r-project.org/web/packages/LendingClub/LendingClub.pdf
# https://github.com/kuhnr130/LendingClub
# https://www.google.com/search?rlz=1C1SQJL_enUS848US848&sxsrf=ACYBGNRU3mqdFwjEVhOaBjGckD1jGO3KYA%3A1571260430362&lei=DoinXZLeFePM5gKT4oDoBw&q=httr%20post%20content%20type&ved=2ahUKEwiutqmf2aHlAhXOV98KHU4JAOoQsKwBKAB6BAgBEAE&biw=1366&bih=625
# https://developers.prosper.com/docs/authenticating-with-oauth-2-0/authorization-key-flow/

# API documentation is at
# https://developers.prosper.com/docs/investor/accounts-api/
# https://developers.prosper.com/docs/authenticating-with-oauth-2-0/password-flow/#oauth_password_flow_curl_and_python_examples

##################################################
##################################################
##
## 48) API Test Code
##
##################################################
##################################################

# Basic API access code
r <- GET("http://httpbin.org/get")
status_code(r)
headers(r)$date
str(content(r))
rm(r)

library(httr)
auth.url <- "https://api.prosper.com/v1/security/oauth/token"
client_id <- "72a5e0fce39f435ebccfc1862fd052fa"
client_secret <- "650b10b21628444fabf2ddea36daa922"
username <- "ayed.alsabawi@predacitycapital.com"
password <- "Abcd1234@"

# API Call to get the access token
r <- POST(url = auth.url,
          add_headers(.headers = c('accept'= 'application/json',
                                   'content-type'= 'application/x-www-form-urlencoded')),
          query = list(grant_type='password',
                       client_id=client_id,
                       client_secret=client_secret,
                       username=username,
                       password=password))
http_status(r)
access_token <- content(r)$access_token
authorization.header <- paste('bearer', access_token)
accounts.url <- "https://api.prosper.com/v1/accounts/prosper/"

# call to notes api using the access token
r1 <- GET(url = accounts.url,
          add_headers('accept'= 'application/json',
                      'content-type'= 'application/x-www-form-urlencoded',
                      'Authorization'= authorization.header),
          query = list(offset='25', limit=10))
http_status(r1)
content(r1)

gs_GetOpenOrders = function(twscon){
  # Check if connected to TWS
  if(!is.twsConnection(twscon))
    stop('requires twsConnection object')
  else
    con = twscon[[1]]
  
  # Send message requesting open orders
  ver = "1"
  writeBin(c(.twsOutgoingMSG$REQ_OPEN_ORDERS,ver),con)
  
  # Receive message with content of open orders
  ewr  = eWrapper()
  socketSelect(list(con),FALSE,NULL)
  msg = list()
  k = 0
  while(TRUE) {
    curmsg = readBin(con, character(), 1)
    if(length(curmsg)==0)
      break
    if (curmsg==.twsIncomingMSG$OPEN_ORDER){
      k = k+1
      msg[[k]] = processMsg(curmsg,con,ewr)
    }
    else
      processMsg(curmsg,con,ewr)
  }
  
  return(msg)
}

beta_0 <- -185679
beta_1 <- 208
beta_2 <- 100
X_1 <- 10
X_2 <- 5
epsilon <- 20
Y <- beta_0 + (beta_1 * X_1) + (beta_2 * X_2) + epsilon
E(Y|X_i) = beta_0 + beta_1 * X_1^{beta_2}

IndexStart <- 1
x <- seq(IndexStart, 6, 1)
xm <- 1

result1 <- ((x[1]-xm)^2)+((x[2]-xm)^2)+((x[3]-xm)^2)+((x[4]-xm)^2)+((x[5]-xm)^2)+((x[6]-xm)^2)
print(result1)
# [1] 55

result2 <- sum((x-xm)^2) # <- Solution
print(result2)

i <- 0:5
result3 <- sum(i^2)
print(result3)

n <- 2
frac {1}{ n }

f <- function(x){ x^2 + 2*x }
D <- function(f,delta=.000001){
  function(x){ (f(x+delta) - f(x-delta))/(2*delta)} }

plot(f, 0, 10)

sum(sqrt((2*lambda) + 1)/4 * pi)
integrate(d * omega)

###########################################
###########################################
# Resampling in R Applied Lab:
# In this applied lab, you will create some data and use cross-validation to determine the best model fit for your data. You will know the ground truth, so you can view this exercise as a validation of cross-validation techniques (see what I did there?).

# Generate some data:
# Let's generate data from a fourth order polynomial: y=??_0+??_1 x+??_2 x^2+??_3 x^3+??_4 x^4+??.
# Here is some R code to help:

N=1500
# sample size

Beta_true <-  matrix(c(0.2,-.01,.3,-.005))
# coefficient vector

x0 <- array(1,c(N,1))
# intercept is separate

x1 <- c(runif(N,-2,2))
# generate N uniform random observations between -2,2

x2 <- x1^2
x3 <- x1^3
x4 <- x1^4
X <- cbind(x1,x2,x3,x4)
# X is the concatenation of 4 column vectors

y <- x0+X%*%beta_true + c(rnorm(N)*1.5)
# y is generated from a 4th order polynomial with normally distributed errors.

Data <- data.frame(cbind(y,x1))
# creates a data frame from the "observed" covariates y and x

colnames(Data) <- c('y','X')
# label the columns of the dataframe

# Visualize the data. Use a plotting tool (library ggplot2 should help) to look at the relationship between y and x1.
# Split the data into two parts. The first part will be used for the train and validation set. We will use the second part as a test set, so that we can test the model after CV has picked the best one.
# Use k-Fold Cross-Validation (CV) to examine 8 models. Each model will be an nth polynomial of x where n is the number of the model. In other words, the first model will be a linear model; the second model will be a quadratic. The third a cubic, and so on. You will need the library boot and the function cv.glm() for this exercise. Set the seed to 100. Use k=5.
# Test time. Generate a plot of the above selected model's prediction on the test data with the true relationship (we know this because we generated the data).
#####################################################
#####################################################

library(readxl)
library(magrittr)
library(leaflet)
library(maps)
map <- read_excel("Insurance.xlsx")

# Cartography
# http://rstudio.github.io/leaflet/
# a map with the default DSM tile layer
m <- leaflet() %>% setView(lng=-71.0589, lat=42.3601, zoom=12)
m %>% addTiles()

##################################################
##################################################
##
## 49) Mandelbrot Set
##
##################################################
##################################################

z <- 10
zn+1 <- zn2 + c

# mandelbrot_naive.R

# mandelbrot_vectorized.R
# Myles Harrison
# http://www.everydayanalytics.ca

# parameters
cols <- colorRampPalette(c("blue","yellow","red","black"))(11)
xmin <- -2
xmax <- 2
nx <- 500
ymin <- -1.5
ymax <- 1.5
ny <- 500
n <- 200

# 2nd parameters
cols <- colorRampPalette(c("blue","yellow","red","green"))(11)
xmin <- -0.5
xmax <- 0.5
nx <- 800
ymin <- -0.5
ymax <- 0.5
ny <- 1000
n <- 400

# 3rd parameters
cols <- colorRampPalette(c("blue","yellow","red","green"))(5)
xmin <- -0.5
xmax <- 0.5
nx <- 1000
ymin <- -0.25
ymax <- 0.25
ny <- 1500
n <- 400

# variables
x <- seq(xmin, xmax, length.out=nx)
y <- seq(ymin, ymax, length.out=ny)
c <- outer(x,y*1i,FUN="+")
z <- matrix(0.0, nrow=length(x), ncol=length(y))
k <- matrix(0.0, nrow=length(x), ncol=length(y))

for (rep in 1:n) { 
  print(rep)
  index <- which(Mod(z) < 2)
  z[index] <- z[index]^2 + c[index]
  k[index] <- k[index] + 1
}

image(x,y,k, col=cols)
###################################

for (a in 1:3){
  for (b in 1:3){
    print (c(a,b))
    if (b == 2){
      break
    }
  }
}

out <- c()

for(i in 10000:20000){
  if(i %% 1234 == 0) { out <- c(out, i) }
}
###################################

##################################################
##################################################
##
## 50) HyperGeometric Distribution
##
##################################################
##################################################

# https://rpubs.com/alxfed/228479
# k balls # taken without replacement from an urn with
# m white balls and n black balls # (all in all- m+n)
# x or q (from the interval [0 - k] )
# is the number of white balls in the sample
# m        n       m+n
# P( x, k, m, n) = ( ) * ( )/ ( ) x k-x k

library(ggplot2)
m <- 7 ; n <- 3
k <- 10
x <- c(0:10)
y <- dhyper(x, m, n, k, log = FALSE)
qplot(x, y, color = I("red"), 
      size = I(2), alpha = I(1/2), geom = c("point"))

standardDeviation_X = sd(x)

##################################################
##################################################
##
## 51) Quantitative Data Analysis
##
##################################################
##################################################

# Reference
# https://rpubs.com/dgolicher/referendum

# The assignment should have no more than 1,000 words.
# To count words in an R Markdown document you can use this
# add in. First, check you have the devtools package installed.
# If you are a Windows user, you may also have to install
# R Tools. Once this is done, you can run:

devtools::install_github("benmarwick/wordcountaddin",
                         type = "source", dependencies = TRUE)

# Working Directory
setwd("C:/Users/johna/Dropbox/Programming/CorrelationAnalysis/QuantitativeDataAnalysis")
getwd()

# Required Packages
library(ggplot2)

# Data Import
d <- read.csv("lisbon-treaty-2-data.csv")

# Exploratory Data Analysis

# What does the dataset refer to? Why was it collected?
# How was it collected? What was the context?

# According to the data, how many people voted
# In Favour of the Treaty of Lisbon in the referendum held in October 2009,
# and how many voted against Against?
# Present a table which shows numbers and percentages.
# Present an appropriate plot.

# What was the average age of people who voted
# In Favour and people who voted Against.
# Plot the distribution of age for both the
# In Favour and Against voters on the same plot.

# Age vs hhold
g1 <- ggplot(d,aes(x=age,y=hhold)) +
  geom_point(aes(col=age)) +
  scale_x_log10() +
  geom_smooth(method=lm) +
  labs(x="Age, log scale",y="hhold")

g1

g1 +
  facet_wrap("sector")

# Plot the percentage of people voting
# In Favour and Against for each socio-economic class.

g0 <- ggplot(d,aes(x=permig,y=Pct_Leave))
g1 <- g0+geom_point(aes(col=win))+geom_smooth(method=lm)
g1 <- g1+labs(x="Percent net migration",y="Percentage voting leave")
g1 <- g1+scale_x_log10()

# How did the proportion voting In Favour and Against
# vary by education level?

g2 <- ggplot(d,aes(x=work,y=hhold)) +
  geom_point(aes(col=work)) +
  geom_smooth(method=lm) +
  labs(x="Work",y="hhold") +
  scale_x_log10()

g2 +
  facet_wrap("sector")

# Using a plot, show how the proportion voting
# In Favour and Against varied by how much knowledge
# a person reported they had about the European Union.
# What does that pattern show?

mig <- melt(dd,id="sector",m=c("MigOut","MigIn"))
mig <- cast(mig,sector~variable,sum)
mig$Percent_outmigration <- round(100*mig$MigOut/mig$MigIn,0)
mig

# Is there a relationship between how much knowledge a person
# thinks they have about the EU and whether they think Switzerland
# is a member of the EU? Show this using a plot and describe what,
# if any, relationship there is.

g0 <- ggplot(dd,aes(x=POver40,y=Pct_Leave))
g1 <- g0+geom_point(aes(col=win))
g1 <- g1 +
  labs(x="Percentage of voting age population aged 40 or more",
       y="Percentage voting leave")
g1 +
  geom_smooth(aes(x=POver40,y=Pct_Leave),method="loess")

g1 +
  geom_smooth(method=lm) +
  facet_wrap("sector")

g0 <- ggplot(dd,aes(x=POver40,y=Pct_Turnout))

g1 <- g0 +
  geom_point(aes(color=win)) +
  geom_smooth(method="lm")

g1 <- g1 +
  labs(x="Percentage of voting age population aged 40 or more",
       y="Percent turnout")
g1

g1 +
  geom_smooth(method=lm) +
  facet_wrap("sector")

g0 <- ggplot(dd,aes(x=Pct_Turnout,y=Pct_Leave))

g1 <- g0 +
  geom_point(aes(color=win))+geom_smooth(method="lm")

g1 <- g1 +
  labs(x="Percent turnout",y="Percent voting leave")

g1

mod <- lm(Pct_Leave~Pct_Turnout+POver40,data=Eng)
summary(mod)

library(RODBC)
con <- odbcConnect("elections")
odbcQuery(con,"drop table england_data")

sqlSave(con,Eng,"england_data",safer=FALSE)
query <- "drop table referendum;
create table referendum as
select e.*,geom from 
england_data e,
local_authorities l
where e.area_code = l.code"
odbcQuery(con,query)

ge < read.csv("general_election.csv")
ge <- merge(ge,dd,by.x="code",by.y="Area_Code")

g0 <- ggplot(ge,aes(x=ukip,y=leave))
g1 <- g0+geom_point()
g1 <- g1+geom_smooth(method="loess")
g1 <- g1+labs(x="Percent voting for UKIP",y="Percent voting leave")
g1

g1 +
  facet_wrap("sector")

##################################################
##################################################
##
## 52) Crypto Markets Analysis
##
##################################################
##################################################

# We have a Dataset (csv file) with around 950k data entries.
# This needs to be organized and have filters to choose between
# different symbols and dates. Once this can be filtered we require
# that it can automatically calculate the mean, standard deviation,
# Bollinger bands, highs & lows, moving average, regression analysis
# of the given period and symbol (cryptocurrency). We want to be able
# to plot these into graphs once the data is organized and analysed
# as we are planning to write a report about this analysis.

# Set Working Directory
setwd("C:/Users/johna/Dropbox/Programming/StockTrading/price_data")
getwd()

# Required Packages
library(xts)
library(zoo)
library(quantmod) # data, plotting, quant modelling
library(PerformanceAnalytics) # performance and risk management
library(TTR)
library(forecast)
library(knitr) # formatting tables

# Import Data
crypto_markets <- read.csv("crypto-markets.csv")

# Format date field
crypto_markets$date <- as.Date(crypto_markets$date, format="%Y-%m-%d")

# organized with filters to choose between different symbols and dates
crypto_markets_bitcoin <- crypto_markets[crypto_markets$slug == "bitcoin",]

# Time series for open
bitcoin_time_series <- ts(crypto_markets_bitcoin$open, frequency=250)

plot.ts(bitcoin_time_series)

# automatically calculate the mean, standard deviation
mean(bitcoin_time_series)
sd(bitcoin_time_series)

# Bollinger bands, highs & lows, moving average
bitcoin_xts <- as.xts(bitcoin_time_series,dateFormat='Date')
chartSeries(bitcoin_xts, theme = chartTheme('white'),
            TA=c(addVo(), addSMA(n=200,col = 'blue'),
                 addSMA(n=50, col='red'),addSMA(n=22, co ='green'),
                 addBBands(), addMACD()))

# regression analysis of the given period and symbol (cryptocurrency)
fit <- HoltWinters(bitcoin_time_series)
plot(fit, main="Bitcoin Holt-Winters Filtering, Models Level + Trend + Seasonal Components")

# predict next twenty future values
Bitcoin_Forecast <- forecast(fit, 20)
plot(Bitcoin_Forecast,
     main="Bitcoin Price Forecast (20 Days) from Holt-Winters Filtering")

##################################################
##################################################
##
## 54) RMarkdown Template
##
##################################################
##################################################

---
title: "<center>RMarkdown Template</center>"
author: "<center>ContextBase, http://contextbase.github.io</center>"
date: "<center>February 18, 2021</center>"
output: html_document
subtitle: <center>All programming by John Akwei, ECMp ERMp Data Scientist</center>
---
  
<br />
<br />
  
<center><img src="contextbaselogo.jpg" alt="ContextBase Logo"  width="440" height="240"></center>
  
<br />
<br />
  
## Table of Contents  
Synopsis  

Section 1a - Working Directory, Required Packages, and Session Information  
Section 1b - Loading Stock Ticker Data  
Section 1c - Organize with filters to choose between different symbols and dates  

Section 2a - Exploratory Data Analysis  
Section 2b - Calculate Mean and Standard Deviation  
Section 2c - Bollinger bands, highs & lows, moving average  
Section 2d - Regression analysis of the given period and symbol (cryptocurrency)  

Section 3 - Conclusions  

<br />
<br />
  
<h3 align="center" style="color:blue;font-weight:bold;">Synopsis</h3>  
We have a Dataset (csv file) with around 950k data entries.
This needs to be organized and have filters to choose between
different symbols and dates. Once this can be filtered we require
that it can automatically calculate the mean, standard deviation,
Bollinger bands, highs & lows, moving average, regression analysis
of the given period and symbol (cryptocurrency). We want to be able
to plot these into graphs once the data is organized and analysed
as we are planning to write a report about this analysis.    

<br />
<br />
  
<h3 align="center" style="color:blue;font-weight:bold;">Section 1a - Working Directory, Required Packages, and Session Information  </h3>  
```{r, message=F, warning=F, echo=F}
# setwd("C:/Users/johna/Dropbox/Programming/StockTrading/price_data")

print("Working Directory = C:/Users/johna/Dropbox/Programming/StockTrading/price_data")

crypto_markets <- read.csv("crypto-markets.csv")

# Load Required Packages
library(xts)
library(zoo)
library(quantmod)
library(PerformanceAnalytics)
library(TTR)
library(forecast)
library(knitr)

PackageTable <- data.frame(matrix(nrow=1, ncol=1))
rownames(PackageTable) <- "Required Packages"
colnames(PackageTable) <- "List of Required Packages"
PackageTable[1,] <- paste("'xts'", "'zoo'", "'ggplot2'",
                          "'quantmod'", "'PerformanceAnalytics'",
                          "'TTR'", "'forecast'","'knitr'")
kable(PackageTable)

session <- sessionInfo()

SessionTable <- data.frame(matrix(nrow=5, ncol=1))
rownames(SessionTable) <- c("R Version", "Platform", "Running",
                            "RStudio Citation","RStudio Version")
colnames(SessionTable) <- "Session Information"
SessionTable[1,] <- session$R.version$version.string
SessionTable[2,] <- session$platform
SessionTable[3,] <- session$running
SessionTable[4,] <- "RStudio: Integrated Development for R."
SessionTable[5,] <- "1.0.44"
kable(SessionTable)
```

<br />
<br />
  
<h3 align="center" style="color:blue;font-weight:bold;">Section 1b - Importing Stock Price Data</h3>  
```{r, message=F, warning=F}
# Format date field
crypto_markets <- read.csv("crypto-markets.csv")

crypto_markets$date <- as.Date(crypto_markets$date, format="%Y-%m-%d")
```

<br />
<br />
  
<h3 align="center" style="color:blue;font-weight:bold;">Section 1c - Organize with filters to choose between different symbols and dates</h3>
```{r, message=F, warning=F}
crypto_markets_bitcoin <- crypto_markets[crypto_markets$slug == "bitcoin",]
```

<br />
<br />
  
<h3 align="center" style="color:blue;font-weight:bold;">Section 2a - Exploratory Data Analysis</h3>
```{r, message=F, warning=F, echo=F}
kable(crypto_markets_bitcoin[1:5,], caption="First 5 Data Samples")

# Time series for open
bitcoin_time_series <- ts(crypto_markets_bitcoin$open, frequency=250)

plot.ts(bitcoin_time_series, main="Plot of Historical Open Data")
```

<br />
<br />
  
<h3 align="center" style="color:blue;font-weight:bold;">Section 2b - Automatically Calculate Mean and Standard Deviation </h3>  
```{r, message=F, warning=F, echo=F}
kable(mean(bitcoin_time_series), caption = "Mean of Bitcoin Time Series")
kable(sd(bitcoin_time_series), caption = "Standard Deviation of Bitcoin Time Series")
```

<br />
<br />
  
<h3 align="center" style="color:blue;font-weight:bold;">Section 2c - Bollinger bands, highs & lows, moving average</h3>  
```{r, message=F, warning=F, echo=F}
bitcoin_xts <- as.xts(bitcoin_time_series,dateFormat='Date')
chartSeries(bitcoin_xts, theme = chartTheme('white'),
            TA=c(addVo(), addSMA(n=200,col = 'blue'),
                 addSMA(n=50,col = 'red'),addSMA(n=22,col = 'green'),
                 addBBands(), addMACD()))
```

<br />
<br />
  
<h3 align="center" style="color:blue;font-weight:bold;">Section 2d - Regression Analysis of the given period and symbol (cryptocurrency)</h3>  
```{r warning=F, message=F, echo=F}
fit <- HoltWinters(bitcoin_time_series)
plot(fit, main="Bitcoin Holt-Winters Filtering, Models Level + Trend + Seasonal Components")

# predict next twenty future values
Bitcoin_Forecast <- forecast(fit, 20)
plot(Bitcoin_Forecast, main="Bitcoin Price Forecast (20 Days) from Holt-Winters Filtering")
```

<br />
<br />
  
<h3 align="center" style="color:blue;font-weight:bold;">Section 3 - Conclusions</h3> 
The above document has organized and filtered the Cryptomarkets dataset, to choose between different symbols and dates. The dataset has been filtered, and the mean and standard deviation automatically calculated. Bollinger bands, highs & lows, moving average, and regression analysis of the given period and symbol have also been calculated. Graphs of the data have been organized and analysed to facilitate the writing of a report derived from this analysis.

