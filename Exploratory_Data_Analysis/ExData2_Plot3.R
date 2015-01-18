## Exploratory Data Plotting - Course Project 2
## Plot3.R - PM25 Decrease By Type, Baltimore, Md, 1999-2008.

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

## Find PM25 emissions by type, Baltimore, Md, 1999-2008
PlotData <- NEI[which(NEI$fips==24510), ]

## Create Plot 3 - PM25 decrease by type, Baltimore, 1999-2008
png('Plot3Improved.png', width=720, height=480)
ggplot(PlotData, aes(year, Emissions, color=type)) + stat_summary(geom="line", fun.y="sum") + 
  xlab("Year") + ylab("Total PM25 Emissions") + ggtitle("Comparative PM25 Emissions Decrease, Baltimore, 1999-2008")
dev.off()