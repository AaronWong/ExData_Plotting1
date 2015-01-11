## Reading the data of household power consumption
HPCData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?") 

##提取2007年2月1日与2007年2月2日的数据，存入子集data2
HPCData$Time <- paste(HPCData$Date, HPCData$Time)
HPCData$Date <- as.Date(HPCData$Date, "%d/%m/%Y")
HPCData$Time <- strptime(HPCData$Time, "%d/%m/%Y %H:%M:%S")
day1 <- which(HPCData$Date == "2007-02-01")
day2 <- which(HPCData$Date == "2007-02-02")
data2 <- HPCData[c(day1, day2), 2:3]

##绘图
png(filename = "plot2.png")
plot(data2, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()