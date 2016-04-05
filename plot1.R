## Getting full dataset
  setwd("/Users/Mind/Desktop/Exploratory Data Analysis/ExData_Plotting1")
  data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259)
## Formatting Date
  data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
  data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  
## Converting dates
  datetime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(datetime)

## Plotting
  hist(data$Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
  
## Creating PNG file
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
  