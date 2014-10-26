# This file will be used to initialize the project 
# Clean R session
print("Clearing R session...")
rm(list=ls())

# Define initial variables
print("Loading variables...")
source("./variables.R")  

# set the working directory
print("Setting working directory...")
print(working.directory)
if (getwd() != working.directory) setwd(working.directory)

# Create data folder
print("Create data folder...")
print(paste0(getwd(), data.directory))
dir.create(paste0(getwd(), data.directory), showWarnings = FALSE)

# Define functions
print("Define functions...")
source("./functions.R")

download.datasource()
download.datasource.switch(FALSE)
