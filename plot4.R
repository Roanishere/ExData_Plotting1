#Subsetting data by their date, setting na = ?.
df <- subset(read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", comment.char = "", quote = '\"'),
             Date == "1/2/2007" | Date == "2/2/2007")

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
hour <- paste(as.Date(df$Date), df$Time)

df$hour <- as.POSIXct(hour)

#Plot 4

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma=c(0, 0, 2, 0))

with(df, plot(Global_active_power~hour, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

with(df, plot(Voltage~hour, type = "l", ylab = "Voltage", xlab = "datetime"))

with(df, {
  plot(Sub_metering_1~hour, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~hour, col = "red")
  lines(Sub_metering_3~hour, col = "blue")
}
)

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(df, plot(Global_reactive_power~hour, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()
