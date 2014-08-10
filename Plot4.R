datas=read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
datas[,1]=as.Date(datas$Date,"%d/%m/%Y")
reqdata=subset(datas,datas$Date %in% as.Date(c("2007-02-01","2007-02-02")))
reqdata$DateTime <- as.POSIXct(paste(reqdata$Date, reqdata$Time), format="%Y-%m-%d %H:%M:%S")
reqdata[,3]=as.numeric(reqdata[,3])
reqdata[,4]=as.numeric(reqdata[,4])
reqdata[,5]=as.numeric(reqdata[,5])
reqdata[,6]=as.numeric(reqdata[,6])
reqdata[,7]=as.numeric(reqdata[,7])
reqdata[,8]=as.numeric(reqdata[,8])
reqdata[,9]=as.numeric(reqdata[,9])

par(mfrow=c(2,2))
plot(reqdata$DateTime,reqdata[,3],type="l",xlab=" ",ylab="Global Active Power")

plot(reqdata$DateTime,reqdata[,5],type="l",xlab="datetime",ylab="Voltage")

plot(reqdata$DateTime,reqdata[,7],type="l",xlab=" ",ylab="Energy sub metering")
lines(reqdata[,10],reqdata[,8],col="Red")
lines(reqdata[,10],reqdata[,9],col="Blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=1,pt.cex=0.6,cex=0.6,bty="n")

plot(reqdata$DateTime,reqdata[,4],type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()