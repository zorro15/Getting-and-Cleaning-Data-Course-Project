# Getting-and-Cleaning-Data-Course-Project

This file describes the source files, the variables and script used for
Getting and Cleaning Data Coursera Course

The data used in this Data Cleaning Assignment is from
Human Activity Recognition Using Smartphones Dataset
Version 1.0
www.smartlab.ws

==================================================================
Source Data information
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II)on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The source data is here:-
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset given for the assignment includes the following files:

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

==================================================================
Tidying the data for Getting and Cleaning Data Coursera Course
==================================================================
1) Tiday.txt
Tidy is a text file with tiday data , the source files are merged the data such that there is 1 value per column
Also, 1 value per row and sensible column names.

2) run_analysis_script.txt
This script is used to tidy the test data and the train data so that one big set of tidy data is achieved 
Variables in this script
Xtest is the measurements, Xtest2 is the mean and sd measurements only
ytest is the activity identifier
subjecttest is the volunteer / subject that carried out the activities
Same applies to the train data set.

3)CodeBook.rmd
Describes the transformations of the source file to get the data is Tiday.txt

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.



