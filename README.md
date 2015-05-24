Coursera Getting and Cleaning Data Course Project
=================================================
This is repository for Coursera Getting and Cleaning Data Course Project. It has R script, documentation files and tidy data set file.

#Data set
Data set that is used for this project can be obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Assumption for this project: dataset has been downloaded, unzipped and stored in working directory under folder `UCI HAR Dataset`

#Script
Script `run_analysis.R` contains code to perform data analysis required for the project in five steps:
* Merge training and test sets into one data set
* Extract only measurements on the mean and standard deviation for each measurement
* Give descriptive activity names to name the activities in the data set
* Give appropriate labels the data set with descriptive variable (subject, activity, and measurement) names. 
* Create a second, independent tidy data set with the average of each measurement for each activity and each subject. 