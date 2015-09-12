plot4 <- function() {
  
  # load the file
  col_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  data_set <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE, colClasses = col_classes, header = TRUE, comment.char="")
  
  # subset the date range
  data_dates <- strptime(data_set[,1],'%d/%m/%Y')
  range_dates <- (data_dates >= '2007-02-01' & data_dates <= '2007-02-02')
  plot_data <- data_set[range_dates,]
  x <- strptime(paste(plot_data[,1],plot_data[,2]), '%d/%m/%Y %H:%M:%S')

  png("plot4.png", width=480, height=480)
  par(mfcol = c(2,2))

  # graph 1
  plot(x, plot_data[,3], type = 'l', xlab = "", ylab="Global Active Power (kilowatts)")
  
  # graph 2
  plot(x, plot_data[,7], type = 'l', xlab = "", ylab="Energy sub metering")
  points(x, plot_data[,8], type = 'l', col = 'red')
  points(x, plot_data[,9], type = 'l', col = 'blue')
  legend("topright", lty=1, col=c("black", "red", "blue"), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3' ))
  
  # graph 3
  plot(x, plot_data[,5], type = 'l', xlab = "datetime", ylab="Voltage")

  # graph 4
  plot(x, plot_data[,4], type = 'l', xlab = "datetime", ylab="Global_reactive_power")

    
  dev.off()
}