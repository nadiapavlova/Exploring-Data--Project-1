# Coursera Data Science: Exploratory Data Analysis
# Course project 1: plot2
# load the data 
rm(list = ls())
if(!file.exists("data")) {dir.create("data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./data/c4project1.zip", method = "curl")
unzip(zipfile = "./data/c4project1.zip",exdir = "./data")
powercon <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
str(powercon)
# Subset the data by the the dates below
powercon1 <- powercon[powercon$Date %in% c("1/2/2007","2/2/2007") ,]
# Create a new date and time variable
powercon1$DateTime <- strptime(paste(powercon1$Date, powercon1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# Graph a plot
with (powercon1, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
