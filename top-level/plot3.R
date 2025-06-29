# Load data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

# Convert Date column to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for 1st and 2nd February 2007
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create Datetime column
datetime <- strptime(paste(subset_data$Date, subset_data$Time),
                     format = "%Y-%m-%d %H:%M:%S")

# Open PNG device
png("plot3.png", width = 480, height = 480)

# Plot Sub_metering_1
plot(datetime, subset_data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering", 
     col = "black")

# Add Sub_metering_2
lines(datetime, subset_data$Sub_metering_2, col = "red")

# Add Sub_metering_3
lines(datetime, subset_data$Sub_metering_3, col = "blue")

# Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

# Close PNG device
dev.off()
