getwd()
library(dplyr)
install.packages('ggplot2')
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
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, "plot2.png", width=480, height=480)   #save pgn file
dev.off()

