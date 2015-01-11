## Reading the data of household power consumption
HPCData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?") 

##提取2007年2月1日与2007年2月2日的数据，存入子集data3
HPCData$Time <- paste(HPCData$Date, HPCData$Time)
HPCData$Date <- as.Date(HPCData$Date, "%d/%m/%Y")
HPCData$Time <- strptime(HPCData$Time, "%d/%m/%Y %H:%M:%S")
day1 <- which(HPCData$Date == "2007-02-01")
day2 <- which(HPCData$Date == "2007-02-02")
data3 <- HPCData[c(day1, day2), c(2, 7, 8, 9)]

##绘图
png(filename = "plot3.png")
plot(data3[, 1:2], type = "l", xlab = "", ylab = "Energy sub metering")
points(data3[, c(1,3)], type = "l", col = "red")
points(data3[, c(1,4)], type = "l", col = "blue")
legend("topright", box.lwd = "0",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       pch = c("_","_","_"),
       col = c("black","red","blue"))
dev.off()