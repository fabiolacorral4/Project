# Project
The script (run_analysis.R) in this repo performs the following in order to clean data collected with the accelerometers from the Samsung Galaxy S smartphone:

1. Installs and loads the required packages
2. Reads in the files with data and as well as those containing the data's labels
3. Column binds the "train" portion of the data as well as the "test" portion of the data, adding a column that denotes whether a trial was a train or a test trial
4. Merges the rows of the train and test data sets to create a single data set
5. Extracts only the measurements on mean and std dev for each measurement on the original data set
6. Replaces activity number labels with activity names (in column for the activityLabel variable)
7. Creates a separate data set the summarizes the previously cleaned data by stating the average variable value per activity for each subject

The code book (CodeBook.md) in this repo decribes in further detail the variables, the data, and any transformations or work that performed to clean up the data

