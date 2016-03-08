##starting from the point where we have downloaded and unzipped the dataset

##examine the folders and subfolders
root <- "UCI HAR Dataset"

files <- list.files(root, recursive=TRUE)

##read the features table
features <- read.table("UCI HAR Dataset/UCI HAR Dataset/features.txt")
    
##let's find out a little more about the dataset dimensions
tables <- lapply(files[5:28], function(file) {
    table <- read.table(paste(root, file, sep="/"))
    print(file)
    print(dim(table))
})
