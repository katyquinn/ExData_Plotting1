# Data Science Specialization
# Exploratory Data Analysis, Course Project #1
# Plot #3
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

# Plot #3: multiple line plots of datetime vs. energy sub metering

plot.new()  # set all par() to defaults
png(file="plot3.png")
plot(df$datetime, df$Sub_metering_1, col="black", type="l", xlab="", 
     ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue")
axis.Date(side=1, df$datetime, format="%a")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1)
dev.off()
