### Data Dictionary - summary_measurements.txt


Subject - type:numeric

	The ID of the subject who perform the activity being measured

		1..30 - Each subject is assigned with a number 


ActivityName - type:text

	The name of the activity

		LAYING
		SITTING
		STANDING
		WALKING
		WALKING_DOWNSTAIRS
		WALKING_UPSTAIRS


tBodyAcc\_[mean|std]\_[X|Y|Z] - type:numeric  
tGravityAcc\_[mean|std]\_[X|Y|Z] - type:numeric  
tBodyAccJerk\_[mean|std]\_[X|Y|Z] - type:numeric  
tBodyGyro\_[mean|std]\_[X|Y|Z] - type:numeric  
tBodyGyroJerk\_[mean|std]\_[X|Y|Z] - type:numeric  
tBodyAccMag\_[mean|std] - type:numeric  
tGravityAccMag\_[mean|std] - type:numeric  
tBodyAccJerkMag\_[mean|std] - type:numeric  
tBodyGyroMag\_[mean|std] - type:numeric  
tBodyGyroJerkMag\_[mean|std] - type:numeric  
fBodyAcc\_[mean|std]\_[X|Y|Z] - type:numeric  
fBodyAccJerk\_[mean|std]\_[X|Y|Z] - type:numeric  
fBodyGyro\_[mean|std]\_[X|Y|Z] - type:numeric  
fBodyAccMag\_[mean|std] - type:numeric  
fBodyBodyAccJerkMag\_[mean|std] - type:numeric  
fBodyBodyGyroMag\_[mean|std] - type:numeric  
fBodyBodyGyroJerkMag\_[mean|std] - type:numeric  

	The average of 66 measured features by Subject and Activity
	The variable names describe the type of the feature measured using the following rules:
	- the prefix 't' denotes a time domain signals, while the prefix 'f' denotes a frequency domain signal
	- 'Body' and 'Gravity' denote body and gravity acceleration signals, respectively
	- 'Acc' and 'Gyro' denote that the measurement come from accelerometer and gyroscope raw signal, respectively
	- 'Jerk' denotes a Jerk signal
	- 'Mag' denotes the magnitude of a three-dimensional signal
	- 'mean' and 'std' denote the mean and standard deviation of each measurement signals
	- 'X', 'Y', and 'Z' denote 3-axial signals in the X, Y and Z directions
	For more information about the features, please refer to the features_info.txt distributed in the project data UCI HAR Dataset.zip



