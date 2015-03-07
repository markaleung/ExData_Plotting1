data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data[,1], data[,2]), format = "%Y-%m-%d %H:%M:%S")
data[,3:8] <- as.data.frame(sapply(data[,3:8], function(x) as.numeric(as.character(x))))

# Plot 4
png(filename = "plot4.png")
par(mfcol = c(2,2))
with(data, {
	plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
	
	plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
	lines(Time, Sub_metering_2, col = "Red")
	lines(Time, Sub_metering_3, col = "Blue")
	legend(x = "topright", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2)
	
	plot(Time, Voltage, type = "l", xlab = "date/time", ylab = "Voltage")
	plot(Time, Global_reactive_power, type = "l", xlab = "date/time", ylab = "Global_reactive_power")	
})
dev.off()
