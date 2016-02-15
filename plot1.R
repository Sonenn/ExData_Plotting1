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
##PLOT1
png("Plot_1.png")
hist(as.numeric(df$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red",
     main = "Global Active Power")
dev.off()


