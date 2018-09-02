##Setting a new working directory
getwd()
setwd("./GitHub/JH_R_Course/Course 3/Week4/Project3.1")

## Downloading a dataset
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "Dataset.zip")

## Unzipping files
unzip("Dataset.zip", exdir="Dataset")

## Checking files and folders inside:
list.files("./Dataset")
list.files("./Dataset/UCI HAR Dataset")
list.files("./Dataset/UCI HAR Dataset/train")
list.files("./Dataset/UCI HAR Dataset/train/Inertial Signals")
list.files("./Dataset/UCI HAR Dataset/test")
list.files("./Dataset/UCI HAR Dataset/test/Inertial Signals")

##Loading datasets  
features <- read.table("./Dataset/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./Dataset/UCI HAR Dataset/activity_labels.txt")
X_train <- read.table("./Dataset/UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./Dataset/UCI HAR Dataset/test/X_test.txt")
train_labels <- read.table("./Dataset/UCI HAR Dataset/train/y_train.txt")
test_labels <- read.table("./Dataset/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./Dataset/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./Dataset/UCI HAR Dataset/test/subject_test.txt")

## Merging the training and the test sets to create one data set
X <- rbind(X_train, X_test)
labels <- rbind(train_labels, test_labels)
subject <- rbind(subject_train, subject_test)
df <- cbind(subject, labels, X)

## Labeling the data set with descriptive variable names.
colnames(df) <- c("subject", "label_num", as.character(features$V2))

## Extracting only the measurements on the mean and standard deviation for each measurement.
col_ind <- grep("[m][e][a][n][(]|std", names(df)) ## Extracting indices of columns whith contain "mean(" or "std" in name 
df <- df[ , c(1,2, col_ind)]        ## Leaving appropriate columns

## Using descriptive activity names to name the activities in the data set
df <- merge(activity_labels, df, by.x = "V1", by.y = "label_num", all = TRUE)[ , -1] ## Merging datasets and leaviang only appropriate columns
dfnames <- names(df)
dfnames <- sub("V2", "activity", dfnames) ## Changing the name of column from dataset "activity_labels"
colnames(df) <- dfnames
library(dplyr)
df <- select(df, 2, 1, 3:ncol(df))  ## Changing an order of columns

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydf <- df %>%
  group_by(subject, activity) %>%   ## Grouping by activities and subjects
  summarise_all(mean) %>%           ## Calculating a mean for each variable splitted by defined groups
  arrange(subject, activity)        ## Sorting data set by subjects and activities

## Renaming columns in the tidy data set
newcolname <- "avgbygroup_"
tidydfnames <- paste0(newcolname, names(tidydf[3:ncol(tidydf)]))
tidydfnames <- c(names(tidydf[1:2]), tidydfnames)
colnames(tidydf) <- tidydfnames

head(tidydf)                        ## Printing a head of the tidy dataset
head(df)                            ## Printing a head of the tidy dataset
write.table(tidydf, "./Course3Project/tidydf.txt", row.name=FALSE)
