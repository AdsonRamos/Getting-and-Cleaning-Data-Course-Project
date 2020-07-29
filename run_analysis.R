library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, "Coursera_Data_Course_Project.zip")

unzip("Coursera_Data_Course_Project.zip")

# load subject data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# load x data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

#load y data
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# loading the features
features <- read.table("UCI HAR Dataset/features.txt")

# loading the activity
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# binding sets
subject_data <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# getting the indexes with mean and standard deviation(std)
indexes <- grep("mean|std", features$V2)

# getting only the columns that have those indexes
x_data_with_mean_and_std <- x_data[,indexes]

# getting the index names of all that columns that contains mean or standart deviation
selected_names <- features$V2[indexes]

# upgrading the names
selected_names <- sub("tBodyAcc-", replacement = "TimeBodyAccelerometer-", x=selected_names)
selected_names <- sub("tGravityAcc-", replacement = "TimeGravityAccelerometer-", x=selected_names)
selected_names <- sub("tBodyAccJerk-", replacement = "TimeBodyAccelerometerJerk-", x=selected_names)
selected_names <- sub("tBodyGyro-", replacement = "TimeBodyGyroscope-", x=selected_names)
selected_names <- sub("tBodyGyroJerk-", replacement = "TimeBodyGyroscopeJerk-", x=selected_names)
selected_names <- sub("tBodyAccMag-", replacement = "TimeBodyAccelerometerMagnitude-", x=selected_names)
selected_names <- sub("tGravityAccMag-", replacement = "TimeGravityAccelerometerMagnitude-", x=selected_names)
selected_names <- sub("tBodyAccJerkMag-", replacement = "TimeBodyAccelerometerJerkMag-", x=selected_names)
selected_names <- sub("tBodyGyroMag-", replacement = "TimeBodyGyroscopeMagnitude-", x=selected_names)
selected_names <- sub("tBodyGyroJerkMag-", replacement = "TimeBodyGyroscopeJerkMagnitude-", x=selected_names)
selected_names <- sub("fBodyAcc-", replacement = "FrequencyBodyAccelerometer-", x=selected_names)
selected_names <- sub("fBodyAcc-meanFreq-", replacement = "FrequencyBodyAccelerometer-meanFrequency", x=selected_names)
selected_names <- sub("fBodyAccJerk-", replacement = "FrequencyBodyAccelerometerJerk-", x=selected_names)
selected_names <- sub("fBodyGyro-", replacement = "FrequencyBodyGyroscope", x=selected_names)
selected_names <- sub("fBodyAccMag-", replacement = "FrequencyBodyAccelerometerMagnitude", x=selected_names)
selected_names <- sub("fBodyBodyAccJerkMag-", replacement = "FrequencyBodyAccelerometerJerkMagnitude-", x=selected_names)
selected_names <- sub("fBodyBodyGyroMag-", replacement = "FrequencyBodyGyroscopeMagnitude", x=selected_names)
selected_names <- sub("fBodyBodyGyroJerkMag-", replacement = "FrequencyBodyGyroscopeJerkMagnitude", x=selected_names)

# changing the names of the x_data
names(x_data_with_mean_and_std) <- selected_names

#binding the columns of the selected x_data, y_data, and subjects
entire_data <- cbind(subject_data, y_data, x_data_with_mean_and_std)

# renaming the two first columns
names(entire_data)[1] <- "subject"
names(entire_data)[2] <- "activity"

# adjusting the names of the column activity
entire_data$activity <- activities[entire_data$activity,]$V2

tidy_data <- entire_data

# getting the data for the final step
# we will need the dplyr lib to use group by function

final_data <- entire_data %>% group_by(subject, activity) %>% summarise_all(funs(mean))





