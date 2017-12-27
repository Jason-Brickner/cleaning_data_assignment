Getting and Cleaning Data Course Project
==================================================================

Primary data was from the UC Irvine data derived from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years [1]. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The training and test datasets were combined.  The subject and activity variables were added.  A subset of 79 of the 561 variables from the combined dataset (those representing the means and standard deviations) were extracted and informatively labeled to create a new data frame of 10299 observations.  The average for each variable was calculated for each activity and each subject, producing a data frame of 180 observations of 79 variables for each of the 30 subjects performing each of the six activities.  The final data frame was saved as "means_by_subject_activity.txt".

Data:
======================================

- The mean of each of 79 variables.
- An identifier of the subject who carried out the experiment.
- Its activity label. 

The dataset includes the following files:
=========================================

- 'README.txt'
- 'Codebook.txt': description of the variable names


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
