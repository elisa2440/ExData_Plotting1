leer <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subDates <- DT[, DT$Date == "1/2/2007" | DT$Date == "2/2/2007"]
data <- DT[subDates]

dates <- as.character(data$Date)
times <- as.character(data$Time)
x <- paste(dates, times)
datetimes <- strptime(x, "%d/%m/%Y %H:%M:%S")

metering_1 <- as.numeric(levels(data$Sub_metering_1)[data$Sub_metering_1])
metering_2 <- as.numeric(levels(data$Sub_metering_2)[data$Sub_metering_2])
metering_3 <- data$Sub_metering_3

png("plot3.png")
plot(datetimes, metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetimes, metering_2, col = "red")
lines(datetimes, metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "-", col = c("black", "red", "blue"), bty = "n")
dev.off()