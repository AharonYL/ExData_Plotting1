
library(lubridate)

##Pulling in and transforming the data

power_raw <- read.table("./Project1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

power_raw$Date <- dmy(power_raw$Date)
sobset <- subset(power_raw, Date >= "2007-02-01" & Date <= "2007-02-02")

sobset[3:9] <- lapply(sobset[3:9], as.numeric)

sobset$datetime <- paste(sobset$Date, sobset$Time, sep = " ")
sobset$datetime <- ymd_hms(sobset$datetime)

##Making the plot

plot(sobset$datetime, sobset$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(sobset$datetime, sobset$Sub_metering_2, col = "red")
lines(sobset$datetime, sobset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Printing the plot

dev.copy(png, file = "Plot 3.png")
dev.off()
