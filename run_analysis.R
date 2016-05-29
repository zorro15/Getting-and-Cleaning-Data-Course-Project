#This script is used to tidy the test data and the train data so that one big set of tidy data is achieved 

#Variables in this script
#Xtest is the measurements, Xtest2 is the mean and sd measurements only
#ytest is the activity identifier
#subjecttest is the volunteer / subject that carried out the activities


#file downloaded and unzipped automatically from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="getdata-projectfiles-UCIHARDataset.zip")
unzip("getdata-projectfiles-UCIHARDataset.zip")

#read in the X test file to a df
Xtest = read.table("X_test.txt")
#read in the features.txt file to a df
features = read.table("features.txt")

#make the column v2 into a list so that it can be used as the column headers/variable names for Xtest
colnames(Xtest)<-testcols<-features[,2]
#check the dims
#dim(Xtest)

#extract data that has either the mean or std measurements only from Xtest
Xtest2<- Xtest[,grepl("-mean\\(\\)|-std\\(\\)", names(Xtest))]
#read in the activity ids to a df
ytest = read.table("y_test.txt")
#read in the volunteer/subject ids to a df
subjecttest = read.table("subject_test.txt")
#give the column in subjecttest a name
library(dplyr)
subjecttest <-rename(subjecttest,subjectId=V1)
#give ytest columns names
ytest <-rename(ytest,Id=V1)
#read in the activity name and ids to a df
activitylabel = read.table("activity_labels.txt")
#give the variables sensible names in activitylabel df, activityid and activityname
library(dplyr)
activitylabel<-rename(activitylabel,activityId=V1)
activitylabel<-rename(activitylabel,activityName=V2)

#to preserve the order of the ytest data match the ids to get the activity name from activitylabel df
ytest$activityName<- activitylabel[match(ytest$Id,activitylabel$activityId),2]
#Bind the columns of the measurements Xtest to the subject Ids to make a new DF
TestDF<- cbind(subjecttest,Xtest2)
#Bind ytest to TestDF to make a new DF
TestData<- cbind(TestDF,ytest)

#check are there any NAs
colSums(is.na(TestData))

###train data##

#file downloaded and unzipped manually from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#read in the X test file to a df
Xtrain = read.table("X_train.txt")
#read in the features.txt file to a df
colnames(Xtrain)<-testcols<-features[,2]
#extract data that has either the mean or std measurements only from Xtest
Xtrain2<- Xtrain[,grepl("-mean\\(\\)|-std\\(\\)", names(Xtrain))]
ytrain = read.table("y_train.txt")
#read in the volunteer/subject ids to a df
subjecttrain = read.table("subject_train.txt")
#give the subject column and name
subjecttrain <-rename(subjecttrain,subjectId=V1)
#give the ytrain data a column name
ytrain <-rename(ytrain,Id=V1)
#Bind the columns of the measurements Xtrain to the subject Ids to make a new DF
TrainDF<- cbind(subjecttrain,Xtrain2)
#Bind ytrain to TrainDF to make a new DF
TrainData<- cbind(TrainDF,ytrain)


###merge the data###
install.packages(data.table)
library(data.table)
TidyData<- rbindlist(list(TrainData,TestData))
##write.csv(TidyData, file = "TidyData.csv",row.names=FALSE)
write.table(TidyData, "Tidy.txt", sep="\t", row.names = FALSE)



