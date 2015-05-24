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
* `mean_std_features` contains names of mean and standard deviation measurement (those names with mean() and std())
* `all_data` is merge result of feature (only selected columns from `mean_std_features`), activity, and subject data sets 

# Variables

# Methods