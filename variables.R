# This file will be used to set the variables for the project 

# static
data.source = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
working.directory = "C:/Users/Chris/Documents/GitHub/TidyDataProject"
data.directory = "."
read.data.directory = paste0(data.directory, "/UCI HAR Dataset")
script.directory = "."


variables.script = paste0(paste0(script.directory, "/"), "variables.R")
functions.script = paste0(paste0(script.directory, "/"), "functions.R")
initialize.script = paste0(paste0(script.directory, "/"), "initalize.R")

path.sep = "/"
file.extension = ".txt"

download.datasource.on = FALSE
