#Explore Data Week 1 Project --Common code for reading data---
#Read in 20MB data file for household power consumption 
# data file already downloaded to local working directory from website
#it is a text file with ; delimiter
alldata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
#
#We will need data only for 2 days: Feb 1 and 2 of 2007; extract this subset
pdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007"), ]
#
#Code for Plot 2
#Convert to numeric all variables that need to be plotted
pdata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
#
#Create a new variable to combine Date and Time with class Date
pdata$datetime <- paste(pdata$Date, pdata$Time)
pdata$datetime <- strptime(pdata$datetime, "%d/%m/%Y %H:%M:%S")
#
#Open png device
png(filename = "plot2.png", width = 480, height = 480)
#
#Create a Plot for Global Active Power for the new variable datetime
plot(pdata$datetime, pdata$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
#
#Close the png device
dev.off()