# Examine how household energy usage varies over a 2-day period in February, 2007
# The code file should include code for reading the data so that the plot can be fully reproduced
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
# Name the plot file plot4.png
# Include the code that creates the PNG file.
#-------------------------------------------------------------------------------------------------------------------------------------------
#add packages needed to execute script
library(plyr)
library(dplyr)
library(data.table)
library(graphics)
# Function used to run script plot4()
#-------------------------------------------------------------------------------------------------------------------------------------------------------------
plot4 <- function()
{
  #locate data 
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  #download data file
  download.file(fileUrl, destfile = "C:/Users/Sandra/Documents/specdata3/2Fhousehold_power_consumption.zip", method = "libcurl", mode = "wb")
  #unzip data file
  unzip("C:/Users/Sandra/Documents/specdata3/2Fhousehold_power_consumption.zip")
  #read data file
  householdPower <-  read.table("C:/Users/Sandra/Documents/specdata3/household_power_consumption.txt", sep =";", na.strings = c("?",""), header =TRUE)
  
  #-------------------------------------------------------------------------------------------------------------------------------------------
  #manipulate data files
  
  householdPowerDay1 <- filter(householdPower, Date == "1/2/2007") # filter day 1
  householdPowerDay2 <- filter(householdPower, Date == "2/2/2007") # filter day 2
  householdPowerData <- rbind(householdPowerDay1, householdPowerDay2) # combine the 2 days of data in 1 file
  householdPowerData$Date <- as.Date(householdPowerData$Date, format = "%d/%m/%Y") #convert data to date
  householdPowerData$TimeTemp <- paste(householdPowerData$Date,householdPowerData$Time) #combine date and time
  householdPowerData$Time <- strptime(householdPowerData$TimeTemp, format = "%Y-%m-%d %H:%M:%S") # format date and time to Positlt
  #--------------------------------------------------------------------------------------------------------------------------------------------------
  #create 4 data plots
  png(file = "plot4.png", width = 480, height = 480)
  par(mfcol = c(2,2))
  with(householdPowerData, {
    plot(householdPowerData$Time, as.numeric(Global_active_power),type = "l", main = " ",xlab = " ", ylab = "Global Active Power (kilowatts)")
    plot(householdPowerData$Time, as.numeric(householdPowerData$Sub_metering_1),main = " ", xlab = " ", ylab = "Energy sub metering", type = "n")
    points(householdPowerData$Time, as.numeric(householdPowerData$Sub_metering_1),type = "l", col = "black")  
    points(householdPowerData$Time, as.numeric(householdPowerData$Sub_metering_2),type = "l", col = "red")
    points(householdPowerData$Time, as.numeric(householdPowerData$Sub_metering_3),type = "l", col = "blue")
    legend("topright",pch ="-", col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    plot(householdPowerData$Time, as.numeric(Voltage), type = "l", main = " ", xlab = "datetime", ylab = "Voltage") 
    plot(householdPowerData$Time, as.numeric(Global_reactive_power), type = "l", main= " ",xlab = "datetime", ylab = "Global_reactive_power")} 
  )
  dev.off()
  
} 