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

# Converting g_r_p to numeric values from factor
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

# Converting voltage to numeric values from factor
data$Voltage <- as.numeric(as.character(data$Voltage))

library(lubridate)
# Converting date which was factor to Date type
data$Date <- dmy(data$Date)
class(data$Date)

# Extracting records within the given range of dates
smallData <- data[data$Date >= ymd("2007-02-01") & data$Date <= ymd("2007-02-02"),]

# Creating plot on png file device
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2), mar=c(4,4.5,1,1))


## Plot 1
plot(dateTimes, smallData$Global_active_power, type="l", ylab="Global Active Power", xlab="",
     cex.lab=0.8, cex.axis=0.8)

## Plot 2
plot(dateTimes, smallData$Voltage, type="l", ylab="Voltage", xlab="datetime", cex.lab=0.8, cex.axis=0.8)

# This merges the date and time into a single variable as dateTime(Careful with the formats)
dateTimes <- ymd_hms(paste(smallData$Date, smallData$Time))

## Plot 3
with(smallData,{
        plot(dateTimes, smallData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", 
             cex.lab=0.8, cex.axis=0.8)
        lines(dateTimes, smallData$Sub_metering_2, type="l", col="red")
        lines(dateTimes, smallData$Sub_metering_3, type="l", col="blue")
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1), cex=0.7, col=c("black","red","blue"))
})

## Plot 4
plot(dateTimes, smallData$Global_reactive_power, type="l", ylab="Global Reactive Power", 
     xlab="datetime", cex.lab=0.8, cex.axis=0.8)


dev.off()




