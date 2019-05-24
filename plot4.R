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
png("plot4.png")
par(mfrow = c(2, 2))
plot(date_time, household_power_consumption$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(date_time, household_power_consumption$Voltage, 
     type="l", xlab="datetime", ylab="Voltage")
plot(date_time, household_power_consumption$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(date_time, household_power_consumption$Sub_metering_2, col = "red")
lines(date_time, household_power_consumption$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 0.5)
plot(date_time, household_power_consumption$Global_reactive_power, 
     type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()