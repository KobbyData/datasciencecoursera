# CodeBook

## Data Source
Original data from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables
- `subject`: Identifier of the subject (1–30)
- `activity`: Type of activity performed
- Remaining variables: mean or standard deviation for each sensor signal (e.g., `tBodyAcc-mean()-X`, `tGravityAcc-std()-Z`, etc.)

## Transformations
1. Merged training and test datasets
2. Extracted measurements of mean and standard deviation
3. Replaced activity codes with descriptive names
4. Renamed variables for clarity
5. Created tidy dataset with average of each variable per subject/activity
