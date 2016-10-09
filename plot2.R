library(dplyr)

#read data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
#subset only 1/2/2007 and 2/2/2007 date
data <- filter(data, Date %in% c("1/2/2007","2/2/2007"))

#convert the Date and Time variables to Date/Time classes
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#make a plot
png("plot2.png",width=480,height=480)
plot(data$DateTime, data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()