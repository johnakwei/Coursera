## Exploratory Data Plotting - Course Project 2
## Plot5.R - Variation in Total PM25 Emissions from Motor Vehicles, Baltimore, Md, 1999-2008.

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
SRC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

## Find PM25 emissions from Baltimore motor vehicles
PlotBaltimore=NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
PlotBaltimore$city <- "Baltimore City"

## Create Plot 5 - Total PM25 emissions from motor vehicles, Baltimore, 1999-2008
png('Plot5Improved.png', width=720, height=480)
ggplot(PlotBaltimore, aes(year, Emissions)) + stat_summary(geom="line", fun.y="sum") + 
  xlab("Year") + ylab("Total PM25 Emissions") + ggtitle("Total PM25 Emissions from Motor Vehicles, Baltimore, 1999-2008")
dev.off()