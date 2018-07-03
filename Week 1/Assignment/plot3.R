data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")

names(data)
head(data)
# Converting g_a_p to numeric values from factor
class(data$Global_active_power)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Converting sub metering values to numeric from factor
class(data$Sub_metering_1)
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))


library(lubridate)
# Converting date which was factor to Date type
data$Date <- dmy(data$Date)
class(data$Date)

# Extracting records within the given range of dates
smallData <- data[data$Date >= ymd("2007-02-01") & data$Date <= ymd("2007-02-02"),]

# Creating plot on png file device
png(filename="plot3.png", width=480, height=480, units="px")

# This merges the date and time into a single variable as dateTime(Careful with the formats)
dateTimes <- ymd_hms(paste(smallData$Date, smallData$Time))


with(smallData,{
        plot(dateTimes, smallData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
        lines(dateTimes, smallData$Sub_metering_2, type="l", col="red")
        lines(dateTimes, smallData$Sub_metering_3, type="l", col="blue")
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1), cex=0.7, col=c("black","red","blue"))
})

dev.off()




