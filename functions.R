# This file will be used to set the functions for the project 

#-----------------------------------------------------------------------------------------------------------
# This function test the required packages and that they are installed before loaded.
#-----------------------------------------------------------------------------------------------------------
LoadPkg = function(x){
    if (!require(x,character.only = TRUE))
    {
        install.packages(x,dep=TRUE)
        if(!require(x,character.only = TRUE)) stop("Package not found")
        else library(x)
    }
}

#-----------------------------------------------------------------------------------------------------------
# Setting datasource load to FALSE, this allows the re-running of the Run.Analysis() without re-running the
# data download again. Dynamically set after the first run. 
#-----------------------------------------------------------------------------------------------------------
download.datasource.switch = function(bool){
    fileConn = file(variables.script)
    variables.script.text = readLines(con = fileConn
                                       ,n = -1L
                                       ,ok = TRUE
                                       ,warn = FALSE
                                       ,encoding = "unknown"
                                       ,skipNul = FALSE)
    
    variables.script.text[18] = paste0("download.datasource.on = ", bool)
    
    writeLines(variables.script.text, fileConn)
    close(fileConn)
}

#-----------------------------------------------------------------------------------------------------------
# This function downloads the data files for this project download.datasource must have a valid 
#-----------------------------------------------------------------------------------------------------------
download.datasource = function(){
    # Check to see url is valid
    if(!download.datasource.on){
        print("download.datasource is set to false...")
        return()
    }
    
    # TODO: still a work in progress here...
    if (data.source == "") {
        stop("Invalid parameter data.source must be a valid url which begins with http://")
    }   
    
    print(paste("Downloading file:",data.source))
    
    # Download the data source
    fileUrl = data.source
    destfile = paste0(data.directory, paste0(path.sep, "DataSource.zip"))
    download.file(fileUrl, destfile)
    
    print(paste("Unzipping file:",destfile))
    
    # Unzip the downloaded zip file.
    unzip(destfile
          ,files = NULL
          ,list = FALSE
          ,overwrite = TRUE
          ,junkpaths = FALSE
          ,exdir = data.directory
          ,unzip = "internal"
          ,setTimes = FALSE)
    
}

#-----------------------------------------------------------------------------------------------------------
# This function imports the data files and generates the data frames for subjects, activities 
# and measurements dataset.type must be "test" or "train"  
#-----------------------------------------------------------------------------------------------------------
create.dataset = function(dataset.type) {
    
    # Check to see dataset.type is valid
    if (!dataset.type %in% c("test","train")) {
        stop("Invalid parameter dataset.type, accepted values are 'test' or 'train'")
    } 
    
    LoadPkg("data.table")
    
    # Subject
    subjects.file = paste("subject_", dataset.type, file.extension, sep = "")
    subjects = read.table(paste(read.data.directory, dataset.type, subjects.file, sep = path.sep)
                           ,header = FALSE
                           ,col.names = c("subject.id")
                           ,colClasses = "integer")
    
    # Activities  
    activities.file = paste("y_", dataset.type, file.extension, sep = "")
    activities = read.table(paste(read.data.directory, dataset.type, activities.file, sep = path.sep)
                             ,header = FALSE
                             ,col.names = c("activity.id")
                             ,colClasses = "factor")
    
    # 
    x.file = paste("X_", dataset.type, file.extension, sep = "")
    x.set = read.table(paste(read.data.directory, dataset.type, x.file, sep = path.sep)
                        ,header = FALSE
                        ,colClasses = "numeric")
    
    # Set return value
    return.set = cbind(subjects, activities, x.set)
    
    # Return
    return.set
}

#-----------------------------------------------------------------------------------------------------------
# This function imports the features file and returns the column names for the tidy dataset.
#-----------------------------------------------------------------------------------------------------------
dataset.column.names = function() {
    # Loading features
    features.file.name = paste("features", file.extension, sep = "")
    features.file = read.table(paste(read.data.directory, features.file.name, sep = path.sep), 
                                sep = " ", 
                                header = FALSE,
                                col.names = c("feature.id","feature.description"),
                                colClasses = c("factor","character"))
    # Return
    c("subject.id", "activity.id", features.file$feature.description)
}

#-----------------------------------------------------------------------------------------------------------
# This function extracts only the subject, activity and the measurements on the mean and standard deviation. 
#-----------------------------------------------------------------------------------------------------------
extract.columns.dataset = function(dataset) {
    # Choosing columns to extract
    column.names = cbind(names(dataset))
    column.table = data.frame(column.names)
    # mean columns
    column.table$extract = grepl("-mean", column.table$column.names)
    # std columns
    column.table$extract = column.table$extract | grepl("-std", column.table$column.names)
    column.table$extract[1:2] = TRUE
    
    # get only cols to extract
    dataset = dataset[,column.table$extract]
    # Return
    dataset
}

#-----------------------------------------------------------------------------------------------------------
# This function sets the activity labels on the dataset. 
#-----------------------------------------------------------------------------------------------------------
label.activity.column = function(dataset) {
    # Loading activities
    activity.labels.file.name = paste("activity_labels", file.extension, sep = "")
    activity.labels.file = read.table(paste(read.data.directory, activity.labels.file.name, sep = path.sep)
                                       ,sep = " "
                                       ,header = FALSE
                                       ,col.names = c("activity.id","activity.description")
                                       ,colClasses = c("factor","factor"))
    
    new.dataset = merge(activity.labels.file, dataset, all=TRUE)
    dataset = new.dataset[,c(3,2,4:82)]
    # Return
    dataset
}

#-----------------------------------------------------------------------------------------------------------
# This function creates the final tidy data set with the average of each variable for each subject 
# and activity. 
#-----------------------------------------------------------------------------------------------------------
create.tidy.dataset = function(dataset) {
    # Load required libraries
    LoadPkg("plyr")
    LoadPkg("reshape2")
    
    # Variables
    vector.column.names = names(dataset)
    vector.column.names = vector.column.names[3:81]
    
    # Melting data frame
    dataset.melt = melt(dataset,
                         ,id=c("subject.id","activity.description")
                         ,measure.vars=vector.column.names)
    
    # Create the new dataset
    new.dataset = dcast(dataset.melt, subject.id + activity.description ~ variable, mean)
    
    # Sorting the dataset    
    new.dataset = arrange(new.dataset, subject.id, activity.description)
    
    # Return
    new.dataset
}


