data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")

head(data)
# Converting g_a_p to numeric values from factor
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
library(lubridate)

# Converting date which was factor to Date type
data$Date <- dmy(data$Date)
class(data$Date)

# Extracting records within the given range of dates
smallData <- data[data$Date >= ydm("2007-02-01") & data$Date <= ydm("2007-02-02"),]

# Creating plot on png file device
png(filename="plot1.png", width=480, height=480, units="px")
hist(smallData$Global_active_power , col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

