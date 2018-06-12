#Explore Data Week 1 Project --Common code for reading data---
#Read in 20MB data file for household power consumption 
# data file already downloaded to local working directory from website
#it is a text file with ; delimiter
alldata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
#
#We will need data only for 2 days: Feb 1 and 2 of 2007; extract this subset
pdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007"), ]
#
#Code for Plot 1
#Convert to numeric all variables that need to be plotted
pdata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
#
#Open png device
png(filename = "plot1.png", width = 480, height = 480)
#
#Plot a histogram for Global Active Power
hist(pdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#
#Close the png device
dev.off()