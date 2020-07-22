#read 
data_house <- read.csv("C:/Users/Usuario/Desktop/household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
names(data_house)
#format date 

data_house$Date <- as.Date(data_house$Date, format="%d/%m/%Y")
dateTime <- paste(data_house$Date, data_house$Time)
data_house$DateTime <- as.POSIXct(dateTime)

#plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", cex=0.8)
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="", cex=0.8)
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", cex=0.8)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="", cex=0.8)
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()