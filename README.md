# Project for the Coursera course Getting and Cleaning Data

### Author: 

Micael Eiji Nagai

### Project problem

You should create one R script called run_analysis.R that does the following.                                              

1. Merges the training and the test sets to create one data set.							   

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### How to run the script

This program use the dataset available from Anguita et al. 2012, so the first step is to download the data (`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`).

Extract the zip file in your working directory and move the train and test directories from `./UCI HAR Dataset/` to the working directory `./`.

Save the `run_analysis.R` to your working directory.

Don't forget to set your working directory on R with the `setwd()` function.

Run `source("run_analysis.R")`, this will create a file `tidy_data.txt` on your working directory, and three objects on R workspace, the `merged_data`, `tidy_data` and `read.data`.


### Output: 

The `merged_data` is a data frame object, that was created with the merging of the test and train measures. This object have 5 variables:
    1. subject: a factor with the subject number;
    2. type: a factor with the values `train` or `test`, which was assigned for each subject;
    3. activities: a factor with the values of the activies;
    4. mean: the mean value for each row of the data from Anguita et al. 2012;
    5. sd: the standard deviation for each row of the data.

The `tidy_data` is a data frame with with the average of each variable for each activity and each subject.

The `read.data` is a function that work with the raw data to create the data frame for the `merged_data`.

The `tidy_data.txt` is created on the working directory with the values of the R object created `tidy_data`.


### Notes:

The data used was collected from

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
