# run_analysis.R

# 1. Load necessary libraries
library(dplyr)

# 2. Download and unzip dataset if not already
if (!file.exists("UCI HAR Dataset")) {
  zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(zipUrl, destfile = "dataset.zip")
  unzip("dataset.zip")
}

# 3. Read data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_code")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_code")

# 4. Merge datasets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subjects <- rbind(subject_train, subject_test)
MergedData <- cbind(Subjects, Y, X)

# 5. Extract mean and standard deviation
selected_features <- grepl("mean\\(\\)|std\\(\\)", features$feature)
selected_columns <- c(TRUE, TRUE, selected_features)
Data <- MergedData[, selected_columns]

# 6. Apply descriptive activity names
Data$activity_code <- activity_labels[Data$activity_code, 2]
names(Data)[2] <- "activity"

# 7. Label dataset with descriptive variable names
names(Data) <- gsub("^t", "Time", names(Data))
names(Data) <- gsub("^f", "Frequency", names(Data))
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))
names(Data) <- gsub("-mean\\(\\)", "Mean", names(Data))
names(Data) <- gsub("-std\\(\\)", "STD", names(Data))
names(Data) <- gsub("-", "", names(Data))

# 8. Create tidy dataset
TidyData <- Data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# 9. Write tidy data to file
write.table(TidyData, "tidy_dataset.txt", row.name = FALSE)
