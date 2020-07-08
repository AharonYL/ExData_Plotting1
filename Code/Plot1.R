library(lubridate)

##Grabbing the data and whatnot

power_raw <- read.table("./Project1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


power_raw$Date <- dmy(power_raw$Date)
sobset <- subset(power_raw, Date >= "2007-02-01" & Date <= "2007-02-02")

sobset[3:9] <- lapply(sobset[3:9], as.numeric)

sobset$datetime <- paste(sobset$Date, sobset$Time, sep = " ")
sobset$datetime <- ymd_hms(sobset$datetime)

##Drawing the plot

hist(sobset$Global_active_power, col = "red", breaks = 11, xlab= ("Global Active Power (kilowatts)"), main = "Global Active Power")

##Printing the plots
dev.copy(png, file = "Plot 1.png")
dev.off()


