## Reading the data of household power consumption
HPCData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?") 

##提取2007年2月1日与2007年2月2日的数据，存入子集data4
HPCData$Time <- paste(HPCData$Date, HPCData$Time)
HPCData$Date <- as.Date(HPCData$Date, "%d/%m/%Y")
HPCData$Time <- strptime(HPCData$Time, "%d/%m/%Y %H:%M:%S")
day1 <- which(HPCData$Date == "2007-02-01")
day2 <- which(HPCData$Date == "2007-02-02")
data4 <- HPCData[c(day1, day2), ]

##绘图
png(filename = "plot4.png")
par(mfcol = c(2,2))
##第一副图
plot(data4[,c(2,3)], type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

##第二副图
plot(data4[, c(2,7)], type = "l", xlab = "", ylab = "Energy sub metering")
points(data4[, c(2,8)], type = "l", col = "red")
points(data4[, c(2,9)], type = "l", col = "blue")
legend("topright",  bty= "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       pch = c("_","_","_"),
       col = c("black","red","blue"))

##第三幅图
plot(data4[,c(2,5)], type = "l", xlab = "datetime", ylab = "Voltage")

##第四幅图
plot(data4[,c(2,4)], type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()