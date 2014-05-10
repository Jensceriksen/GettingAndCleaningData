### This R script tidies a dataset collected from accelerometers
### from the Samsung Galaxy S smartphone. It is required
### that the dataset is in your working directory.
### The script tidies the dataset, by combining the training
### and test sets into one table. Furthermore, the script
### assigns descriptive names to the activities and columns
### of the dataset, as well as extracting data that contains
### means and standarddeviations. 
###
### The final output is a .txt file containing a table 
### with average values of mean and standarddeviation data
### from the original dataset, for each activity and subject.

## Read subject files for test and train and combine them
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")
subjects <- rbind(subject_test, subject_train)
colnames(subjects) <- c("subject")

## Read training and test sets and combine them
x_test <- read.table("./test/X_test.txt")
x_train <- read.table("./train/X_train.txt")
sets <- rbind(x_test, x_train)

## Read training and test labels and combine them
## as well as converting activity column to factor-class
y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")
labels <- rbind(y_test, y_train)

colnames(labels) <- c("activity")

## Merges the subjects, the labels, and the data
complete_data <-  cbind(subjects, labels, sets)

## Names activities from supplied activity_labels.txt file
activitylabels <- read.table("activity_labels.txt")
complete_data$activity <- as.factor(complete_data$activity)
levels(complete_data$activity) <- activitylabels$V2

## Renames all columns to appropiate names from features.txt
columnnames <- read.table("features.txt", stringsAsFactors = FALSE)
names(complete_data) <- c("subject", "activity", columnnames$V2)

## Subsetting data to only include means and standarddeviations
keep_std <- grep("std\\(\\)", names(complete_data))      ## Columns containing standarddeviations
keep_mean <- grep("mean\\(\\)", names(complete_data))    ## Columns containing means
keep_std_mean <- sort(append(keep_std, keep_mean))       ## Columns containing both means and standarddeviations

data_std_mean <- complete_data[,c(1,2,keep_std_mean)]    ## Keeps the two first columns and the means and standarddeviations

## Tidying up data names, by converting to lower case and removing
## parenthesis and hyphens
names(data_std_mean) <- gsub("-", "", names(data_std_mean))
names(data_std_mean) <- gsub("\\(\\)", "", names(data_std_mean))
names(data_std_mean) <- tolower(names(data_std_mean))
 
### This completes the first part of the assignment


## Creates a dataset with the average of each variable for each activity and subject
average_data <- aggregate(data_std_mean[,3:68], by = list(data_std_mean$subject,data_std_mean$activity), FUN = "mean")
names(average_data)[1:2] <- c("subject","activity")

## Writes the data to "tidy_data.txt"
write.table(average_data, "tidy_data.txt")
