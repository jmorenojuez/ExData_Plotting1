data_file = "household_power_consumption.txt"
if (!file.exists(data_file)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
  unzip("data.zip")
}
data <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?")
filtered_data <-  data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
png("plot2.png", width=480, height=480,type="cairo")
plot(filtered_data$Global_active_power,type="l",xlab = "",ylab = "Global Active Power(kilowatts)",xaxt="n")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.off()
rm(data,filtered_data)