# Getting and Cleaning Data - Course Project

This codebook explain, at least try, how the tidy dataset was obtained.

First of all, we download the file using the link that is given in the project description.

## We:
  * merge all the datasets, x, y and subject. 
  * load the features names and activities.
  * extract the indexes for columns that have "mean" and "std" in their names
  
## Modifications
  * For those columns that have mean and std in their names, we extract those columns and change their names for the entire form (fBodyGyro is FrequencyBodyGyroscope).
  * We join the table x with the subject and activities
  * Then, we label the activities with your respctives names
  * We agroup the final data set by activities and subjects and calculate the mean for all of those columns, as requested in the step
