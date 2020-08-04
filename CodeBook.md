# Code Book
## Data Set description (from original data set README)
The data used for this project comes from an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.


## Explanation of variables in data set
### Variables 1:3
[1] subjects: subject ID (1-30)
[2] activityLabel: either WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING
[3] trialType: either 1 (train trial) or 2 (test trial)

### Variables 4:82
Contain the average of the mean and standard deviation of each measurement taken for each of the 6 activities performed per subject (including both train and test trials)


## The steps performed to transform and clean the data are as follows:
1. Loaded the dplyr library
2. Read in the files from the original data set containg measurement data and variable labels
3. Column-binded (cbind() )the "train" and "test" data separately, adding a variable that specified whether the data corresponded to a train or test trial in addition to subject ID, activity label, and measurements
4. Merged the rows of the train and test data sets (rbind() ) to create a single data set, making sure to include descriptive variable names (variable names taken from one of the data set's files)
5. Extracted only the variables with the average and standard deviation values for each measurement by using grep() to find those variables that included either 'mean' or 'std' somewhere in their names
6. Using a for-loop, replaced the original number labels decribing the activity perofrmed by the subject in the experiment with the string name of the activity 
7. Grouped the data by subject and then by activity label (using dplyr's group_by() ) and summarized each of the resulting 80 groups (30 subject x 6 activities) to create a tidy data set with the mean for each of the measurements 
8. Wrote the resulting tidy data into a text file called "tidyData.txt"



