# getting and cleaning data course project

Mengdi Yue

submission to "Getting and cleaning data" course project 

#Notes on the original(raw) data
Human Activity Recognition Using Smartphones Dataset Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Universit‡ degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#Notes on the tidy data set
The tidy data set (TidyData) contains 180 observations of 81 variables. It shows the the average of each measurement variables (79 in total)
for each activity(6 in total: walking, standing, sitting, laying, walking_downstairs, walking_upstairs) and each subject (30 subjects in total). 

#Data processing
##step1 Merges the training and test sets to create one data set
First read in the datasets in .txt formats into R, then change column names of datasets, merge test and train datasets respectively, and combine test and train data into one dataset
##step2 Extracts only the measurements on the mean and standard deviation for each measurement
Use grepl() to extract measurements whose names contain mean and std.
##step3 Uses descriptive activity names to name the activities in the data set
Merge the dataset with "features" to change numbers to words.
##step4 Appropriately labels the data set with descriptive variable names
Change abbrevations to full word, e.g. "acc" to "acceleration", "t" to "time", "f" to "freq" to make variable names more informative.
##step5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Group the data and summarise the mean of each varible.
