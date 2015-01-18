## Exploratory Data Plotting - Course Project 1
## Plot1.R

## Setting working directory and required packages
setwd("C:/Users/johnakwei/GitHub/Exploratory_Data_Analysis/Course Project")
if (!require("data.table")) { install.packages("data.table"); require("data.table") }
if (!require("lubridate")) { install.packages("lubridate"); require("lubridate") }

## Data download and extraction
unextracted <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
extracted  <- "exdata-data-household_power_consumption"
dataLocation <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists(unextracted)) { download.file(dataLocation, unextracted) }
if (!file.exists(extracted)) { unzip(unextracted) }

## Setting data variables
ScanData <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
FinalData <- ScanData[ScanData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(FinalData$Date, FinalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
FinalData <- cbind(SetTime, FinalData)

## Create Plot 1
png(file="plot1.png", width=480, height=480)
hist(FinalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()