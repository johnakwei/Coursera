## Exploratory Data Plotting - Course Project 1
## Plot4.R

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
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")

## Create Plot 4
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(FinalData$SetTime, FinalData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(FinalData$SetTime, FinalData$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(FinalData$SetTime, FinalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(FinalData$SetTime, FinalData$Sub_metering_2, type="l", col="red")
lines(FinalData$SetTime, FinalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(FinalData$SetTime, FinalData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()