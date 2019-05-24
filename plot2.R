library(lubridate)
library(dplyr)

#Reading Dataset
household_power_consumption = read.delim("household_power_consumption.txt", header = T, 
                                         sep = ";", na.strings = "?")

#Converting "Date" column using lubridate
household_power_consumption$Date = dmy(household_power_consumption$Date)

#Subsetting
household_power_consumption = household_power_consumption%>%
  filter(Date == "2007-02-01" | Date == "2007-02-02")

#Converting Time column using lubridate
household_power_consumption$Time = household_power_consumption$hms(Time)

#Pasting Date-Time
date_time = as.POSIXct(paste(household_power_consumption$Date,
                               household_power_consumption$Time))

#Plotting
png("Plots Png/plot2.png")
plot(date_time, household_power_consumption$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()