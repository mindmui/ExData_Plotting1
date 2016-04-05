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
  plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
## Creating PNG file
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
  