##This is for the project 1 of Exploratory Data Analysis

## read the dataset into data

##Problem with the following line is not to have enough control
## data <- read.csv2("household_power_consumption.txt")

library("methods")
data <- read.table("household_power_consumption.txt", head= T, sep =";", quote="",na.strings = "?", colClasses=c(Date="character", Time= "character", rep("numeric",7)))

goodData <- data
goodData[,"Date"] <- as.Date(data[,"Date"],format="%d/%m/%Y")
goodData[,"Time"] <-  as.POSIXct(format(paste(as.character(goodData[,"Date"]),goodData[,"Time"],  sep=" ")),format="%Y-%m-%d %H:%M:%S")

subset <- goodData[(as.character(goodData$Date)=="2007-02-01") | (as.character(goodData$Date)== "2007-02-02"),] 

hist(subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")

dev.off()
