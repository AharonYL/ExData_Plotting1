
library(lubridate)

##Pulling in and transforming the data

power_raw <- read.table("./Project1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

power_raw$Date <- dmy(power_raw$Date)
sobset <- subset(power_raw, Date >= "2007-02-01" & Date <= "2007-02-02")

sobset[3:9] <- lapply(sobset[3:9], as.numeric)

sobset$datetime <- paste(sobset$Date, sobset$Time, sep = " ")
sobset$datetime <- ymd_hms(sobset$datetime)


##Changing mfrow to create a grid
par(mfrow = c(2,2))

##top-left plot
plot(sobset$datetime, sobset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

##top-right plot
plot(sobset$datetime, sobset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

##bottom left plot
plot(sobset$datetime, sobset$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(sobset$datetime, sobset$Sub_metering_2, col = "red")
lines(sobset$datetime, sobset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.75)

##bottom-right plot
plot(sobset$datetime, sobset$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

##Printing the plots
dev.copy(png, file = "Plot 4.png")
dev.off()

