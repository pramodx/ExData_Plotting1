
  power <- read.table(file = 'household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE, colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric"));
  power$Date <- as.Date(power$Date, format='%d/%m/%Y');
  powerdata <- power[power$Date >= as.Date('2007-02-01') & power$Date <= as.Date('2007-02-02'),];
  png(filename = 'plot1.png', width=480, height=480);
  par(mar=c(5,5,1,1));
  hist(powerdata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col="red");
  dev.off()
