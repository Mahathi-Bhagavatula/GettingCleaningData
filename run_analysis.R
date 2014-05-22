#####GETTING and Cleaning of Data.

##Assign the working directory if needed.
setwd("E:\\CourseEra\\GettingCleaningData\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset")

##Get the Train and Test data into the required variables.
test<-read.table("test\\X_test.txt")
train<-read.table("train\\X_train.txt")

##Get the labels for Train and Test datasets into variables called 
##train_labels, test_labels respectively.
train_labels <- read.table("train\\y_train.txt")
test_labels <- read.table("test\\y_test.txt")

##Get the subjects for Train and Test datasets into variables called
##train_subject, test_subject respectively.
train_subject <- read.table("train\\subject_train.txt")
test_subject <- read.table("test\\subject_test.txt")

##Get the features in the variable called features.
features <- read.table("features.txt")

##Assign the column names of train and test the features. 
colnames(train) <- features$V2
colnames(test) <- features$V2

##Now, attach the labels and subjects of trainning and testing datasets seperately using 
##using cbind() command.
train<- cbind(train,train_labels,train_subject)
test<- cbind(test,test_labels,test_subject)

##Assign the column names for those datasets using colnames()
colnames(train)[562]<- "labels"
colnames(test)[562]<- "labels"
colnames(train)[563]<- "subjects"
colnames(test)[563]<- "subjects"


##Merge the Datasets:

##Merge the train and test dataset with the help of rbind() command.
##rbind() is preferred over merge as these are just concatination of rows than
##merging the datasets based on a column.

finalDataSet <- rbind(train,test)

##Measurements with Mean and standard deviation :

## Consider second column of features vector, this contains set of features.
##From these set of features, grep the values which has either mean() or std().
##There are other categories of variables applied on angles() variables for which even mean is calculated.
##Consider those by regex 'Mean'.
##Finally by these three regex get the measurements.
measurements <- c(grep("mean\\(\\)",as.character(features$V2),value=TRUE)
                  ,grep("std\\(\\)",as.character(features$V2),value=TRUE)
                  ,grep("Mean",as.character(features$V2),value=TRUE))

##Using Activity Labels && Labelling the DataSet ::

##Get the activity data into a variable called activity.
activity <- read.table("activity_labels.txt",stringsAsFactors=FALSE)

##Now, by iterating through each data label of final dataset, 
##get the activity name for that label and assign it to the label of final data set.
##Thus results in activity_labelled.
finalDataSet$activityLabels <- ""
finalDataSet$activityLabels<- sapply(1:nrow(finalDataSet), function(x){finalDataSet[x,]$activityLabels <- activity[as.numeric(finalDataSet[x,]$labels),]$V2})


##Tidy data Generation ::

##for every subject and every label, get the mean of remaining variables by ignoring the missing values.
##For this use melt and dcast of reshape2 library.
library(reshape2)
dataMelt <- melt(finalDataSet, id.var=c("activityLabels","subjects"))
tidyData <- dcast(dataMelt, subjects + activityLabels ~ variable, fun.aggregate=mean, na.rm=TRUE)

##Put this data into file
write.table(tidyData,file = "tidyData.txt")