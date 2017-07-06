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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
png("plot1.png", 480, 480)
hist(plotData$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()