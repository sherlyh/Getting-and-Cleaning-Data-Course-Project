library(plyr)

# Assumption: dataset has been downloaded and extracted in working directory
# Set the data path
data_path <- file.path("./UCI HAR Dataset/")

# Step 1:
# Merge training and test sets to create one dataset
# ##################################################
# Read activity files
activity_test <- read.table(file.path(data_path,"test","Y_test.txt"))
activity_train <- read.table(file.path(data_path,"train","Y_train.txt"))

# Read subject files
subject_test <- read.table(file.path(data_path,"test","subject_test.txt"))
subject_train <- read.table(file.path(data_path,"train","subject_train.txt"))

# Read feature files
feature_test <- read.table(file.path(data_path,"test","X_test.txt"))
feature_train <- read.table(file.path(data_path,"train","X_train.txt"))

# Create one data set for activity
data_activity <- rbind(activity_train, activity_test)

# Create one data set for subject
data_subject <- rbind(subject_train,subject_test)

# Create one data set for feature
data_feature <- rbind(feature_train, feature_test)

# Set names to variables
names(data_subject) <- c("subject")
names(data_activity) <- c("activity")
feature_names <- read.table(file.path(data_path,"features.txt"))
names(data_feature) <- feature_names$V2

# Merge dataSubject, dataActivity, and dataFeature into one data frame called alldata
all_data <- cbind(data_subject, data_activity, data_feature)


# Step 2:
# Extracts only the measurements on the mean and standard deviation for each measurement
# ######################################################################################
# Get column from feature_names with mean() or std() only
mean_std_features <- feature_names[grep("(mean|std)\\(\\)", feature_names[,2]), 2]

# Get subset from alldata for subject, activity, mean(), and std() columns only
selected_column <- c("subject", "activity", as.character(mean_std_features))
all_data <- subset(all_data, select = selected_column)


# Step 3:
# Uses descriptive activity names to name the activities in the data set
# ######################################################################
activity_names <- read.table(file.path(data_path,"activity_labels.txt"))

#Update value in activity column with descriptive activity name
all_data[,2] <- activity_names[all_data[,2], 2]


# Step 4:
# Appropriately labels the data set with descriptive variable names
# #################################################################

# From features_info.txt we get some descriptive names:
# t = time
# f = frequency
# Acc = Accelerometer
# Gyro = Gyroscope
# Mag = Magnitude
# BodyBody is replaced by Body
# Since subject and activity columns have been given descriptive names, we will
# give descriptive name to column of features
names(all_data) <- gsub("^t", "time", names(all_data))
names(all_data) <- gsub("^f", "frequency", names(all_data))
names(all_data) <- gsub("Acc", "Accelerometer", names(all_data))
names(all_data) <- gsub("Gyro", "Gyroscope", names(all_data))
names(all_data) <- gsub("Mag", "Magnitude", names(all_data))
names(all_data) <- gsub("BodyBody", "Body", names(all_data))


# Step 5:
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
# Take only column 3-68 (column of features)
# ############################################################################
tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 3:68]))
write.table(tidy_data, file="tidy_average_data.txt", row.name=FALSE)
