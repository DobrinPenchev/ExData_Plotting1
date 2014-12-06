unzip("exdata-data-household_power_consumption.zip")
data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";",
                   na.strings = "?")

data.set <- data[data$Date == "1/2/2007",]
data.set <- rbind(data.set,data[data$Date == "2/2/2007",])

Date.Time <- paste(data.set$Date,data.set$Time, sep = " ")
data.set <- cbind(Date.Time, data.set[,3:9])

data.set$Date.Time <- strptime(data.set$Date.Time,"%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

plot(data.set$Date.Time, data.set$Global_active_power, type = "l"
     ,xlab = "", ylab = "Global Active Power")
axis(side=2,lwd=2)

plot(data.set$Date.Time, data.set$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(data.set$Date.Time,data.set$Sub_metering_1, type = "l")
lines(data.set$Date.Time,data.set$Sub_metering_2, type = "l",col="red")
lines(data.set$Date.Time,data.set$Sub_metering_3, type = "l",col="blue")
legend("topright", bty = "n", lty = 1, col = c("black","red","blue"),
       legend = names(data.set[6:8]),cex=0.9)
axis(side=2,lwd=2)

plot(data.set$Date.Time, data.set$Voltage, type = "l"
     ,xlab = "datetime", ylab = "Voltage")
axis(side=2,lwd=2)

plot(data.set$Date.Time, data.set$Global_reactive_power, type = "l"
     ,xlab = "datetime", ylab = "Global_reactive_power")
axis(side=2,lwd=2)

dev.off()