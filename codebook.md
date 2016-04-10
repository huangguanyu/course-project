---
title: "Code Book for Course Project of Getting and Cleaning Data"
output: html_document
---

## Data and Variables
We use Human Activity Recognition Using Smartphones Data Set from University of California in Irvine.
Data are available in: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

* ```x_train```, ```y_train```, ```x_test```, ```y_test```, ```subject_train``` and ```subject_test``` are from the downloaded raw data.
* ```test_data```, ```train_data```  merge the previous data sets to further analysis.
* ```total_data``` merges ```test_data```, ```train_data```.
*```active_labels``` and ```features``` include activity names and feature names, respectively.
* ```mean_std_index``` is the index of mean and standard deviation features that we need.
*```mean_std``` is the data we need that includes only mean and standard deviation measurements.
*```tidy_data``` is mean values for each activity and subject, and stores in ```tidy_data.txt```.

## Identifiers
subject: The ID of test subjects, range from 1 to 30.
activity: The type of activity. Includes:
*WALKING 
*WALKING_UPSTAIRS
*WALKING_DOWNSTAIRS 
*SITTING 
*STANDING 
*LAYING 

## Measurments
The features selected for this database come from the accelerator and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner. frequency of 0.3 Hz.(from readme file of UCI machine learning repository)
```tBodyAcc-XYZ```
```tGravityAcc-XYZ```
```tBodyAccJerk-XYZ```
```tBodyGyro-XYZ```
```tBodyGyroJerk-XYZ```
```tBodyAccMag```
```tGravityAccMag```
```tBodyAccJerkMag```
```tBodyGyroMag```
```tBodyGyroJerkMag```
```fBodyAcc-XYZ```
```fBodyAccJerk-XYZ```
```fBodyGyro-XYZ```
```fBodyAccMag```
```fBodyAccJerkMag```
```fBodyGyroMag```
```fBodyGyroJerkMag```


## Analysis and Feature Selection
```run_analysis.R``` performances the 5-step analysis asked by the course project.

1. Read all files including train and test folders.
2. Merge data using ```rbind()``` and ```cbind()```.
3. Select only mean and standard deviations from the row data set. Then give their names accordingly from ```feautres.txt```
4. Name each activity from ```activity_labels.txt```.
5. Generate a new tidy data set with all average measurements for each subject and activity. The output is ```tidy_data.txt```.
