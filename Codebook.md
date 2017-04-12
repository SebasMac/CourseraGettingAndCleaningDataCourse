# CodeBook

This CodeBook file summarizes the resulting data fields in `tidy.txt`, giving a bit of context to understand how the column names are related to the original variables and explaining the transformations performed to obtain such variables.



## The data source

The UCI provides the following information about original data set named [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

As for the project the original data has been mada available through this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



## The data

The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.



## Data process details in order to obtain the file 'tidy.txt'

Original data sets have been processed using the code contained in 'run_analysis.R' file, that basically does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

As a result of such processing the following variables are contained in 'tidy.txt':


```

 [1] "Activity"                                              
 [2] "Subject"                                               
 [3] "mean_of_timeBodyAccelerometerMeanX"                    
 [4] "mean_of_timeBodyAccelerometerMeanY"                    
 [5] "mean_of_timeBodyAccStandardDevX"                       
 [6] "mean_of_timeBodyAccStandardDevY"                       
 [7] "mean_of_timeGravityAccelerometerMeanX"                 
 [8] "mean_of_timeGravityAccelerometerMeanY"                 
 [9] "mean_of_timeGravityAccStandardDevX"                    
[10] "mean_of_timeGravityAccStandardDevY"                    
[11] "mean_of_timeBodyAccJerkMeanX"                          
[12] "mean_of_timeBodyAccJerkMeanY"                          
[13] "mean_of_timeBodyAccJerkStandardDevX"                   
[14] "mean_of_timeBodyAccJerkStandardDevY"                   
[15] "mean_of_timeBodyGyroscopeMeanX"                        
[16] "mean_of_timeBodyGyroscopeMeanY"                        
[17] "mean_of_timeBodyGyroscopeStandardDevX"                 
[18] "mean_of_timeBodyGyroscopeStandardDevY"                 
[19] "mean_of_timeBodyGyroscopeJerkMeanX"                    
[20] "mean_of_timeBodyGyroscopeJerkMeanY"                    
[21] "mean_of_timeBodyGyroscopeJerkStandardDevX"             
[22] "mean_of_timeBodyGyroscopeJerkStandardDevY"             
[23] "mean_of_timeBodyAccelerometerMagnitudeMean"            
[24] "mean_of_timeBodyAccelerometerMagnitudeStandardDev"     
[25] "mean_of_timeGravityAccelerometerMagnitudeMean"         
[26] "mean_of_timeGravityAccelerometerMagnitudeStandardDev"  
[27] "mean_of_timeBodyAccJerkMagnitudeMean"                  
[28] "mean_of_timeBodyAccJerkMagnitudeStandardDev"           
[29] "mean_of_timeBodyGyroscopeMagnitudeMean"                
[30] "mean_of_timeBodyGyroscopeMagStandardDev"               
[31] "mean_of_timeBodyGyroscopeJerkMagnitudeMean"            
[32] "mean_of_timeBodyGyroscopeJerkMagnitudeStandardDev"     
[33] "mean_of_frequencyBodyAccelerometerMeanX"               
[34] "mean_of_frequencyBodyAccelerometerMeanY"               
[35] "mean_of_frequencyBodyAccStandardDevX"                  
[36] "mean_of_frequencyBodyAccStandardDevY"                  
[37] "mean_of_frequencyBodyAccJerkMeanX"                     
[38] "mean_of_frequencyBodyAccJerkMeanY"                     
[39] "mean_of_frequencyBodyAccJerkStandardDevX"              
[40] "mean_of_frequencyBodyAccJerkStandardDevY"              
[41] "mean_of_frequencyBodyGyroscopeMeanX"                   
[42] "mean_of_frequencyBodyGyroscopeMeanY"                   
[43] "mean_of_frequencyBodyGyroscopeStandardDevX"            
[44] "mean_of_frequencyBodyGyroscopeStandardDevY"            
[45] "mean_of_frequencyBodyAccelerometerMagnitudeMean"       
[46] "mean_of_frequencyBodyAccelerometerMagnitudeStandardDev"
[47] "mean_of_frequencyBodyAccJerkMagnitudeMean"             
[48] "mean_of_frequencyBodyAccJerkMagnitudeStandardDev"      
[49] "mean_of_frequencyBodyGyroscopeMagnitudeMean"           
[50] "mean_of_frequencyBodyGyroscopeMagStandardDev"          
[51] "mean_of_frequencyBodyGyroscopeJerkMagnitudeMean"       
[52] "mean_of_frequencyBodyGyroscopeJerkMagnitudeStandardDev"

```