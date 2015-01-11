## Reading the data of household power consumption
HPCData <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?") 

##��ȡ2007��2��1����2007��2��2�յ����ݣ������Ӽ�data1
HPCData$Date <- as.Date(HPCData$Date, "%d/%m/%Y")
day1 <- which(HPCData$Date == "2007-02-01")
day2 <- which(HPCData$Date == "2007-02-02")
data1 <- HPCData[c(day1, day2), 3]

##��ͼ
png(filename = "plot1.png")
hist(data1, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)")
dev.off()