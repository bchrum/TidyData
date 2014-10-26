
==================================================================
The source of data for the R script provided here is the
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

####  The following describes how the data were gathered ####

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


####  The following describes the processing performed by the run_analysis.R script  ####

run_analysis.R combines the test and train data sets, subsets the resulting combined data set and applies appropriate labels to the variables.  The script requires the following:

Parent directory of the original data set "UCIHARDataset" in R's working directory

Within the "UCIHARDataset" directory, one level down:

 - 'test' and 'train' directories each containing:
    - 'X_test.txt' ('X_train.txt') containing data
    - 'y_test.txt' ('y_train.txt') containing test labels
    - 'subject_test.txt' ('subject_train.txt') containing subject identifiers for each row of data

The script outputs

'movement' - containing mean and standard deviation 3D (X, Y and Z) acceleration readings for 30 subjects performing a variety of activities

'averages' - containing the averages of each variable (mean and standard deviation 3D acceleration) for each of 30 subjects, for each activity.

The script takes as its input a larger data set referenced above that includes over 500 features with readings from multiple time points for each of 30 subjects.  The original data set was broken into training and test sets.  This script combines those data sets, subsets the data to include only mean and standard deviation triaxial acceleration, and labels the activity and variables appropriately in the 'movement' data set.  Finally, the script aggregates (mean) the triaxial mean and standard deviation acceleration values for each subject for each activity in the 'averages' data set.


========


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
