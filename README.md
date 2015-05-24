Coursera Getting and Cleaning Data Course Project
=================================================
This is repository for Coursera Getting and Cleaning Data Course Project. It has R script, documentation files and tidy data set file.

#Data set
Data set that is used for this project can be obtained from 
```
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
```
Assumption for this project: data set has been downloaded, unzipped and stored in working directory under folder `UCI HAR Dataset`

#Script
Script `run_analysis.R` contains code to perform data analysis required for the project in five steps:
* Merge training and test sets into one data set
* Extract only measurements on the mean and standard deviation for each measurement
* Give descriptive activity names to name the activities in the data set
* Give appropriate labels the data set with descriptive variable (subject, activity, and measurement) names. 
* Create a second, independent tidy data set with the average of each measurement for each activity and each subject. 

#Code book
`CodeBook.md` file gives more explanation about variables, data, and methods performed for analysis.

#Tidy data
File `tidy_average_data.txt` is written using `write.table()` function. Here is a good way to read the contents (using RStudio or RGui is OK)
```
url <- "https://s3.amazonaws.com/coursera-uploads/user-81302c74abd788123e91d270/973501/asst-3/6487e3f001d411e5a980bfc16f578c74.txt" #This is file I submitted for Course Project
url <- sub("^https", "http", url)
data <- read.table(url(url), header = TRUE) 
View(data)
```

#Thank you
I found these threads helped me a lot to do this project
* https://class.coursera.org/getdata­014/forum/thread?thread_id=30
* https://class.coursera.org/getdata­014/forum/thread?thread_id=31

Thank you for David Hood and everyone that have participated in the discussion forum