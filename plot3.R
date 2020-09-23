#Subsetting data by their date, setting na = ?.
df <- subset(read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", comment.char = "", quote = '\"'),
             Date == "1/2/2007" | Date == "2/2/2007")

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
hour <- paste(as.Date(df$Date), df$Time)

df$hour <- as.POSIXct(hour)

#Plot 3

png(filename = "plot3.png", width = 480, height = 480)

with(df, {
  plot(Sub_metering_1~hour, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~hour, col = "red")
  lines(Sub_metering_3~hour, col = "blue")
  }
)

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
