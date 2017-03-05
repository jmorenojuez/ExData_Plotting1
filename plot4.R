data_file = "household_power_consumption.txt"
if (!file.exists(data_file)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
  unzip("data.zip")
}
data <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?")
filtered_data <-  data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
png("plot4.png", width=480, height=480,type="cairo")
par(mfrow=c(2,2)) # 4figures arranged in 2 by 2 matrix
plot(filtered_data$Global_active_power,type="l",xlab = "",ylab = "Global Active Power",xaxt="n")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
plot(filtered_data$Voltage,type="l",xlab = "datetime",ylab = "Voltage",xaxt="n")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
plot(filtered_data$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering",xaxt="n")
lines(filtered_data$Sub_metering_2,type="l",col="red")
lines(filtered_data$Sub_metering_3,type="l",col="blue")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), lwd = c(2.5,2.5,2.5),col=c("black","red","blue"))
plot(filtered_data$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power",xaxt="n")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.off()
rm(data,filtered_data)