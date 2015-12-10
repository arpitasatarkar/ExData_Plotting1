
## Set working directory

setwd("C:/Users/satarar/Documents/Exploratory Data Analysis/data")

## Removes all the variables

rm(list = ls())

## Initiating required libraries

library(data.table)
library(lubridate)
library(chron)

## Reading the data from the household_power_consumption file

powerconsumption <- read.table("household_power_consumption.txt",header=TRUE, sep=";",stringsAsFactors=FALSE)

## Converting Date column into Date Class

powerconsumption[,1] <- as.Date(powerconsumption$Date,"%d/%m/%Y")

## Converting Time column into Time Class

powerconsumption[,2] <- chron(times=powerconsumption$Time)

## Converting rest of the columns into Numeric Class

cols <- c(3:9) 

powerconsumption[,cols] <- apply(powerconsumption[,cols], 2, function(x) as.numeric(as.character(x)))

## Extracting Data for 2 days of Feb

powerconsumptionFeb <- subset(powerconsumption, powerconsumption$Date=="2007-02-01" | powerconsumption$Date=="2007-02-02")

## Plotting histogram and copying it to Plot1.png file

with(powerconsumptionFeb,hist(Global_active_power,main = "Global Active Power", 
                              xlab = "Global Active Power (kilowatts)", col = "red"))

dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()

