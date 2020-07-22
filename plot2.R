#read data (house)

data_house <- read.csv("C:/Users/Usuario/Desktop/household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")


#format date and time
data_house$Date <- as.Date(data_house$Date, format="%d/%m/%Y")
dateTime <- paste(data_house$Date, data_house$Time)
data_house$DateTime <- as.POSIXct(dateTime)

#plot
plot(data_house$Global_active_power~data_house$DateTime, type="l", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()