leer <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subDates <- DT[, DT$Date == "1/2/2007" | DT$Date == "2/2/2007"]
data <- DT[subDates]

dates <- as.character(data$Date)
times <- as.character(data$Time)
x <- paste(dates, times)
datetimes <- strptime(x, "%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(datetimes, as.numeric(levels(data$Global_active_power)[data$Global_active_power]), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()