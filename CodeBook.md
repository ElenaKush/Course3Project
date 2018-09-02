## This code book describes two datasets:
## 1.df
## 2.tidydf

## The raw data represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
## The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

## The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The df dataset
## The df dataset contains the features came from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ and calculated for each person (30 volonteers) and each activity he/she performed (6 activities).

## So, each row in the df data set reprsents a combination of subject (person), activity he/she performed and a vector of features.
## In the 1st column (subject) there are numbers of subjects (1..30: 30 volunteers within an age bracket of 19-48 years).
## In the 2nd column (activity) there are descriptions of one of six activities the subject performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

## In the following columns there are variables which were collected as following:

## As was said, from each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

## Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

## Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## These signals were used to estimate variables of the feature vector for each pattern:  
## '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## tBodyAcc-XYZ
## tGravityAcc-XYZ
## tBodyAccJerk-XYZ
## tBodyGyro-XYZ
## tBodyGyroJerk-XYZ
## tBodyAccMag
## tGravityAccMag
## tBodyAccJerkMag
## tBodyGyroMag
## tBodyGyroJerkMag
## fBodyAcc-XYZ
## fBodyAccJerk-XYZ
## fBodyGyro-XYZ
## fBodyAccMag
## fBodyAccJerkMag
## fBodyGyroMag
## fBodyGyroJerkMag

## The set of variables that were estimated from these signals are: 

## mean(): Mean value
## std(): Standard deviation

## Notes: 
## - Features are normalized and bounded within [-1,1].


## To create the df dataset was done the following:
## 1. The training and the test sets were merged to create one data set.
## 2. Only the measurements on the mean and standard deviation were extracted for each measurement.
## 3. Descriptive activity names were used to name the activities in the data set
## 4. The data set was appropriately labeled with descriptive variable names.

  
## The tidydf dataset
## The tidydf dataset contains the average of each variable (s. the df dataset) for each activity and each subject.

## The newly calculated variables from the df dataset were renamed by adding a prefix "avgbygroup_".