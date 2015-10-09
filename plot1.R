# Examine how household energy usage varies over a 2-day period in February, 2007
# The code file should include code for reading the data so that the plot can be fully reproduced
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
# Name the plot file plot1.png
# Include the code that creates the PNG file.
#-------------------------------------------------------------------------------------------------------------------------------------------
#add packages needed to execute script
library(plyr)
library(dplyr)
library(data.table)
library(graphics)
# Function used to run script plot1()
plot1 <- function()
{
#locate data 
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download data file
#download.file(fileUrl, destfile = "C:/Users/Owner/Documents/specdata/2Fhousehold_power_consumption.zip", method = "libcurl", mode = "wb")
#unzip data file
#unzip("C:/Users/Owner/Documents/specdata/2Fhousehold_power_consumption.zip")
#read data file
householdPower <-  read.table("C:/Users/Owner/Documents/specdata/household_power_consumption.txt", sep =";", na.strings = c("?",""), header =TRUE)
#-------------------------------------------------------------------------------------------------------------------------------------------
#manipulate data files

householdPowerDay1 <- filter(householdPower, Date == "1/2/2007")   #filter for day 1 data
householdPowerDay2 <- filter(householdPower, Date == "2/2/2007")   #filter for day 2 data   
householdPowerData <- rbind(householdPowerDay1, householdPowerDay2) #combine the 2 days of data into one file   
#---------------------------------------------------------------------------------------------------------------------------------------------
#create histogram representing data
png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(householdPowerData$Global_active_power),main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col ="red") 
dev.off()
} 