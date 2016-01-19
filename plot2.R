
  
  power <- read.table(file = 'household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE, colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"));
  
  powerdata <- power[power$Date %in% c('1/2/2007', '2/2/2007'),];
  
  powerdata$datetime <- as.POSIXct(paste(powerdata$Date, powerdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  powerdata$datetime;
  
  png(filename = 'plot2.png', width=480, height=480);
  
  par(mar=c(5,5,1,1));
  
  plot(powerdata$datetime, powerdata$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)");
  
  dev.off();
