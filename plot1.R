## Reading the data of household power consumption
HPCData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?") 

##提取2007年2月1日与2007年2月2日的数据，存入子集data1
HPCData$Date <- as.Date(HPCData$Date, "%d/%m/%Y")
day1 <- which(HPCData$Date == "2007-02-01")
day2 <- which(HPCData$Date == "2007-02-02")
data1 <- HPCData[c(day1, day2), 3]

##绘图
png(filename = "plot1.png")
hist(data1, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)")
dev.off()