## Exploratory Data Plotting - Course Project 2
## Plot2.R - Variation in Total PM25 Emissions from All Sources, Baltimore, Maryland, 1999-2008.
## with ggplot2

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

## Find total PM25 emissions from all sources, Baltimore, 1999-2008
CityID <- NEI[which(NEI$fips==24510), ]
PlotData <- aggregate(Emissions~year, CityID, sum)

## Create Plot 2 - Variation in total PM25 emissions from all sources, Baltimore, 1999-2008
png('Plot2.png', width=720, height=480)
ggplot(PlotData, aes(year, Emissions)) + stat_summary(geom="line", fun.y="sum") + 
  xlab("Year") + ylab("Total PM25 Emissions") + ggtitle("Variation in Total PM25 Emissions (Baltimore, Maryland)")
dev.off()