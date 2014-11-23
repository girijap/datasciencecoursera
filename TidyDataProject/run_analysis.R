## Coursera Project1 Getting and Cleaning Data Project
library(reshape2)
## First read all the data available and assign them to variables
## this includes training, test, subject, features and activity data
## assuming the data needed exists under UCIdataset directory
xtrain = read.table("UCIdataset/train/X_train.txt")
ytrain = read.table("UCIdataset/train/y_train.txt")
subtrain = read.table("UCIdataset/train/subject_train.txt")
xtest = read.table("UCIdataset/test/X_test.txt")
ytest = read.table("UCIdataset/test/y_test.txt") 
subtest = read.table("UCIdataset/test/subject_test.txt")
activity = read.table("UCIdataset/activity_labels.txt")
features<- read.table("UCIdataset/features.txt")[,"V2"]

## Merge the training and the test sets to create one data set
## and update their column names
## Use descriptive activity names to name the activities in the data set
## Appropriately label the data set with descriptive variable names. 
Mergex = rbind(xtrain, xtest)
Mergey = rbind(ytrain, ytest)
MergeSub = rbind(subtrain, subtest)
colnames(Mergex) <- features
colnames(Mergey) <- "activity_id"
colnames(MergeSub) <- "subject"
colnames(activity) <- c("activity_id", "activity")

## Extract only the measurements on the mean and standard deviation 
## for each measurement.
##Search the data and get mean and std data 
means <- grep("-mean\\(\\)", features, value=TRUE)
stds <- grep("-std\\(\\)", features, value=TRUE)
extr <- c(means, stds)
x <- Mergex[, extr]

##creates a second, independent tidy data set with the average of each variable for each activity 
##and each subject
y <- merge(Mergey, activity)
measuredata <- cbind(x, y["activity"])
##combine with subject
subjectdata<- cbind(measuredata, MergeSub)
## get summary of means per subject per activity
data <- melt(subjectdata, id=c("subject", "activity"))
finaldata <- dcast(data, activity + subject ~ variable, mean)
##
write.table(finaldata, "Tidy.txt",row.names=FALSE)