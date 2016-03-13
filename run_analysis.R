library(tidyr)
library(dplyr)

##starting from the point where we have downloaded and unzipped the dataset

##examine the folders and subfolders
root <- "UCI HAR Dataset"

files <- list.files(root, recursive=TRUE)

##read the features table
features <- read.table("UCI HAR Dataset/features.txt")

##read the test data
testdata <- read.table("UCI HAR Dataset/test/X_test.txt")


testlabels <- read.table("UCI HAR Dataset/test/Y_test.txt")

##apply the feature names to the data
names(testdata) <- features[,2]

##keep only the columns with mean or std in title
testdata <- testdata[,grep("[Mm]ean|std", names(testdata))]

testdata$dataset <- "test"

##apply activity names
names(testlabels) <- c("number")
testdata <- cbind(testdata, testlabels)

##read the training data
traindata <- read.table("UCI HAR Dataset/train/X_train.txt")

trainlabels <- read.table("UCI HAR Dataset/train/Y_train.txt")
names(traindata) <- features[,2]

##keep only the columns with mean or std in title
traindata <- traindata[,grep("[Mm]ean|std", names(traindata))]
traindata$dataset <- "train"

names(trainlabels) <- c("number")
traindata <- cbind(traindata, trainlabels)

##merge the two sets
merged <- rbind(testdata, traindata)

##now add the activity labels
labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(labels) <- c("number", "activity")
merged <- merge(labels, merged)
merged <- select(merged, -number)

##finally write it out to a file for future use
write.table(merged, "UCI_tidy.csv")
