##Read the data file
dat <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na = "?")
head(dat)

##Change the data type to a Date Format
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

##Subset the data 
data <- subset(dat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting the dates
datetime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(datetime)

#Plot3
plot(data$Sub_metering_1~data$DateTime, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2~data$DateTime, col = "red")
lines(data$Sub_metering_3~data$DateTime, col = "blue")

legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

#Saving as PNG with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


