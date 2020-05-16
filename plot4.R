
library(dplyr)
library(ggplot2)

setwd("C:/Users/60001556/Desktop/Courses/R/4. Exploratory_data_analysis")

electric <- read.table("electric/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                       stringsAsFactors = F) 
str(electric)
electric$Date <- as.Date(electric[,1], format = '%d/%m/%Y')   #change format factor to Date 
str(electric$Date)
data <- filter(electric, Date >= "2007-02-01" & Date <= "2007-02-02")
str(data)
str(data$Date)     # watch out: the time format here is 'Chr'
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)   #change time format back to 'POSIXct'
str(data$Datetime)

par(mfrow = c(2,2), mar= c(4,4,2,2))
with(data, {
        plot(data$Datetime, data$Global_active_power, xlab = "", type = "l")
        
        plot(data$Datetime, data$Voltage, xlab = "datetime", type = "l")
        
        plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col="black")
        lines(data$Datetime, data$Sub_metering_2, col="red")
        lines(data$Datetime, data$Sub_metering_3, col="blue")
        legend("topright", legend = c("Sub_metering_1","Sub_metering_2",'Sub_metering_3'), 
               col = c("black", "red", "blue"), lty = 'solid')
        
        plot(data$Datetime, data$Global_reactive_power, xlab = "datetime", type = "l")
})


dev.copy(png, "plot4.png", width=480, height=480)   #save pgn file
dev.off()
