## install/load required packages
library(dplyr)
## read in files
subjects_train <- read.delim("./train/subject_train.txt", header = FALSE)
act_label_train <- read.delim("./train/y_train.txt", header = FALSE)
features_train <- read.table("./train/x_train.txt", sep = "")
subjects_test <- read.delim("./test/subject_test.txt", header = FALSE )
act_label_test <- read.delim("./test/y_test.txt", header = FALSE)
features_test <- read.table("./test/x_test.txt", sep = "")
## cbind train and test cols and add "train" or "test" level to each data set
trainCols <- cbind(subjects_train, act_label_train, trialType = 
                       rep(1, nrow(subjects_train)), features_train)
testCols <- cbind(subjects_test, act_label_test, trialType = 
                      rep(2, nrow(subjects_test)), features_test)
## merge rows of train and test data sets 
## using descriptive variable names
data <- rbind(trainCols, testCols)
featureNames <- read.table("./features.txt", header=FALSE)
featureNames <- featureNames[,2]
names(data) <- c("subjects", "activityLabel", "trialType", featureNames) 
## extract only measurements on mean and std dev for each measurement
data <- data[,c(1:3, grep("mean|std", names(data)))]
## use descriptive activity names to name the activities in the data set
actNames <- read.table("./activity_labels.txt") ## load activity names
for(i in 1:nrow(actNames)){ ## replace numbers in activity label col
    data$activityLabel[data$activityLabel == actNames[i, 1]] = actNames[i, 2]
}
## 3-data set with avg for each variable per activity and subject
data_grouped <- group_by(data, subjects, activityLabel, .add = TRUE)
data_grouped <- summarise_each(data_grouped, mean)
