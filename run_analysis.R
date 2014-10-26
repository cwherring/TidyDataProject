#------------------------------------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each
#    activity and each subject. 
#------------------------------------------------------------------------------------------------
 
# Run Analysis
Run.Analysis <- function() {  
    # Initialize the environment
    source("./initialize.R") 
    
    # Create the train set
    print("Creating training dataset ...")
    train.dataset <- create.dataset("train")
    
    # Create the test set
    print("Creating testing dataset ...")
    test.dataset <- create.dataset("test")
    
    # Create the merged dataset
    print("Merging the traing and test datasets ...")
    merged.dataset <- rbind(train.dataset, test.dataset)
    
    # Cleaning memory
    rm(train.dataset, test.dataset)    
    
    # Setting column names
    print("Setting column names ...")
    colnames(merged.dataset) <- dataset.column.names()
    
    # Get column extract
    print("Get column extract ...")
    merged.dataset <- extract.columns.dataset(merged.dataset)
    
    # Set activity labels
    print("Set activity labels ...")
    merged.dataset <- label.activity.column(merged.dataset)    
    
    # Creating and exporting the tidy dataset  
    write.table(create.tidy.dataset(merged.dataset)
                ,paste0(data.directory, paste0(path.sep, "TidyData.txt"))
                ,sep=","
                ,quote = FALSE
                ,row.names = FALSE)
    
    # Return dataset as well
    create.tidy.dataset(merged.dataset)
}   

