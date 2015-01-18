## Exploratory Data Plotting - Course Project 2
## Plot1.R - Variation in Total PM25 Emissions from All Sources, USA, 1999-2008.

## Set working directory and required packages
required <- function(wd) {
  setwd(wd)
  if (!require("data.table")) { install.packages("data.table"); require("data.table") }
  if (!require("datasets")) { install.packages("datasets"); require("datasets") }                        
  if (!require("ggplot2")) { install.packages("ggplot2"); require("ggplot2") }
}
required("C:/Users/johnakwei/Desktop/Coursera/ExploratoryDataAnalysis/CourseProject2")

## Data download and extraction
unextracted <- "exdata-data-NEI_data.zip"
extracted  <- "exdata-data-NEI_data"
dataLocation <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
if (!file.exists(unextracted)) { download.file(dataLocation, unextracted) }
if (!file.exists(extracted)) { unzip(unextracted) }

## Load Data Variables
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

## Find total PM25 emissions from all sources, US, 1999-2008
NEIdata <- aggregate(NEI[c("Emissions")], list(year=NEI$year), sum)

## Create Plot 1 - Variation in total PM25 emissions from all sources, US, 1999-2008
png(file="Plot1.png", width=600, height=480)
plot(NEIdata$year~NEIdata$Emissions, type="l", main="Variation in Total PM25 Emissions", xlab="Year", ylab="Total PM25 Emissions")
dev.off()