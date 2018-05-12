#Getting and subsetting the data from the working directory  
dataFile <- "household_power_consumption.txt" 
 data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
 subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
 

#Converting and transforming variables needed for the plot
 datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
 globalActivePower <- as.numeric(subSetData$Global_active_power) 
 globalReactivePower <- as.numeric(subSetData$Global_reactive_power) 
 voltage <- as.numeric(subSetData$Voltage) 
 subMetering1 <- as.numeric(subSetData$Sub_metering_1) 
 subMetering2 <- as.numeric(subSetData$Sub_metering_2) 
 subMetering3 <- as.numeric(subSetData$Sub_metering_3) 
 

 
#Plotting the graph
 png("plot4.png", width=480, height=480) 

 par(mfrow = c(2, 2))      #enables the grid  
 

 plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)  #plotting the first graph
 

 plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")   #plotting the second graph
 
 

 plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")  #plotting the third graph
 
 lines(datetime, subMetering2, type="l", col="red")   #adding line
 lines(datetime, subMetering3, type="l", col="blue")  #adding line
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") #adding a legend to the graph 
 

 plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") #plotting the fourth graph
 

 dev.off() 
