## Getting and Cleaning Data Assignment

Source of the dataset is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

```run_analysis.R``` has been written to perform the following operation
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the Script

1. Download the zip file from the source above. Unzip it into a new folder called ```UCI HAR Dataset```.
2. Set this to the working directory in R or RStudio using the ```setwd()``` function.
3. Save ```run_analysis.R``` in  ```UCI HAR Dataset``` folder.
4. Use ```source("run_analysis.R")```, to run the scrip.
5. This will generate 2 files, cleaned_dataset.txt which is the dataset generated in step 4 above and cleaned_dataset_means.txt which is the second dataset required in step 5 above.

## Dependencies

```run_analysis.R``` depends on ```plyr```, ```reshape2``` and ```data.table```. 