setwd("C:/Users/Andreu/Documents/Documentos/Data Science coursera/Exploratory data analysis/Assigment 1")
df <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors=F,header=T)
##CLEAN TIME AND ADD TIME
df[df == '?'] <- NA
df$DateTime <- paste(df$Date,df$Time)
df$DateTime <- strptime(df$DateTime, format = "%d/%m/%Y %H:%M:%S")
df$Global_active_power <- as.numeric(df$Global_active_power)
##SUBSET DATA
df <- df[as.Date(df$DateTime) >= as.Date("2007/02/01",format = "%Y/%m/%d") &
           as.Date(df$DateTime) <= as.Date("2007/02/02",format = "%Y/%m/%d"),]
##PLOT4
png("plot4.png")

par(mfrow=c(2,2))

plot(df$DateTime,as.numeric(df$Global_active_power), type = "l", xlab = "" , 
     ylab = "Global Active Power (kilowatts)")

plot(df$DateTime,as.numeric(df$Voltage),type="l",xlab="datetime",ylab="Voltage")

plot(df$DateTime,as.numeric(df$Sub_metering_1), type = "l", xlab = "" , ylab = "Energy sub metering")
lines(df$DateTime,as.numeric(df$Sub_metering_3), col = "blue")
lines(df$DateTime,as.numeric(df$Sub_metering_2), col = "red")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black","red","blue"))

plot(df$DateTime,as.numeric(df$Global_reactive_power),ylab = "Global_reactive_power",xlab = "datetime", type="l")

dev.off()