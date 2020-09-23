#Subsetting data by their date, setting na = ?.
df <- subset(read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", comment.char = "", quote = '\"'),
             Date == "1/2/2007" | Date == "2/2/2007")

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
hour <- paste(as.Date(df$Date), df$Time)

df$hour <- as.POSIXct(hour)

#Plot 2

png(filename = "plot2.png", width = 480, height = 480)

with(df, plot(Global_active_power~hour, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.off()
