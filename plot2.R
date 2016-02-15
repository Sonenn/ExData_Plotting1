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
##PLOT2
png("plot2.png")
plot(df$DateTime,df$Global_active_power, type = "l", xlab = "" , ylab = "Global Active Power (kilowatts)")
dev.off()