#
# run_analysis.R
#
# Copyright (C) 2014 Kyle Scully
#
# Author(s)/Maintainer(s):
# Kyle Scully
#
# This script does the following:
#
#  * Merges the training and the test sets to create one data set.
#
#  * Extracts only the measurements on the mean and standard
#  deviation for each measurement.
#
#  * Uses descriptive activity names to name the activities in the
#  data set
#
#  * Appropriately labels the data set with descriptive variable
#  names.
#
#  * Creates a second, independent tidy data set with the average of
#  each variable for each activity and each subject.
#

#Package included for ease of renaming columns
library(data.table)

#@READ DATA
#############

#Read in features and activities
features <- read.table('./UCI\ HAR\ Dataset/features.txt',header=F);
activity_labels <- read.table('./UCI\ HAR\ Dataset/activity_labels.txt',header=F);

#Read in training data
x_train <- read.table('./UCI\ HAR\ Dataset/train/x_train.txt',header=F);
y_train <- read.table('./UCI\ HAR\ Dataset/train/y_train.txt',header=F);
subject_train <- read.table('./UCI\ HAR\ Dataset/train/subject_train.txt',header=F);

#Read in test data
x_test <- read.table('./UCI\ HAR\ Dataset/test/x_test.txt',header=F);
y_test <- read.table('./UCI\ HAR\ Dataset/test/y_test.txt',header=F);
subject_test <- read.table('./UCI\ HAR\ Dataset/test/subject_test.txt',header=F);

#@MERGE DATA
#############

#Merge columns of training set
complete_train <- cbind(x_train, y_train, subject_train)

#Merge columns of training set
complete_test <- cbind(x_test, y_test, subject_test)

#Merge training data and test data
merged_data <- rbind(complete_train, complete_test)

#Give Columns descriptive names from features.txt
colnames(merged_data) = features[,2]

#@SUBSET DATA
##############

#Vector of columns we want to extract (only mean and standard deviation measurements)
subset_columns <- grep("*[Mm]ean*|*[Ss]td*", features[,2])

#Still want to keep the last two "subject" columns
subset_columns <- c(subset_columns, 562, 563)

#Rename the columns the last two columns
setnames(merged_data,562:563,c("ActivityID","SubjectID"))

#Subset the data with our vector
merged_data <- merged_data[, subset_columns]

#@TIDY UP DATA
##############

#replace activityID with descriptive activity name from activity_labels.txt
colnames(activity_labels) = c("ActivityID","Activity")
merged_data <- merge(merged_data,activity_labels,by='ActivityID',all.x=TRUE);

#write cleaned data to file
write.table(merged_data, "./tidy_data.txt")

#@PRODUCE TIDY DATA w/ AVERAGES
###############################
merged_data <- aggregate(merged_data, by=list(Activity = merged_data$Activity, SubjectID=merged_data$SubjectID), mean)
merged_data[,91] <- NULL
merged_data[,90] <- NULL
merged_data[,3] <- NULL
write.table(merged_data, "./tidy_data_averages.txt")