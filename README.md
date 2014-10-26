Getting and Cleaning Data Course Project
========================================

Coursera Data Science Getting and Cleaning Data

## Description of the assignment

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements of the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average 
   of each variable for each activity and each subject.
 

## About the solution

To run the analysis, perform the following steps:

* First download the required files
      * Course Project/run_analysis.R 
      * Course Project/variables.R
      * Course Project/initialize.R
      * Course Project/functions.R 

* Set the *variables.R* 

        1. working.directory:   Set to the working folder for this analysis
        2. data.directory:      Set to the folder you wish to contain the data for this analysis
        2. OPTIONAL: Set download.datasource.on = FALSE         # see *Note

* Load **`source("run_analysis.R")`** in R

* Last, execute **`Run.Analysis()`** with R.  This will generate the TidyData.txt file in the data.directory.

*Note: If you have already download and extracted the data files to the the data.directory folder you set then set the following dyanmic variable **`download.datasource.on`** to FALSE in the varialbes.R file and you will not have to wait for the data download and extraction. If you have not downloaded the data files to the data.directory, then make sure to set **`download.datasource.on`** to TRUE to download and extract the data files to the data.directory.

**Note if you are using Windows this will work, I have not tested it with Linux or Mac yet. 

