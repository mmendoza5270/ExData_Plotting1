setwd("~/Downloads")
data <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)

subset <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

png("plot1.png", width = 480, height = 480, units = "px")

hist(subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()
