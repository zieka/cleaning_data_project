cleaning_data_project
=====================

Script to clean the UCI Human Activity Recognition Using Smartphones Dataset found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## run_analysis.R 
returns two files (tidy_data.txt and tidy_data.averages.txt) using the following procedure:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Dependancies
* UCI Human Activity Recognition Using Smartphones Dataset in root directory
* R package "data.table"
