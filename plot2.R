data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data[,1], data[,2]), format = "%Y-%m-%d %H:%M:%S")
data[,3:8] <- as.data.frame(sapply(data[,3:8], function(x) as.numeric(as.character(x))))

# Plot 2
png(filename = "plot2.png")
with(data, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
