#run boy run

# Load the data sets
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <-read.table("./UCI HAR Dataset/activity_labels.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Merges the training and the test sets to create one data set.
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject<- rbind(subject_train, subject_test)

# Uses descriptive activity names to name the activities in the data set
names(x) <- features$V2

# Appropriately labels the data set with descriptive activity names. 
yLabeled <- merge(x = y, y = activityLabels, by = "V1", all.x=TRUE)
names(yLabeled) <- c("Activity Num","Activity")
names(subject) <- c("Subject")
df <- cbind(subject,yLabeled[2],x)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
meanIndex <- grep(c("mean()"), names(df))
stdIndex <- grep(c("std()"), names(df))
df <- df[c(1:2, meanIndex, stdIndex)]

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
resultsAverage <- aggregate(df[3:length(df)], by=list(df$"Subject",df$"Activity"), mean)
names(resultsAverage) <- names(df)

print(resultsAverage)