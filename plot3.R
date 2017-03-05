data_file = "household_power_consumption.txt"
if (!file.exists(data_file)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
  unzip("data.zip")
}
data <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?")
filtered_data <-  data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
png("plot3.png", width=480, height=480,type="cairo")
plot(filtered_data$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering",xaxt="n")
lines(filtered_data$Sub_metering_2,type="l",col="red")
lines(filtered_data$Sub_metering_3,type="l",col="blue")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), lwd = c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()
rm(data,filtered_data)