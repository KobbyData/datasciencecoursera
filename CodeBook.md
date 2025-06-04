# CodeBook

This codebook describes the variables, data, and transformations performed to clean the Human Activity Recognition Using Smartphones Dataset.

## Data Source

Original data from: [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Variables

- **subject**: ID of the test subject (1-30)
- **activity**: Activity performed (e.g., WALKING, SITTING, etc.)
- **Measurements**: Averages of selected measurements (mean and standard deviation) from the accelerometer and gyroscope 3-axial raw signals.

## Transformations

1. Merged the training and test datasets.
2. Extracted only mean and standard deviation measurements.
3. Applied descriptive activity names.
4. Cleaned variable names for clarity.
5. Created a new tidy dataset with the average of each variable for each activity and subject.

The final tidy dataset is written to `tidy_dataset.txt`.
