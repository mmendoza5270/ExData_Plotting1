setwd("~/Downloads")
data <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)

subset <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

thurs <- dmy("1/2/2007") + hms("00:00:00")
fri <- dmy("2/2/2007") + hms("00:00:00")
sat <- dmy("2/2/2007") + hms("23:59:59")

png("plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

#top left plot
plot(subset$new_date, subset$Global_active_power, type="l", xaxt = 'n', ylab="Global Active Power", xlab="")
axis(side=1, at=c(thurs, fri, sat), labels=c("Thu", "Fri", "Sat"))

#top right plot
plot(subset$new_date, subset$Voltage, type="l", xaxt = 'n', ylab="Voltage", xlab="datetime")
axis(side=1, at=c(thurs, fri, sat), labels=c("Thu", "Fri", "Sat"))

#bottom left plot
plot(subset$new_date, subset$Sub_metering_1, type="l", xaxt = 'n', ylab="Energy sub metering", xlab="")
lines(subset$new_date, subset$Sub_metering_2, col="red")
lines(subset$new_date, subset$Sub_metering_3, col="blue")
axis(side=1, at=c(thurs, fri, sat), labels=c("Thu", "Fri", "Sat"))
legend("topright",lty=1, col=c("black","red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

#bottom right plot
plot(subset$new_date, subset$Global_reactive_power, type="l", xaxt = 'n', ylab="Global_reactive_power", xlab="datetime")
axis(side=1, at=c(thurs, fri, sat), labels=c("Thu", "Fri", "Sat"))

dev.off()