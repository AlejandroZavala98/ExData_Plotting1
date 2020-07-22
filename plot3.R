#read 
data_house <- read.csv("C:/Users/Usuario/Desktop/household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

#format date 

data_house$Date <- as.Date(data_house$Date, format="%d/%m/%Y")
dateTime <- paste(data_house$Date, data_house$Time)
data_house$DateTime <- as.POSIXct(dateTime)

#plot

with(data_house, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", cex=0.8)
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()