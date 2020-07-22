#read data (house)

data_house <- read.csv("C:/Users/Usuario/Desktop/household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

## Plot 1
hist(data_house$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

## exporting file

with(data_house,hist(data_house$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8))
dev.copy(png,file="plot1.png")
dev.off()
