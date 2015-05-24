# Introduction
These files are used for analysis (under folder `UCI HAR Dataset`):
* train/X_train.txt, train/Y_train.txt, train/subject_train.txt
* test/X_test.txt, test/Y_test.txt, test/subject_test.txt
* activity_labels.txt
* features.txt

# Data
Based on those data files, these data sets are created:
* `activity_test` is from Y_test.txt and `activity_train` is from Y_train.txt. Both are merged into data set `data_activity`
* `subject_test` is from subject_test.txt and `subject_train` is from subject_train.txt. Both are merged into data set `data_subject`
* `feature_test` is from X_test.txt and `feature_train` is from X_train.txt. Both are merged into data set `data_feature`
* `feature_names` contains descriptive name for feature variables
* `activity_names` contains descriptive name for activity variables
* `mean_std_features` contains name of mean and standard deviation measurements (those names with mean() and std())
* `all_data` is a merge result of feature (only selected columns from `mean_std_features`), activity, and subject data sets 

# Variables
These are measurements with mean() and std(). The full explanation can be found in `features_info.txt` from data source folder `UCI HAR Dataset`. 
Term '-XYZ' is used to denote 3-axial signals in the X, Y, and Z directions. In tidy data set, `-XYZ` is split into three different columns with each value. 
`mean()` is mean value and `std()` is standard deviation value.
* timeBodyAccelerometer-mean()-XYZ
* timeBodyAccelerometer-std()-XYZ
* timeGravityAccelerometer-mean()-XYZ
* timeGravityAccelerometer-std()-XYZ
* timeBodyAccelerometerJerk-mean()-XYZ
* timeBodyAccelerometerJerk-std()-XYZ
* timeBodyGyroscope-mean()-XYZ
* timeBodyGyroscope-std()-XYZ
* timeBodyGyroscopeJerk-mean()-XYZ
* timeBodyGyroscopeJerk-std()-XYZ
* timeBodyAccelerometerMagnitude-mean()
* timeBodyAccelerometerMagnitude-std()
* timeGravityAccelerometerMagnitude-mean()
* timeGravityAccelerometerMagnitude-std()
* timeBodyAccelerometerJerkMagnitude-mean()
* timeBodyAccelerometerJerkMagnitude-std()
* timeBodyGyroscopeMagnitude-mean()
* timeBodyGyroscopeMagnitude-std()
* timeBodyGyroscopeJerkMagnitude-mean()
* timeBodyGyroscopeJerkMagnitude-std()
* frequencyBodyAccelerometer-mean()-XYZ
* frequencyBodyAccelerometer-std()-XYZ
* frequencyBodyAccelerometerJerk-mean()-XYZ
* frequencyBodyAccelerometerJerk-std()-XYZ
* frequencyBodyGyroscope-mean()-XYZ
* frequencyBodyGyroscope-std()-XYZ
* frequencyBodyAccelerometerMagnitude-mean()
* frequencyBodyAccelerometerMagnitude-std()
* frequencyBodyAccelerometerJerkMagnitude-mean()
* frequencyBodyAccelerometerJerkMagnitude-std()
* frequencyBodyGyroscopeMagnitude-mean()
* frequencyBodyGyroscopeMagnitude-std()
* frequencyBodyGyroscopeJerkMagnitude-mean()
* frequencyBodyGyroscopeJerkMagnitude-std()

There are 2 other variables included in data set:
* `subject` who performed the activity for each measurement. Its range is from 1 to 30
* `activity` is performed by `subject`. In actual data files, `activity` is written using numeric range 1 to 6. But in tidy data set, we changed the numeric range into their descriptive names taken from `activity_labels.txt` file.


# Methods
Script `run_analysis.R` uses some familiar methods for analysis steps as instructed in Course Project Instruction.
* `read.table()` is used for reading data file
* `rbind()` and `cbind()` are used for merging data sets into one big data set
* `grep()` is used for selecting feature names that contain mean() and std()
* `subset()` is used for extracting selected columns from data set
* `gsub()` is used for regex matching and replacement while labelling data set with descriptive variable names
* `ddply()` is used for splitting data frame, applying `mean()` function for each column selected, and returning a data frame. This function is available in `plyr` package.
