## Reading the data of household power consumption
HPCData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?") 

##��ȡ2007��2��1����2007��2��2�յ����ݣ������Ӽ�data4
HPCData$Time <- paste(HPCData$Date, HPCData$Time)
HPCData$Date <- as.Date(HPCData$Date, "%d/%m/%Y")
HPCData$Time <- strptime(HPCData$Time, "%d/%m/%Y %H:%M:%S")
day1 <- which(HPCData$Date == "2007-02-01")
day2 <- which(HPCData$Date == "2007-02-02")
data4 <- HPCData[c(day1, day2), ]

##��ͼ
png(filename = "plot4.png")
par(mfcol = c(2,2))
##��һ��ͼ
plot(data4[,c(2,3)], type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

##�ڶ���ͼ
plot(data4[, c(2,7)], type = "l", xlab = "", ylab = "Energy sub metering")
points(data4[, c(2,8)], type = "l", col = "red")
points(data4[, c(2,9)], type = "l", col = "blue")
legend("topright",  bty= "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       pch = c("_","_","_"),
       col = c("black","red","blue"))

##������ͼ
plot(data4[,c(2,5)], type = "l", xlab = "datetime", ylab = "Voltage")

##���ķ�ͼ
plot(data4[,c(2,4)], type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()