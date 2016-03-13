# datacleaningproject

## Prerequisites
Download the complete dataset from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

..and unzip into the same folder as run_analysis.R

A full explanation of the original dataset is available from 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## To run
Run the script run_analysis.R in the 'UCI HAR Dataset' folder. The output 'UCI_Tidy.csv' will be written to the same folder. A sample output is supplied with the code.

## Code Book
Please reference the original README.txt and features_info.txt in the 'UCI HAR Dataset' folder for full explanations. 

The output supplied represents a 'tidy' subset of the original data. Traing and test datasets have been merged and an additional two columns added:

- dataset: 'test' ot 'train' depending on which dataset the record was obtained from.
- activity: The activity the subject was engaged in. One of:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

