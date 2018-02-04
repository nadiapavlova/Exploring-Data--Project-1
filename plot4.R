# Coursera Data Science: Exploratory Data Analysis
# Course project 1: plot4
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
# Graph the plots
png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with (powercon1, {
        plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") 
        lines(DateTime, Sub_metering_2, type = "l", col = "red")
        lines(DateTime, Sub_metering_3, type = "l", col = "blue")
        legend("topright",col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
