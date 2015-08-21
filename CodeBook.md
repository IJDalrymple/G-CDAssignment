# CodeBook

This  code book describes the variables and transformations pertaining to the ```run_analysis.R``` code.
The variables in the original data set are rescribed in the README file within that dataset.

## The data source

* Source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* There is a description of the data available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## The data

Once unzipped, the dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Transformation details - data cleaning

There are 5 parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement type.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Outputs
### cleaned_dataset.txt
A labeled and cleaned dataset which is composed of both the training and test dataset, containing only the mean and standard deviation for each measurement. 

### cleaned_dataset_means.txt
A tidy dataset with only the averages of each variable for each activity for each subject.

The column names for both datasets have been derived from the features.txt file but cleaned. Brackets have been removed, hyphens have been removed and the M in mean and S in Std have been capitalised. 