setwd("/Users/Fayza Iqbal/Desktop")
plotData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
plotData$Date <- as.Date(plotData$Date, "%d/%m/%Y")
plotData <- subset(plotData,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
plotData <- plotData[complete.cases(plotData),]
dateTime <- paste(plotData$Date, plotData$Time)
dateTime <- setNames(dateTime, "DateTime")
plotData <- plotData[ ,!(names(plotData) %in% c("Date","Time"))]
plotData <- cbind(dateTime, plotData)
plotData$dateTime <- as.POSIXct(dateTime)
png("plot3.png",480,480)
with(plotData, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()