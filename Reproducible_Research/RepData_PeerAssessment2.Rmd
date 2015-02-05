# Analysis of Health and Economic Effects of USA Weather Events  
## (NOAA Storm Database)  


#### John Akwei, ECMp ERMp  
#### January 21, 2015  

### Synopsis  

This project examines the U.S. National Oceanic and Atmospheric
Administration's (NOAA) storm database, in order to determine the
effects of major weather events on the population of the USA, in terms of
health, (fatalities and injuries), and property damage, (property and crops).  

By applying statistical processing in the R programming language, relevant
information is extracted from the NOAA Storm Database that determines the
exact weather events requiring development of resources, and strategies,
to mitigate effects on the health, and property, of US citizens.
  
## Data Processing  

#### Requirements of Processing  
```{r}
echo=T
options(scipen=999)
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
suppressMessages(required("C:/Users/johnakwei/Desktop/Coursera/ReproducibleResearch/Week3/RepData_PeerAssessment2"))
```

#### Data download and extraction  
```{r}
unextracted <- "repdata-data-StormData.csv.bz2"
extracted  <- "repdata-data-StormData.csv"
dataLocation <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
if (!file.exists(unextracted)) { download(dataLocation, unextracted, mode="wb") }
if (!file.exists(extracted)) { bunzip2(unextracted) }
```

#### Formatting data variables for processing  
```{r}
StormData <- read.table("repdata-data-StormData.csv", sep=",", header=T)
StormData$BGN_DATE <- strptime(StormData$BGN_DATE, format="%m/%d/%Y 0:00:00")
StormData$FATALITIES <- as.numeric(StormData$FATALITIES)
StormData$INJURIES <- as.numeric(StormData$INJURIES)
StormData$PROPDMG <- as.numeric(StormData$PROPDMG)
```

## Results  

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

#### Major weather events for fatalities:  
```{r}
head(fatalities, 8)
```

#### Major weather events for injuries:  
```{r}
head(injuries, 8)
```

#### Graphs of Events with the Greatest Health Consequences:  
```{r}
ggplot(data=head(fatalities, 6), aes(EVTYPE, SUM)) +
  geom_bar(aes(), stat="identity", fill=rainbow(6)) +
  ggtitle("Graph of Major Weather Events Causing Fatalities") +
  xlab('Events') +
  ylab("Fatalities")

ggplot(data=head(injuries, 6), aes(EVTYPE, SUM)) +
  geom_bar(aes(), stat="identity", fill=rainbow(6)) +
  ggtitle("Graph of Major Weather Events Causing Injuries") +
  xlab('Events') +
  ylab("Injuries")
```

#### Across the US, which types of events have the greatest economic consequences?  
```{r}
propertyDamage <- aggregate(StormData$PROPDMG~StormData$EVTYPE, FUN=sum)
names(propertyDamage) <- names
propertyDamage <- propertyDamage[order(propertyDamage$SUM, decreasing=T), ]

cropDamage <- aggregate(StormData$CROPDMG~StormData$EVTYPE, FUN=sum)
names(cropDamage) <- names
cropDamage <- cropDamage[order(cropDamage$SUM, decreasing=T), ]
```

#### Major weather events for Property damage:  
```{r}
head(propertyDamage, 8)
```
#### Major weather events for Crop damage:  
```{r}
head(cropDamage, 8)
```

#### Graph of Events with the Greatest Economic Consequences:  
```{r}
econDamage <- merge(propertyDamage, cropDamage, by="EVTYPE")
names(econDamage) <- names
econDamage <- econDamage[order(econDamage$SUM, decreasing=T), ]

ggplot(data=head(econDamage, 8), aes(EVTYPE, SUM)) +
  geom_bar(aes(), stat="identity", fill=rainbow(8)) +
  coord_flip() +
  ggtitle("Graph: Weather Events, Property/Crop Damage") +
  xlab('Events') +
  ylab("Costs")
```

## Summary  

The data extracted from the NOAA Storm Database positively determines that
the weather events requiring counter-strategies, with the objective of
mitigatation of effects on US citizen health, are Tornadoes,
Storm-Force Winds, Floods, Excessive Heat, and Lightning.  

The weather events damaging Property the most severely are
Tornadoes, Flash Floods, Storm Force Winds, and Non-Flash Flooding.  

The weather events severely damaging Crops in the USA are
Hail, Flash Floods, Regular Floods, Storm Force Winds, and Tornadoes.  
