leer <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subDates <- DT[, DT$Date == "1/2/2007" | DT$Date == "2/2/2007"]
data <- DT[subDates]

dates <- as.character(data$Date)
times <- as.character(data$Time)
x <- paste(dates, times)
datetimes <- strptime(x, "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow = c(2,2))
plot(datetimes, as.numeric(levels(data$Global_active_power)[data$Global_active_power]), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(datetimes, as.numeric(levels(data$Voltage)[data$Voltage]), type = "l", ylab = "Voltage", xlab = "datetime")
plot(datetimes, metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetimes, metering_2, col = "red")
lines(datetimes, metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "-", col = c("black", "red", "blue"), bty = "n")
plot(datetimes, as.numeric(levels(data$Global_reactive_power)[data$Global_reactive_power]), type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()