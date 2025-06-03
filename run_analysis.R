# run_analysis.R

# Load required libraries
library(dplyr)

# Download and unzip the dataset if not already done
filename <- "UCI HAR Dataset.zip"
dataset_folder <- "UCI HAR Dataset"

if (!file.exists(dataset_folder)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = filename)
  unzip(filename)
}

# Load data
features <- read.table(file.path(dataset_folder, "features.txt"))
activities <- read.table(file.path(dataset_folder, "activity_labels.txt"), col.names = c("code", "activity"))

subject_train <- read.table(file.path(dataset_folder, "train", "subject_train.txt"))
x_train <- read.table(file.path(dataset_folder, "train", "X_train.txt"))
y_train <- read.table(file.path(dataset_folder, "train", "y_train.txt"))

subject_test <- read.table(file.path(dataset_folder, "test", "subject_test.txt"))
x_test <- read.table(file.path(dataset_folder, "test", "X_test.txt"))
y_test <- read.table(file.path(dataset_folder, "test", "y_test.txt"))


# 1. Merge the training and the test sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# 2. Extract only the measurements on the mean and standard deviation
mean_std_indices <- grep("mean\\(\\)|std\\(\\)", features$V2)
x_data <- x_data[, mean_std_indices]
names(x_data) <- features$V2[mean_std_indices]

# 3. Use descriptive activity names
y_data[,1] <- activities[y_data[,1], 2]
colnames(y_data) <- "activity"

# 4. Appropriately label the data set
colnames(subject_data) <- "subject"
final_data <- cbind(subject_data, y_data, x_data)

# 5. Create a second tidy data set with the average of each variable for each activity and subject
tidy_data <- final_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)
