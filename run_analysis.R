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
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(testsubject) <- c("subject")
testdata <- cbind(testdata, testsubject)

##read the training data
traindata <- read.table("UCI HAR Dataset/train/X_train.txt")

trainlabels <- read.table("UCI HAR Dataset/train/Y_train.txt")
names(traindata) <- features[,2]

##keep only the columns with mean or std in title
traindata <- traindata[,grep("[Mm]ean|std", names(traindata))]
traindata$dataset <- "train"

names(trainlabels) <- c("number")
traindata <- cbind(traindata, trainlabels)
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(trainsubject) <- c("subject")
traindata <- cbind(traindata, trainsubject)

##merge the two sets
merged <- rbind(testdata, traindata)

##now add the activity labels
labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(labels) <- c("number", "activity")
merged <- merge(labels, merged)
merged <- select(merged, -number)

##finally write it out to a file for future use
write.table(merged, "UCI_tidy.txt",row.name=FALSE)

##create an extra file with averages
avgs <- select(aggregate(merged, list(Activity=merged$activity,
                                      Subject=merged$subject), mean),
               -activity, -dataset)
write.table(avgs, "UCI_avg.txt", row.name=FALSE)
