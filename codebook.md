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
*```active_labels``` and ```features``` inlcude activity names and feature names, respectively.
* ```mean_std_index``` is the index of mean and standard deviation features that we need.
*```mean_std``` is the data we need that includes only mean and standard deviation measurements.
*```tidy_data``` is mean values for each activity and subject, and stores in ```tidy_data.txt```.





## Analysis and Feature Selection
```run_analysis.R``` performances the 5-step analysis asked by the course project.

1. Read all files including train and test folders.
2. Merge data using ```rbind()``` and ```cbind()```.
3. Select only mean and standard deviations from the row data set. Then give their names accordingly from ```feautres.txt```
4. Name each activity from ```activity_labels.txt```.
5. Generate a new tidy data set with all average measurements for each subject and activity. The output is ```tidy_data.txt```.
