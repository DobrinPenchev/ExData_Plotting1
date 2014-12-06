unzip("exdata-data-household_power_consumption.zip")
data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";",
                   na.strings = "?")

data.set <- data[data$Date == "1/2/2007",]
data.set <- rbind(data.set,data[data$Date == "2/2/2007",])

Date.Time <- paste(data.set$Date,data.set$Time, sep = " ")
data.set <- cbind(Date.Time, data.set[,3:9])

data.set$Date.Time <- strptime(data.set$Date.Time,"%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)
plot(data.set$Date.Time, data.set$Global_active_power, type = "l"
     ,xlab = "", ylab = "Global Active Power (kilowatts)")
axis(side=2,lwd=2)
dev.off()