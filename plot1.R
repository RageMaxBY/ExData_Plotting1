library(dplyr)

#read data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
#subset only 1/2/2007 and 2/2/2007 date
data <- filter(data, Date %in% c("1/2/2007","2/2/2007"))

#make a histogram
png("plot1.png",width=480,height=480)
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.off()