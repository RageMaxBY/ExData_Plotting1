library(dplyr)

#read data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
#subset only 1/2/2007 and 2/2/2007 date
data <- filter(data, Date %in% c("1/2/2007","2/2/2007"))

#make a plot
png("plot4.png",width=480,height=480)

par(mfcol=c(2,2))

# plot (1,1)
plot(data$DateTime, data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

# plot (2,1)
plot(data$DateTime, data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (1,2)
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot (2, 2)
plot (data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()