library("sqldf")
df<- read.csv.sql("household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')
df$realtime <- as.POSIXct(strptime(paste(df$Date, df$Time),format = "%d/%m/%Y %H:%M:%S"),tz = "")
png(filename = "plot1.png",height = 480, width = 480)
hist(df$Global_active_power, main = "Global Active Power",col="red", xlab = "Global Active Power (kilowatts)")
dev.off()
