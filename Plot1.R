dataAll <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)
dataReduced <- dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot1.png", width = 480, height = 480)
hist(as.numeric(data1$Global_active_power), col="red",
     main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
