#set working directory
setwd("/Users/mengdiyue/Downloads/UCI-HAR")

#1. Merge the training and test sets to create one data set

#read in the datasets
xTest <- read.table("./test/x_test.txt")
yTest <- read.table("./test/y_test.txt")
xTrain <- read.table("./train/x_train.txt")
yTrain <- read.table("./train/y_train.txt")
SubjectTest <- read.table("./test/subject_test.txt")
SubjectTrain <- read.table("./train/subject_train.txt")
features <- read.table("features.txt")

#change column names of datasets
colnames(xTest) <- features[,2]
colnames(xTrain) <- features[,2]
colnames(yTest) <- "ActivityLabel"
colnames(yTrain) <- "ActivityLabel"
colnames(SubjectTest) <- "SubjectLabel"
colnames(SubjectTrain) <- "SubjectLabel"

#merge test and train datasets respectively
TestMerge <- cbind(SubjectTest, yTest, xTest)
TrainMerge <- cbind(SubjectTrain, yTrain, xTrain)

#combine test and train data into one dataset
HARData <- rbind(TestMerge, TrainMerge)
rownames(HARData) <- NULL

#2. Extracts only the measurements on the mean and standard deviation for each measurement
MeanStd <- (grepl("ActivityLabel", colnames(HARData)) | grepl("SubjectLabel", colnames(HARData)) | grepl("-mean()", colnames(HARData)) | grepl("-std()", colnames(HARData)))
HARData <- HARData[MeanStd == TRUE]

#3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("./activity_labels.txt")
library(dplyr)
activity <- rename(activity, ActivityLabel = V1, Activity = V2)
HARData <- merge(activity, HARData, by = "ActivityLabel")

#4. Appropriately labels the data set with descriptive variable names
ColNames <- names(HARData)

#replace strings to optimize the names of column variables
ColNames <- gsub("Acc", "Acceleration", ColNames) 
ColNames <- gsub("Mag", "Magnitude", ColNames)  
ColNames <- gsub("BodyBody", "Body", ColNames)  
ColNames <- gsub("mean\\()", "Mean", ColNames) 
ColNames <- gsub("std\\()", "StdDev", ColNames)  
ColNames <- gsub("meanFreq\\()", "MeanFrequency", ColNames) 
ColNames <- gsub("^t", "time", ColNames) 
ColNames <- gsub("^f", "freq", ColNames)

#update the column variables of HARData
colnames(HARData) <- ColNames
        
#5. From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject

#drop the activity label column
TidyData <- HARData[,2:82]

#create the tidy dataset
TidyData <- TidyData %>% group_by(SubjectLabel, Activity) %>% summarise_each(funs(mean))

#export the tidy dateset
write.table(TidyData, file = "TidyData.txt", row.names = FALSE)

