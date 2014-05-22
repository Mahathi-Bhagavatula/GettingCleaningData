Course Project For Getting and Cleaning Data.
=========================================================================================================
 I) **Aim :** 
 
 The main aim of this project is to get a complete idea of preprocessing data (i.e, getting and cleaning). The project also includes a basic idea on functionalities such as merging, manupulating data and generating tidy data.
 
 II)  **Data: Human Activity Recognition Using Smartphones Dataset**
 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

 III) **Features:**
 
The features generated from accelerometer and gyroscope 3-axial raw signals.
The list of features include:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

where tBodyAccJerk-XYZ, tBodyGyroJerk-XYZ indicate body linear acceleration and angular velocity derived in time and tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag the magnitude of the above three-dimensional signals were calculated using the Euclidean norm .
and Fast Fourier Transform (FFT) is applied on these signals to get fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

Note: 't' denotes time and 'f' denotes frequency for the above variables.

 IV)  **Files Used for preprocessing:**
 
The following are the files used throughtout the project:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


 V) **Variables :**
 
The variables that I have used in my code are as below:
- train  : to store train variables from x_train.txt
- test : to store test variables from x_test.txt
- train_labels : to store the values from y_train.txt
- test_labels  : to store the values from y_test.txt
- train_subject  : to store the values from subject_train.txt
- test_subject : to store the values from subject_test.txt
- features : to store the values from features.txt
- finalDataSet : contains the final merge of train and test data.
- measurements : stores the value of all the features which has mean and standard deviation in it.
- activity  : store the values from activity_labels.txt
- finalDataSet$activityLabels : stores the values of activity values with respect to the final dataset.
- dataMelt  : stored the molten value of finalDataSet with activityLabels and subjects as ids.
- tidyData  : stores the mean of each variable w.r.t each activityLabel and each subject.

 VI)  **Data Manipulations:**
 
 -  **Getting Data:** get the data into memory through read.table as the files are tab seperated and make header=FALSE as there is no header present for any of the files.
Assigning Names to columns : As mentioned earlier, as there are no headers for the training and testing datasets, we may need to explicitly assign them using colnames(), and assign the features as colnames for training and testing datasets.
 -  **Combining Columns :** The columns labels and subjects are combined with datasets using cbind(). The names of these columns are assigned again using the colnames() function at a particular index.
 -  **Merging dataset:**The two datasets train and test are merged using rbind().
 -  **Partial Match of Data :** a regex is run on a character vector of all features to see if there is a match  for mean() or std() or Mean. This is done using the function grep. And then these values are appended to a character vector.
 -  **New Column with manupulated values:** a new column activityLabels is added to finalData. This column is filled with activity variables w.r.t the values in labels column based on activity_labels.txt file.
 -  **Melting and Casting:** the finalDataSet is been melted with id variables as 'activity labels' and 'subjects'. This data structure is then used to calculate the mean of all variables for each activity and subject. This is referred to as tidyData in project.
 -  **Writing Data to file :** The values of tidyData are written to a file using write.table() function. 