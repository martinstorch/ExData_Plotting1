
f <- unz(description="exdata_data_household_power_consumption.zip", filename="household_power_consumption.txt")
tab5rows<-read.table(f, sep = ';', header = TRUE, stringsAsFactors = F, nrows = 5)
classes <- sapply(tab5rows, class)
f <- unz(description="exdata_data_household_power_consumption.zip", filename="household_power_consumption.txt")
data <- read.table(f, sep = ';', header = TRUE, colClasses = classes, na.strings = "?", stringsAsFactors = F)

fdata <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]

fdata$Datetime <- strptime(paste(fdata$Date, fdata$Time), "%d/%m/%Y %H:%M:%S")
attach(fdata)

png(filename = "plot3.png",   width = 480, height = 480)

plot(Datetime, Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="", col="black")
points(Datetime, Sub_metering_2, type = "l", ylab="Energy sub metering", xlab="", col="red")
points(Datetime, Sub_metering_3, type = "l", ylab="Energy sub metering", xlab="", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
