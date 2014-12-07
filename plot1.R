##Read the data file
dat <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na = "?")
head(dat)

##Change the data type to a Date Format
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

##Subset the data 
data <- subset(dat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting the dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
head(data)
#Plotting the histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving as PNG with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
