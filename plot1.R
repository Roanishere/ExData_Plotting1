#Subsetting data by their date, setting na = ?.
df <- subset(read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", comment.char = "", quote = '\"'),
             Date == "1/2/2007" | Date == "2/2/2007")

df$Date <- as.Date(df$Date, format = "%d/$m/$Y")

#Plot 1

png(filename = "plot1.png", width = 480, height = 480)

with(df, hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

dev.off()