# Getting and Cleaning Data Course: Final Project

## Brief Description of the Project Assignment

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data set for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Summary of the data analysis (Also see the script "run_analysis.R")

When the the data from the file 'UCI HAR Dataset.zip' is unzipped, all data files can be found in the directory 'UCI HAR Dataset'. Throughout the following discussion, we will assume that the script 'run_analysis.R' is stored in that same directory.

'run_analysis.R' is the script that performs all the stages of data analysis on the provided raw data. It follows the five steps described above. Let us elaborate on every given part of the process:

### PART 0: Preparations:

* Read the activity labels and store the result in 'activity_labels'.
* Read the feature names and store the result in 'feature_names'
* Read the feature names and store the result in 'feature_names'
* Read the training set of feature vecors and store the result in 'X_train'
* Read the training set of labels and store the result in 'y_train'
* Read the list of subjects (persons) associated with each observation in the training set and store the result in 'subject_train'
* Read the test set of feature vecors and store the result in 'X_test'
* Read the test set of labels and store the result in 'y_test'
* Read the list of subjects (persons) associated with each observation in the test set and store the result in 'subject_test'

### PART 1. Merge the training and the test sets to create one data set.

* Merge the feature and label training sets (using column binding) in one data frame: 'xy_train'
* Merge the feature and label test sets (using column binding) in one data frame: 'xy_test'
* Merge the train and test sets. This time we have to use the row binding. Store the result in the data frame 'xy_all'

### PART 2. Extract only the measurements on the mean and  standard deviation for each measurement.

* First, let's make a list of columns (variables) we want to extract. We are interested in all names that contain either "mean()" or "std()". Store the result in 'means_stds_feature_index'
a) Extract the columns with mean() and std(), PLUS the activity (column #562) and the subject (column #563) labels.
b) Save the result in the new data frame 'xy_all_means_stds'

##### NOTE: According to the previous step, there are 66 variables related to the means and standard deviations.

### PART 3: Use descriptive activity names to name the activities in the data set

##### NOTE: I chose not to create another column that would have explicit activity names, to avoid redundancy. Instead, I replace the numeric labels with strings of activity names.

* "V1.1" is the name of the last coulm, which contains the activity label
* Replace the number with an explicit name and stroe the result in the existing data frame 'xy_all_means_stds'

### PART 4: Appropriately label the data set with descriptive variable names.

##### NOTE:  Since we plan on using these feature names to properly label the variables (AKA features) in the data frame, let's "clean them up", in the same spirit it was discussed in Week 4 of this course.

* Get rid of hyphens and parantheses in variable names and store the result in the existing vector 'means_stds_feature_names'

### PART 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##### NOTE:  We will use "dplyr" package in this section.

* Group the data frame by the activity (using 'dplyr::group_by') and the subject and store the result in 'xy_all_means_stds_grouped'
* Apply the dplyr function 'summarise_each' and store the result in 'var_averages'

### Save the final data set in a txt-file "Final_Tidy_Data_Set.txt"