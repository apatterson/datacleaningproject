library(tidyr)##starting from the point where we have downloaded and unzipped the dataset

##examine the folders and subfolders
root <- "UCI HAR Dataset"

files <- list.files(root, recursive=TRUE)

##read the features table
features <- read.table("UCI HAR Dataset/features.txt")

##read the test data
testdata <- read.table("UCI HAR Dataset/test/X_test.txt")

##apply the feature names to the data
names(testdata) <- features[,2]
testdata$dataset = "test"

##read the training data
traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
names(traindata) <- features[,2]
traindata$dataset = "train"

merged <- rbind(testdata, traindata)

print(head(merged))
