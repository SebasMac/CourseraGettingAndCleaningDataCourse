
## STEP 0
##########################################

## checks if the data directory exists and if not it creates it
if(!file.exists("data")){dir.create("data")}

## defines location of download file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## downloads file
download.file(url, destfile = "./data/samsung.zip")

## unzips file - it creates a folder containing the data named "UCI HAR Dataset"
unzip(zipfile="./data/samsung.zip",exdir="./data")



## STEP 1. Merges the training and the test sets to create one data set.
########################################################################

## reads the relevant files into data sets

xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## merges the test and train data sets into three variables x, y and subject

x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
subject <- rbind(subjecttrain, subjecttest)



## STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.
##################################################################################################

## labels variables in x dataset

features <- read.table("data/UCI HAR Dataset/features.txt")
cnames <- c(as.character(features[,2]))
colnames(x) <- cnames
colnames(y) <- c("Activity")
colnames(subject) <- c("Subject")

## creates one single data set
data <- cbind(subject, y, x)

## extracts only the columns that has mean or std in the description
meanorstdcols <- grep("(mean|std)\\(\\)", colnames(data), value = TRUE)

## subsets the data set to only those features
subdata <- data[, c("Subject", "Activity", meanorstdcols)]



## STEP 3. Uses descriptive activity names to name the activities in the data set.
##################################################################################

## reads activity labels file
activitylabels <- read.table("data/UCI HAR Dataset/activity_labels.txt")
colnames(activitylabels) <- c("activity", "label")

## turns the column "Activity" into a factor and assigns activitylabels as factor labels
subdata$Activity <- factor(subdata$Activity, levels=c(1:6), labels=activitylabels$label)



## STEP 4. Appropriately labels the data set with descriptive variable names.
#############################################################################

## gets the column names from the sub dataset of means and std
colnames <- colnames(subdata)

## for loop that replaces the unfriendly characters in the variable names for meaningful words and
## eliminates signs and other symbols like () etc. NOTE: this requires, outside R, to 
## read "features_info.txt" to get information about the variable names

for (i in 1:length(colnames)) {
        colnames[i] = gsub("\\()","",colnames[i])
        colnames[i] = gsub("-mean","Mean",colnames[i])
        colnames[i] = gsub("-std$","StandardDev",colnames[i])
        colnames[i] = gsub("^(f)","frequency",colnames[i])
        colnames[i] = gsub("^(t)","time",colnames[i])
        colnames[i] = gsub("(BodyBody)","Body",colnames[i])
        colnames[i] = gsub("Gyro","Gyroscope",colnames[i])
        colnames[i] = gsub("AccMag","AccelerometerMagnitude",colnames[i])
        colnames[i] = gsub("(Bodyaccjerkmag)","BodyAccelerometerJerkMagnitude",colnames[i])
        colnames[i] = gsub("JerkMag","JerkMagnitude",colnames[i])
        colnames[i] = gsub("GyroMag","GyroscopeMagnitude",colnames[i])
        colnames[i] = gsub("MagMean","MagnitudeMean",colnames[i])
        colnames[i] = gsub("AccMean","AccelerometerMean",colnames[i])
        colnames[i] = gsub("-std","StandardDev",colnames[i])
        colnames[i] = gsub("-X","X",colnames[i])
        colnames[i] = gsub("-Y","Y",colnames[i])
        colnames[i] = gsub("-Z","X",colnames[i])
}

## reassigns the new descriptive column names to the subdata set
colnames(subdata) <- colnames



## STEP 5. From the data set in step 4, creates a second, independent tidy data set with  
##         the average of each variable for each activity and each subject.
########################################################################################


## converts Subject into a factor variable.
subdata$Subject <- as.factor(subdata$Subject)

## aggregates data per Activity and then Subject
tidyData <- aggregate(. ~Activity + Subject, subdata, mean)

## orders data to make ir more tidy
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

## change variable names to add "mean_of_" to the name of each variable
tidycolnames<- colnames(tidyData)
for (i in 3:length(tidycolnames)) {
        tidycolnames[i] = paste("mean_of_", tidycolnames[i], sep = "")
}
colnames(tidyData) <- tidycolnames

##
write.table(tidyData, file = ".data/tidy.txt", row.names = FALSE, quote = FALSE)