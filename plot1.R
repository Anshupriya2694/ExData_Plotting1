library(lubridate)
library(dplyr)

#Reading Dataset
household_power_consumption = read.delim("household_power_consumption.txt", header = T, 
                                         sep = ";", na.strings = "?")

#Converting "Date" column to Date Type
household_power_consumption$Date = dmy(household_power_consumption$Date)

#Subsetting
household_power_consumption = household_power_consumption%>%
  filter(Date == "2007-02-01" | Date == "2007-02-02")

#Plotting in a png file
png("Plots Png/plot1.png", width = 480, height = 480)
hist(household_power_consumption$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()