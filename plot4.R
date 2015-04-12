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



par(mfrow = c(2, 2), mar=c(4,4,1,1))

with(subset, {
    ## topleft
    plot(x=subset$Time , y=subset$Global_active_power,type='n',xlab="", ylab="Global Active Power (kilowatts)")
    
    lines(x=subset$Time , y=subset$Global_active_power)
    
    ## topright
    plot(x=Time , y=Voltage, type='n',xlab="datetime", ylab="Voltage")
    
    lines(x=Time , y=Voltage)
    
    ## bottomleft
    
    with(subset, plot(x= Time, y=Sub_metering_1, type='n', main = "",xlab="",ylab="Energy sub metering"))
    
    with(subset, lines(x=Time, y=Sub_metering_1))
    
    with(subset, points(x=Time, y=Sub_metering_2,type='n'))
    with(subset, lines(x=Time, y=Sub_metering_2, col="red"))
    
    with(subset, points(x=Time, y=Sub_metering_3,type='n'))
    with(subset, lines(x=Time, y=Sub_metering_3, col="blue"))
    
    legend("topright", pch = '_', col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex=0.75)
    
    
    ## bottom right
    plot(x=Time , y=Global_reactive_power, type='n',xlab="datetime", ylab="Global_reactive_power")
    
    lines(x=Time , y=Global_reactive_power)
    
})
    
    
dev.copy(png, file="plot4.png")

dev.off()