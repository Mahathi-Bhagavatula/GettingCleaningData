README.md
==========================================================================================================
 ** Aim :  ** This file explain the usage of file run_analysis.R. 

The working directory should be properly given till the path of 'UCI HAR Dataset' folder. Hence the datasets can be loaded thereon.

load the function run_analysis.R using the following function
source("run_analysis.R")

This program gives many intermediate results like :
printing of the following variables will give the intermediate results:
1) finalDataSet : merged data to get a overview of the data.
2) measurements : to get the features having mean(), std(), Mean strings in it.
3) finalDataSet$activityLabels : having the activity label attached to the finalDataSet.
4) tidyData : the data which has averages for each variable with each activity and subject as parameters.

These are the results needed as output which can be accessed by printing them.

**Dependencies : **
The program need to be executed in the order provided in the script file. As each variable is dependent on its previous variable.
1) Like for merging the dataset, it depends on all train, test, train_labels, test_labels, train_subject, test_subject and features.
2) For getting the measurements, it depends only on features variable.
3) finalDataSet$activityLables again depend on all of (1) and activity variable.
4) tidyData depends on all the above mentioned variables.

Hence for one to execute 1,3,4 steps, they need to be in order. However 2 can be performed without any dependency.

