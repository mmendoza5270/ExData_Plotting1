setwd("~/Downloads")
data <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)

subset <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#install.packages("lubridate")
library(lubridate)
subset$new_date <- cbind(dmy(subset$Date) + hms(subset$Time))

thurs <- dmy("1/2/2007") + hms("00:00:00")
fri <- dmy("2/2/2007") + hms("00:00:00")
sat <- dmy("2/2/2007") + hms("23:59:59")

png("plot2.png", width = 480, height = 480, units = "px")

plot(subset$new_date, subset$Global_active_power, type="l", xaxt = 'n', ylab="Global Active Power (kilowatts)", xlab="")
axis(side=1, at=c(thurs, fri, sat), labels=c("Thu", "Fri", "Sat"))

dev.off()