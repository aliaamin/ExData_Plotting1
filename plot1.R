plot1 <- function() {
        
        # read source data
        data <- read.csv("household_power_consumption.txt", na.strings = c("?"), header=TRUE,sep=";")      

        # prepare date and time column
        data$Time <- paste(data$Date, data$Time, sep=' ')        
        data$Time <- as.POSIXct(strptime(data$Time, "%d/%m/%Y %H:%M:%S"))        
        data$Date <- as.Date(data$Date , "%d/%m/%Y")
        
        # only get the data from specific dates 
        cleanData <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

        # prepare device and generate png img
        png(filename = "plot1.png", width = 480, height = 480, units = "px")        

        # make plot 1
        hist(cleanData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
       
        # close device
        dev.off()
       
        
}