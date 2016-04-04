# Data Science Specialization
# Exploratory Data Analysis, Course Project #1
# Plot #4
# K.Quinn, April 2016

# Instructions for project:
# https://www.coursera.org/learn/exploratory-data-analysis/peer/ylVFo/course-project-1
# https://github.com/rdpeng/ExData_Plotting1

# FYI, run this script in the local directory you want to save
# data to and save the plots in, use setwd() as neccessary.

# Download data to file household_power_consumption.txt
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"ExpData_Dataset_1.zip",method="curl")
unzip("ExpData_Dataset_1.zip")

# Read in data to workspace and subset only days 2007/2/1 and 2007/2/2
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
df <- subset(df, 
   datetime >= strptime("2007/2/1", format="%Y/%m/%d") & 
   datetime <  strptime("2007/2/3",format="%Y/%m/%d") )

#######################################################################
# Above code same for all plots, following code unique to each plot
#######################################################################

# Plot #4: 2x2 plots in one figure: datetime vs. Global Active Power, voltage, 
# Energy sub metering (like plot #3 without legend box), global_reactive_power
# NB: in instructions plots 2 and 4 have xlabel of "datetime" so I have 
# included this, even though it's uneccessary and inconsistent with plots 1 and 3.

plot.new()  # set all par() to defaults
png(file="plot4.png")
par(mfrow=c(2,2))

plot(df$datetime, df$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")
axis.Date(side=1, df$datetime, format="%a")

plot(df$datetime, df$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")
axis.Date(side=1, df$datetime, format="%a")

plot(df$datetime, df$Sub_metering_1, col="black", type="l", xlab="", 
     ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue")
axis.Date(side=1, df$datetime, format="%a")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1, bty="n")

plot(df$datetime, df$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
axis.Date(side=1, df$datetime, format="%a")

dev.off()
