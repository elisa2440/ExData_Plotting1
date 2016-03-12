leer <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subDates <- DT[, DT$Date == "1/2/2007" | DT$Date == "2/2/2007"]
data <- DT[subDates]

png("plot1.png")
hist(as.numeric(levels(data$Global_active_power)[data$Global_active_power]), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()