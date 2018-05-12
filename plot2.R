#Getting and subsetting the data from the working directory 
dataFile <- "./data/household_power_consumption.txt" 
 data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
 subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
 
#Transforming variables
time <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
 glob_active_power <- as.numeric(subSetData$Global_active_power) 

#Plotting and saving variables
 png("plot2.png", width=480, height=480) 
 plot(time,  glob_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
 dev.off() 
