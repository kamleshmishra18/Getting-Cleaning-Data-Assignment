## Get the dplyr package library
## If you get error as Not able to get dplyr, install the package first

library(dplyr)

## Download the file
                if(!file.exists("./data")){dir.create("./data")}
                fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(fileUrl,destfile="./data/Dataset.zip")

## Unzip dataSet to /data directory
                unzip(zipfile="./data/Dataset.zip",exdir="./data")

## Setting The file path so that no need to type the full path in each read.
                path = file.path("./data", "UCI HAR Dataset")

## 1. Output Steps - Create the data set of training and test

        #Reading training tables - xtrain / ytrain, subject train
                xtrain = read.table(file.path(path, "train", "X_train.txt"),header = FALSE)
                ytrain = read.table(file.path(path, "train", "y_train.txt"),header = FALSE)
                subject_train = read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)

        #Reading the testing tables
                xtest = read.table(file.path(path, "test", "X_test.txt"),header = FALSE)
                ytest = read.table(file.path(path, "test", "y_test.txt"),header = FALSE)
                subject_test = read.table(file.path(path, "test", "subject_test.txt"),header = FALSE)

        #Read the features data
                features = read.table(file.path(path, "features.txt"),header = FALSE)

        #Read activity labels data
                activityLabels = read.table(file.path(path, "activity_labels.txt"),header = FALSE)
                
## 2. Output Steps - Features data set of training and test

        #Create Sanity and Column Values to the Train Data
                colnames(xtrain) = features[,2]
                colnames(ytrain) = "activityId"
                colnames(subject_train) = "subjectId"
        #Create Sanity and column values to the test data
                colnames(xtest) = features[,2]
                colnames(ytest) = "activityId"
                colnames(subject_test) = "subjectId"
        #Create sanity check for the activity labels value
                colnames(activityLabels) <- c('activityId','activityType')
                
## 3. Merging the train and test data
                merge_train = cbind(ytrain, subject_train, xtrain)
                merge_test = cbind(ytest, subject_test, xtest)

## 4. Creating the main data table merging both table table
                merge_train_test = rbind(merge_train, merge_test)

## 5. Extracting only the measurements on the mean and standard deviation for each measurement
        #Step is to read all the values that are available
                colNames = colnames(merge_train_test)
        #Get a subset of all the mean and standards and the correspondongin activityID and subjectID 
                mean_and_std = (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
        #A subtset has to be created to get the required dataset
                setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

## 6. Using descriptive activity names to name the activities in the data set
                setWithActivityNames = merge(setForMeanAndStd, activityLabels, by='activityId', all.x=TRUE)
                
## 7. creates a second, independent tidy data set with the average of each variable for each activity and each subject          
                secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
                secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
                
## 8. Save new data to default directory
                write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
