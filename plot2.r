plot2 <- function() {
  
  # load the file
  col_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  data_set <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE, colClasses = col_classes, header = TRUE, comment.char="")
  
  # subset the date range
  data_dates <- strptime(data_set[,1],'%d/%m/%Y')
  range_dates <- (data_dates >= '2007-02-01' & data_dates <= '2007-02-02')
  plot_data <- data_set[range_dates,]
  x <- strptime(paste(plot_data[,1],plot_data[,2]), '%d/%m/%Y %H:%M:%S')

  png("plot2.png", width=480, height=480)
  plot(x, plot_data[,3], type = 'l', xlab = "", ylab="Global Active Power (kilowatts)")
  dev.off()
}