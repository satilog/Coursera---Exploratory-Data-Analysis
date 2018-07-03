data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")

head(data)
# Converting g_a_p to numeric values from factor
class(data$Global_active_power)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
library(lubridate)

# Converting date which was factor to Date type
data$Date <- dmy(data$Date)
class(data$Date)

# Extracting records within the given range of dates
smallData <- data[data$Date >= ymd("2007-02-01") & data$Date <= ymd("2007-02-02"),]

# Creating plot on png file device
png(filename="plot2.png", width=480, height=480, units="px")

# This merges the date and time into a single variable as dateTime(Careful with the formats)
dateTimes <- ymd_hms(paste(smallData$Date, smallData$Time))

plot(dateTimes, smallData$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)")

dev.off()




