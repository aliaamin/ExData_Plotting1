plot4 <- function() {
        
        #get data
        data <- read.csv("household_power_consumption.txt", na.strings = c("?"), header=TRUE,sep=";")      

        # prepare date and time column
        
        data$Time <- paste(data$Date, data$Time, sep=' ')        
        data$Time <- as.POSIXct(strptime(data$Time, "%d/%m/%Y %H:%M:%S"))        
        data$Date <- as.Date(data$Date , "%d/%m/%Y")
        

        # only get the data from specific dates  
        cleanData <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

        # prepare device and generate png img
        png(filename = "plot4.png", width = 480, height = 480, units = "px")        
        
        # make a 2x2 layout
        par(mfcol = c(2,2))

        # plot 1 
        plot(cleanData$Time, cleanData$Global_active_power, xlab="", ylab = "Global Active Power", type = "l")
               
        #plot 2
        plot(cleanData$Time, cleanData$Sub_metering_1, type = "l", col = "black", ylab="Energy sub metering", xlab = "")
        lines(cleanData$Time, cleanData$Sub_metering_3, type = "l", col = "blue")
        lines(cleanData$Time, cleanData$Sub_metering_2, type = "l", col = "red")
        legend("topright", lwd=1, lty=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","blue","red"))
        
        #plot 3
        plot(cleanData$Time, cleanData$Voltage, ylab = "Voltage", xlab ="datetime", type = "l")
        
        # plot 4
        plot(cleanData$Time, cleanData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
        
        #close device
        dev.off()
       
        
}