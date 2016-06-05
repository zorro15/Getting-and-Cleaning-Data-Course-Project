This CodeBook describes the transformations that the were done to change the source data from UCI HAR Dataset to a tidy data set.

A) Variables in this script

Xtest is a data frame with the test data measurements

Xtest2 is the mean and sd measurements only with  2947 rows and 62 columns 

features is a file that gives the activity names per activity id, its a feature vector 561 columns

ytest is the activity identifier, also a data frame with 2947 rows and 1 column

subjecttest is the volunteer / subject that carried out the activities, a data frame with 2947 rows and 1 column

Xtrain is the training set of volunteers' measurements, a data frame with 7352 rows and 561 columns

ytrain are the training labels / column names

B) Transformations done in this script

1.file downloaded and unzipped automatically from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
Unzip the file using the unzip function

2.read in the X test file to a df

3.read in the features.txt file to a df

4.make the column v2 into a list so that it can be used as the column headers/variable names for Xtest

5.extract data that has either the mean or std measurements only from Xtest using the grepl search for the col names

6.read in the activity ids to a df

7.read in the volunteer/subject ids to a df

8.give the column in subjecttest a name

9.Get the library(dplyr) to rename the column

10.give ytest columns names

11.read in the activity name and ids to a df using read.table

12.give the variables sensible names in activitylabel df, activityid and activityname

13.to preserve the order of the ytest data match the ids to get the activity name from activitylabel df

14.Bind the columns of the measurements Xtest to the subject Ids to make a new DF, using cbind

15.Bind ytest to TestDF to make a new DF, using cbind

check are there any NAs
colSums(is.na(TestData))

##train data##

1.read in the X test file to a df

2.read in the features.txt file to a df

3.extract data that has either the mean or std measurements only from Xtest using the grepl function

4.read in the volunteer/subject ids to a df

5.give the subject column and name

6.give the ytrain data a column name

7.Bind the columns of the measurements Xtrain to the subject Ids to make a new DF
TrainDF<- cbind(subjecttrain,Xtrain2)

8.Bind ytrain to TrainDF to make a new DF
TrainData<- cbind(TrainDF,ytrain)


###merge the data###
1. install the package(data.table)
library(data.table)

2.Rowbind the test and train data

3.Write table to  "Tidy.txt", this file is in the home directory of r

##the mean of each activity by subject
1. get the data using attach(TidyData, the tidy merged df)

2. get the aggregated means per activity per subject into a data frame aggdata

3.write this to a text file called TidyAverageData.txt



