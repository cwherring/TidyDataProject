Code-Book 
=========

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Location of anaylsis files

https://github.com/cwherring/TidyDataProject

## Scripts

* functions.R       contains all functions needed to perfrom the anaylsis.
* variables.R       contains all the variables needed to execute the project.
* initialize.R      initializes the variables, and functions.
* run_analysis.R    executes the assigned analysis and produces the TidyData.txt file.

## Variables used by the analysis function

  Static
  
  * data.source-------------: Defines the url address for the project data, given in the instruction.txt
  * working.directory-------: Defines the working directory for the processing R session
  * data.directory----------: Defines the path for the data to be written
  * read.data.directory-----: Defines the path for reading data from the source
  * script.directory--------: Defines the path for the supporting scripts, used to set dynamics variables
  
  * variables.script--------: Defines the path for the variable script, used to set dynamic variables
  * functions.script--------: Defines the path for the functions script, not being used at this time 
  * initialize.script-------: Defines the path for the initialization script, not being used at this time
  
  * path.sep----------------: Used to defined the path separator for various functions and paste0() appendments  
  * file.extension----------: Used to defined the data source file extension  
  
  Dynamic
  
  * download.datasource.on--: This is a dynamic variable, set to TRUE on the inital run and then set to FALSE
                              the dynamic setting to false was done to assist in continual execution of the 
                              Run.Analysis code. Seeing the dowloading the file and unzipping was time consumeing 
                              I decided to reduce the opertaion after the first run. 

## Transformations

  1. Merge the training and the test sets to create one data set.
  2. Extract only the measurements of the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately label the data set with descriptive variable names. 
  5. From the data set in step 4, create a second, independent tidy data set with the average 
     of each variable for each activity and each subject.
     
##Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

tBodyAcc-XYZ   
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:   

mean(): Mean value  
std(): Standard deviation  

The complete list of variables of each feature vector is available in 'variables.md'  

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

