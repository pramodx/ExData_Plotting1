

power <- read.table(file = 'household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE, colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"));

powerdata <- power[power$Date %in% c('1/2/2007', '2/2/2007'),];

powerdata$datetime <- as.POSIXct(paste(powerdata$Date, powerdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

powerdata$datetime;

png(filename = 'plot4.png', width=480, height=480);
par(mfrow=c(2,2), mar = c(5,5,1,1));

##### 1 #####
plot(powerdata$datetime, powerdata$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)");

##### 2 #####
plot(powerdata$datetime, powerdata$Voltage, type="l", xlab="datetime", ylab = "Voltage");

##### 3 #####
plot(powerdata$datetime, powerdata$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering", col="black");
lines(powerdata$datetime, powerdata$Sub_metering_2, col="red");
lines(powerdata$datetime, powerdata$Sub_metering_3, col="blue");

legend("topright", lwd=1, lty=1, col=c('black', 'red', 'blue'), bty = "n", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'));

##### 4 #####
plot(powerdata$datetime, powerdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power");

dev.off();
