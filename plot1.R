
library(dplyr)
setwd("C:/Users/60001556/Desktop/Courses/R/4. Exploratory_data_analysis")

electric <- read.table("electric/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                       stringsAsFactors = F) 
str(electric)

electric$Date <- as.Date(electric[,1], format = '%d/%m/%Y')   #change format factor to Date 
str(electric$Date)
data <- filter(electric, Date >= "2007-02-01" & Date <= "2007-02-02")
str(data)
hist(electric$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, "plot1.png", width=480, height=480)   #save pgn file
dev.off()


