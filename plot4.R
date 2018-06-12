#Explore Data Week 1 Project --Common code for reading data---
#Read in 20MB data file for household power consumption 
# data file already downloaded to local working directory from website
#it is a text file with ; delimiter
alldata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
#
#We will need data only for 2 days: Feb 1 and 2 of 2007; extract this subset
pdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007"), ]
#
#Code for Plot 4
#Convert to numeric all variables that need to be plotted
pdata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
pdata$Sub_metering_1 <- as.numeric(as.character(pdata$Sub_metering_1))
pdata$Sub_metering_2 <- as.numeric(as.character(pdata$Sub_metering_2))
pdata$Sub_metering_3 <- as.numeric(as.character(pdata$Sub_metering_3))
pdata$Voltage <- as.numeric(as.character(pdata$Voltage))
pdata$Global_reactive_power <- as.numeric(as.character(pdata$Global_reactive_power))
#
#Create a new variable to combine Date and Time with class Date
pdata$datetime <- paste(pdata$Date, pdata$Time)
pdata$datetime <- strptime(pdata$datetime, "%d/%m/%Y %H:%M:%S")
#
#Open png device
png(filename = "plot4.png", width = 480, height = 480)
#Set the global parameter to render 2 plots in each of 2 rows
par(mfrow=c(2,2))
#
#Plot 1 of 4: Create a Plot for Global Active Power vs datetime
plot(pdata$datetime, pdata$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
#Plot 2 of 4: Create a Plot of Voltage vs datetime
plot(pdata$datetime, pdata$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
#Plot 3 of 4: Reproduce Plot 3 from previous plot
plot(pdata$datetime, pdata$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(pdata$datetime, pdata$Sub_metering_2, col="red")
lines(pdata$datetime, pdata$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1))
#Plot 4 of 4: Create a Plot of Global Reactive Power
plot(pdata$datetime, pdata$Global_reactive_power, type='l', xlab="datetime", ylab = "Global_reactive_power")
#Close the png device
dev.off()