## Exploratory Data Plotting - Course Project 2
## Plot6.R - Improved - Comparison of Total PM25 Emissions from motor vehicles(Baltimore), with motor vehicles(Los Angeles County), 1999-2008.

# Set working directory and required packages
required <- function(wd) {
  setwd(wd)
  if (!require("data.table")) { install.packages("data.table"); require("data.table") }
  if (!require("datasets")) { install.packages("datasets"); require("datasets") }
  if (!require("ggplot2")) { install.packages("ggplot2"); require("ggplot2") }
}
required("C:/Users/johnakwei/Desktop/Coursera/ExploratoryDataAnalysis/CourseProject2")

# Data download and extraction
unextracted <- "exdata-data-NEI_data.zip"
extracted  <- "exdata-data-NEI_data"
dataLocation <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
if (!file.exists(unextracted)) { download.file(dataLocation, unextracted) }
if (!file.exists(extracted)) { unzip(unextracted) }

# Load Data Variables
# NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
# SRC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Find PM25 emissions from Baltimore motor vehicles
PlotBaltimore <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
PlotBaltimore$city <- "Baltimore City"

# Find PM25 emissions from LA motor vehicles
PlotLA <- NEI[NEI$fips=="06037" & NEI$type=="ON-ROAD",]
PlotLA$city <- "Los Angeles County"

# Combine data
PlotData <- rbind(PlotBaltimore, PlotLA)

# Create Plot 6 - Comparison of vehicle PM25 emissions, Baltimore - LA, 1999-2008
png('Plot6Improved.png', width=720, height=640)
ggplot(PlotData, aes(year, Emissions, color=city)) + stat_summary(geom="line", fun.y="sum") + 
  xlab("Year") + ylab("Total PM25 Emissions") + ggtitle("Total PM25 Emissions from Baltimore & LA Vehicles, 1999-2008")
dev.off()