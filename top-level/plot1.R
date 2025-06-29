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
png("plot1.png", width = 480, height = 480)

# Plot Voltage
plot(datetime, subset_data$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

# Close PNG device
dev.off()
