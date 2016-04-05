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
  par(mfrow=c(2,2))
  # fig 1
  plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power", xlab="")
  # fig 2
  plot(data$Voltage~data$Datetime, type="l", ylab="Voltage", xlab="datetime")
  # fig 3
  plot(data$Sub_metering_1~data$Datetime, type="l", col="black", ylab="Energy sub metering", xlab="")
  lines(data$Sub_metering_2~data$Datetime, type="l", col="red")
  lines(data$Sub_metering_3~data$Datetime, type="l", col="blue")
  legend("topright", col=c("black","red","blue"), lty = 1, lwd = 2,bty="n", 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  )
  # fig 4
  plot(data$Global_reactive_power~data$Datetime, type="l",col="black",
       ylab="Global_reactive_power", xlab="datetime")

## Creating PNG file
  dev.copy(png, file="plot4.png", height=480, width=480)
  dev.off()
  