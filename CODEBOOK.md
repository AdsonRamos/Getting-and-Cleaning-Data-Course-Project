## Variables
============================================

* fileURL - contains the URL for the zip file
* subject_test - the test file for the subject
* subject_train - the train file for the subject
* subject_data - the subject file binded with the test and train sets

* x_test - the test file for x
* x_train - the train file for x
* x_data - the x file binded with the test and train sets

* y_test - the test file for y
* y_train - the train file for x
* y_data - the y file binded with the test and train sets

* features - the file with the feature names

* activities - the file with the activities names

* indexes - the indexes for the file feature with mean or std in their names

* x_data_with_mean_and_std - read the variable name

* selected_names - a vector containg all the names that satisfied the condition

* entire_data - the entire data binded

* tidy_data - the entire data with a name a little pretty

* final_data - the final data satisfying the condition of step 5

# Modifications
============================================

## Reading the files

* subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
* subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
* x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
* x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
* y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
* y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
* features <- read.table("UCI HAR Dataset/features.txt")
* activities <- read.table("UCI HAR Dataset/activity_labels.txt")
* subject_data <- rbind(subject_train, subject_test)
* x_data <- rbind(x_train, x_test)
* y_data <- rbind(y_train, y_test)

# Updating the names
* selected_names <- features$V2[indexes]
* selected_names <- sub("tBodyAcc-", replacement = "TimeBodyAccelerometer-", x=selected_names)
* selected_names <- sub("tGravityAcc-", replacement = "TimeGravityAccelerometer-", x=selected_names)
* selected_names <- sub("tBodyAccJerk-", replacement = "TimeBodyAccelerometerJerk-", x=selected_names)
* selected_names <- sub("tBodyGyro-", replacement = "TimeBodyGyroscope-", x=selected_names)
* selected_names <- sub("tBodyGyroJerk-", replacement = "TimeBodyGyroscopeJerk-", x=selected_names)
* selected_names <- sub("tBodyAccMag-", replacement = "TimeBodyAccelerometerMagnitude-", x=selected_names)
* selected_names <- sub("tGravityAccMag-", replacement = "TimeGravityAccelerometerMagnitude-", x=selected_names)
* selected_names <- sub("tBodyAccJerkMag-", replacement = "TimeBodyAccelerometerJerkMag-", x=selected_names)
* selected_names <- sub("tBodyGyroMag-", replacement = "TimeBodyGyroscopeMagnitude-", x=selected_names)
* selected_names <- sub("tBodyGyroJerkMag-", replacement = "TimeBodyGyroscopeJerkMagnitude-", x=selected_names)
* selected_names <- sub("fBodyAcc-", replacement = "FrequencyBodyAccelerometer-", x=selected_names)
* selected_names <- sub("fBodyAcc-meanFreq-", replacement = "FrequencyBodyAccelerometer-meanFrequency", x=selected_names)
* selected_names <- sub("fBodyAccJerk-", replacement = "FrequencyBodyAccelerometerJerk-", x=selected_names)
* selected_names <- sub("fBodyGyro-", replacement = "FrequencyBodyGyroscope", x=selected_names)
* selected_names <- sub("fBodyAccMag-", replacement = "FrequencyBodyAccelerometerMagnitude", x=selected_names)
* selected_names <- sub("fBodyBodyAccJerkMag-", replacement = "FrequencyBodyAccelerometerJerkMagnitude-", x=selected_names)
* selected_names <- sub("fBodyBodyGyroMag-", replacement = "FrequencyBodyGyroscopeMagnitude", x=selected_names)
* selected_names <- sub("fBodyBodyGyroJerkMag-", replacement = "FrequencyBodyGyroscopeJerkMagnitude", x=selected_names)


# Getting the data for the final step
* final_data <- entire_data %>% group_by(subject, activity) %>% summarise_all(funs(mean))

# Exporting the final data
* write.table(final_data, "final_data.txt", row.names = FALSE)
