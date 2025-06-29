# Load data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for 2007-02-01 and 2007-02-02
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create Datetime column
datetime <- strptime(paste(subset_data$Date, subset_data$Time),
                     format = "%Y-%m-%d %H:%M:%S")

# Open PNG device
png("plot4.png", width = 480, height = 480)

# Set 2x2 plotting layout
par(mfrow = c(2, 2))

## Plot 1: Global Active Power
plot(datetime, subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

## Plot 2: Voltage
plot(datetime, subset_data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

## Plot 3: Energy Sub Metering
plot(datetime, subset_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, subset_data$Sub_metering_2, col = "red")
lines(datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")  # no box around legend

## Plot 4: Global Reactive Power
plot(datetime, subset_data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")

# Close PNG device
dev.off()
