plot1 <- function() {
  
  # load the file
  col_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  data_set <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE, colClasses = col_classes, header = TRUE, comment.char="")

  # subset the date range
  data_dates <- strptime(data_set[,1],'%d/%m/%Y')
  range_dates <- (data_dates >= '2007-02-01' & data_dates <= '2007-02-02')
  plot_data <- data_set[range_dates,]

  png("plot1.png", width=480, height=480)
  hist(plot_data[,3], xlab="Global Active Power (kilowatts)", ylab="Frequency", col= "red", main="Global Active Power")
  dev.off()
}