data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data[,1], data[,2]), format = "%Y-%m-%d %H:%M:%S")
data[,3:8] <- as.data.frame(sapply(data[,3:8], function(x) as.numeric(as.character(x))))

# Plot 1
png(filename = "plot1.png")
hist(data$Global_active_power, main = "Global Active Power", col = "Red", xlab = "Global Active Power (kilowatts)")
dev.off()

