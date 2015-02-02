### "PA2_template.Rmd"
#### ---
#### author: "John Akwei"
#### date: "Thursday, January 15, 2015"
#### output: html_document
#### application: "Reproducible Research: Peer Assessment 2"

#### ---
### Analysis of Health and Economic effects of USA Storms.
### (NOAA Storm Database)
#### ---
#### Synopsis
#### Immediately after the title, there should be a synopsis which describes and
#### summarizes your analysis in at most 10 complete sentences.
in the EVTYPE variable)
#### are most harmful with respect to population health?
#### Storms and other severe weather events can cause both public health and economic problems
#### for communities and municipalities. Many severe events can result in fatalities, injuries,
#### and property damage, and preventing such outcomes to the extent possible is a key concern.
#### 
#### This project involves exploring the U.S. National Oceanic and Atmospheric Administration's
#### (NOAA) storm database. This database tracks characteristics of major storms and weather
#### events in the United States, including when and where they occur, as well as estimates of
#### any fatalities, injuries, and property damage.

#### 1)
#### Data Processing
#### Requirements of Processing
```{r}
echo=T
options(scipen = 999)
required <- function(wd) {
  setwd(wd)
  if (!require("data.table")) { install.packages("data.table"); require("data.table") }
  if (!require("plyr")) { install.packages("plyr"); require("plyr") }
  if (!require("dplyr")) { install.packages("dplyr"); require("dplyr") }
  if (!require("reshape2")) { install.packages("reshape2"); require("reshape2") }
  if (!require("xtable")) { install.packages("xtable"); require("xtable") }
  if (!require("knitr")) { install.packages("knitr"); require("knitr") }
  if (!require("ggplot2")) { install.packages("ggplot2"); require("ggplot2") }
  if (!require("R.utils")) { install.packages("R.utils"); require("R.utils") }
}
required("C:/Users/johnakwei/Desktop/Coursera/ReproducibleResearch/Week3/RepData_PeerAssessment2")
```
#### ---
#### Data download and extraction
```{r}
unextracted <- "repdata-data-StormData.csv.bz2"
extracted  <- "repdata-data-StormData.csv"
dataLocation <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
if (!file.exists(unextracted)) { download(dataLocation, unextracted, mode="wb") }
if (!file.exists(extracted)) { bunzip2(unextracted) }
```
#### ---
#### Accessing the data for processing
```{r}
StormData <- read.csv("repdata-data-StormData.csv")
```
str(StormData)
summary(StormData)
ls()
object.size(StormData)
dim(StormData)
nrow(StormData)
ncol(StormData)
head(StormData, 5)
tail(StormData, 5)
names(StormData)
head(StormData$COUNTYNAME, 5)
fix(StormData)

#### derive the year as numeric for summarizing by years
```{r}
StormData <- read.table("repdata-data-StormData.csv", sep = ",", header=T)
StormData$BGN_DATE <- strptime(StormData$BGN_DATE, format = "%m/%d/%Y 0:00:00")
StormData$FATALITIES <- as.numeric(StormData$FATALITIES)
StormData$FATALITIES <- as.numeric(StormData$INJURIES)
StormData$PROPDMG <- as.numeric(StormData$PROPDMG)
```
#### ---
#### Which types of events are most harmful with respect to population health?
```{r}
names <- c('EVTYPE', 'SUM')
fatalities <- aggregate(StormData$FATALITIES~StormData$EVTYPE, FUN=sum)
names(fatalities) <- names
fatalities <- fatalities[order(fatalities$SUM, decreasing=T), ]

injuries <- aggregate(StormData$INJURIES~StormData$EVTYPE, FUN=sum)
names(injuries) <- names
injuries <- injuries[order(injuries$SUM, decreasing=T), ]
```
#### The top 10 most offending severe weather event types for fatalities:
```{r}
head(fatalities, 25)
```
#### The top 10 most offending severe weather event types for injuries:
```{r}
head(injuries, 25)
```
#### ---
#### Plot of Types of Events with the Greatest Health Consequences
```{r}
ggplot(data = head(fatalities, 10), aes(EVTYPE, SUM)) +
  geom_bar(aes(), stat="identity") +
  xlab('Events') +
  ylab("Fatalities")

ggplot(data = head(injuries, 10), aes(EVTYPE, SUM)) +
  geom_bar(aes(), stat = "identity") +
  xlab('Events') +
  ylab("Injuries")
```
#### ---
#### Across the US, which types of events have the greatest economic consequences?
```{r}
propertyDamage <- aggregate(StormData$PROPDMG~StormData$EVTYPE, FUN=sum)
names(propertyDamage) <- names
propertyDamage <- propertyDamage[order(propertyDamage$SUM, decreasing=T), ]

cropDamage <- aggregate(StormData$CROPDMG~StormData$EVTYPE, FUN=sum)
names(cropDamage) <- names
cropDamage <- cropDamage[order(cropDamage$SUM, decreasing=T), ]
```
#### Property damage
```{r}
head(propertyDamage, 25)
```
#### Crop damage
```{r}
head(cropDamage, 25)
```
#### Plot of Types of Events with the Greatest Economic Consequences
```{r}
ggplot(data = head(propertyDamage, 10), aes(EVTYPE, SUM)) +
  geom_bar(aes(), stat="identity") +
  xlab('Events') +
  ylab("Costs")

ggplot(data = head(cropDamage, 10), aes(EVTYPE, SUM)) +
  geom_bar(aes(), stat="identity") +
  xlab('Events') +
  ylab("Costs")
```

#### Summary