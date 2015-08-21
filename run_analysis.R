## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require(plyr)
require(reshape2)
require(data.table)

setwd("~/Coursera/GCD/UCI HAR Dataset")

#Read the data files and give appropriate names
X_train_data<-read.table("train/X_train.txt")
y_train_data<-read.table("train/Y_train.txt")
Sub_train_data<-read.table("train/subject_train.txt")
X_test_data<-read.table("test/X_test.txt")
y_test_data<-read.table("test/y_test.txt")
Sub_test_data<-read.table("test/subject_test.txt")
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")

## 1. Merges the training and the test sets to create one data set.
join_train_test<-rbind(X_train_data, X_test_data)
join_subjects<-rbind(Sub_train_data, Sub_test_data)
join_labels<-rbind(y_train_data,y_test_data)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean_stdev_r <- grep("mean\\(\\)|std\\(\\)", features[, 2])
join_tt_ms<-join_train_test[,mean_stdev_r]

## clean up the names in the joined dataset, remove "()", capitalise M and S in mean and std and remove "-"
names(join_tt_ms) <- gsub("\\(\\)", "", features[mean_stdev_r, 2])
names(join_tt_ms) <- gsub("mean","Mean",names(join_tt_ms))
names(join_tt_ms) <- gsub("std","Std",names(join_tt_ms))
names(join_tt_ms) <- gsub("-","",names(join_tt_ms))

## 3. Uses descriptive activity names to name the activities in the data set
## clean up the names in the activity labels dataset
activity_labels[,2]<-tolower(gsub("_","",activity_labels[,2]))
substr(activity_labels[2, 2], 8, 8) <- toupper(substr(activity_labels[2, 2], 8, 8))
substr(activity_labels[3, 2], 8, 8) <- toupper(substr(activity_labels[3, 2], 8, 8))

## create descriptive activity names
activity_names<-activity_labels[join_labels[,1],2]
join_labels[,1]<-activity_names
names(join_labels)<-"activity"

## name the subject data
names(join_subjects)<-"subject"

## 4. Appropriately labels the data set with descriptive activity names.
final_data<-cbind(join_subjects, join_labels,join_tt_ms)
write.table(final_data, "cleaned_dataset.txt",row.names=FALSE)

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## calculate number of rows (=number of subjects x number of activities)
no_subjects<-length(table(join_subjects))
no_activities<-dim(activity_labels)[1]
no_rows<-no_subjects*no_activities
## number of columns is the same as the final_data variable
no_cols<-dim(final_data)[2]
## create empty data frame for the cleaned dataset and name them the same
cleaned_data<-matrix(NA, nrow=no_rows, ncol=no_cols)
cleaned_data<-as.data.frame(cleaned_data)
colnames(cleaned_data)<-colnames(final_data)

## populate matrix with column averages for each subject and activity for every variable in the final_data variable
crow<-1
for(i in 1:no_subjects) {
  for(j in 1:no_activities) {
    cleaned_data[crow, 1] <- sort(unique(join_subjects)[, 1])[i]
    cleaned_data[crow, 2] <- activity_labels[j, 2]
    ifs1 <- i == final_data$subject
    ifs2 <- activity_labels[j, 2] == final_data$activity
    cleaned_data[crow, 3:no_cols] <- colMeans(final_data[ifs1&ifs2, 3:no_cols])
    crow <- crow + 1
  }
}

write.table(cleaned_data, "cleaned_dataset_means.txt", row.names=FALSE)














