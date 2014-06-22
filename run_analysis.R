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

# Read in features and activities
features <- read.table('./UCI\ HAR\ Dataset/features.txt',header=F);
activity_labels <- read.table('./UCI\ HAR\ Dataset/activity_labels.txt',header=F);

# Read in training data
x_train <- read.table('./UCI\ HAR\ Dataset/train/x_train.txt',header=F);
y_train <- read.table('./UCI\ HAR\ Dataset/train/y_train.txt',header=F);

subject_train <- read.table('./UCI\ HAR\ Dataset/train/subject_train.txt',header=F);

# Read in test data
x_test <- read.table('./UCI\ HAR\ Dataset/test/x_test.txt',header=F);
y_test <- read.table('./UCI\ HAR\ Dataset/test/y_test.txt',header=F);
subject_test <- read.table('./UCI\ HAR\ Dataset/test/subject_test.txt',header=F);





# Merge Data

# Reshape Data

# Save Data