##Script to download the UCI smartphone dataset, add informative labels for activities, subjects and variables.  
##Then combine the training and test datasets and generate a new dataframe with only the means and standard deviation variables (named meanstd).  
##Finally, using meanstd, generate a summary dataframe with the average for each variable, organized by both subject and activity (called meansumm).

library(plyr)
setwd("~/Desktop/")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "cleaning data.zip")
unzip("cleaning data.zip")
testDF <- read.table("~/Desktop/UCI HAR Dataset/test/X_test.txt")
features <- read.table("~/Desktop/UCI HAR Dataset/features.txt")
colnames (testDF) <- features[ , 2]
testlabDF <- read.table("~/Desktop/UCI HAR Dataset/test/y_test.txt")
colnames(testlabDF) <- "code"
LUT <- read.table("~/Desktop/UCI HAR Dataset/activity_labels.txt")
colnames(LUT) <- c("code", "activity")

testsubjDF <- read.table("~/Desktop/UCI HAR Dataset/test/subject_test.txt")
colnames(testsubjDF) <- "subject"
relabeledtestlabDF <- testlabDF
relabeledtestlabDF[] <- LUT$activity[match(unlist(relabeledtestlabDF), LUT$code)]
colnames(relabeledtestlabDF) <- "activity"
testDF <- cbind(testsubjDF, testlabDF, relabeledtestlabDF, testDF)
trainDF <- read.table("~/Desktop/UCI HAR Dataset/train/X_train.txt")
trainlabDF <- read.table("~/Desktop/UCI HAR Dataset/train/y_train.txt")
colnames(trainlabDF) <- "code"
trainsubjDF <- read.table("~/Desktop/UCI HAR Dataset/train/subject_train.txt")
colnames(trainsubjDF) <- "subject"
colnames (trainDF) <- features[ , 2]
relabeledtrainlabDF <- trainlabDF
relabeledtrainlabDF[] <- LUT$activity[match(unlist(relabeledtrainlabDF), LUT$code)]
colnames(relabeledtrainlabDF) <- "activity"
trainDF <- cbind(trainsubjDF, trainlabDF, relabeledtrainlabDF, trainDF)

TotalDF <- rbind(trainDF, testDF)
meanstd <- (TotalDF[grepl("subject|activity|std|mean", names(TotalDF))])
rm("TotalDF", "features", "LUT", "relabeledtestlabDF", "relabeledtrainlabDF", "testDF", "testlabDF", "testsubjDF", "trainDF", "trainlabDF", "trainsubjDF")
x <- tolower(names(meanstd))
x <- gsub("-", "_", x)
x <- gsub("bodyacc", "body_linear_acceleration_", x)
x <- gsub("bodygyro", "angular_acceleration_", x)
x <- gsub("gravityacc", "gravity_linear_acceleration_", x)
x <- gsub("mag_", "magnitude_", x)
x <- gsub("meanfreq", "meanfrequency_", x)
x <- gsub("__", "_", x)
x <- make.names(x)
x <- gsub("[..]", "", x)
x <- gsub("__", "_", x)
x <- gsub("[_]$", "", x)
colnames(meanstd) <- x
rm("x")

meansumm <- ddply(meanstd,. (subject, activity), numcolwise(mean))
write.table(meansumm, "av of each variable by subject and activity.txt", row.names = FALSE)
