### Getting and cleaning Data - Course Project at Coursera
rm(list=ls())

### Load data ------------------------------------------------------------------
features <- read.csv("./features.txt",sep=" ", header=F) 
features <- as.character(features[,2])

###load training data
X_train <- read.fwf("./X_train.txt", n = 7500, widths = c(rep(16, 561)))#this takes a lot of time
y_train <- read.csv("./y_train.txt",sep=" ", header=F)
subject_train <- read.csv("./subject_train.txt",sep=" ", header=F)


### load test data
X_test <- read.fwf("./X_test.txt", n = 7352, widths = c(rep(16, 561)), header=F)#this takes a lot of time
y_test <- read.csv("./y_test.txt",sep=" ", header=F)
subject_test <- read.csv("./subject_test.txt",sep=" ", header=F)

### 1. merge training and test data --------------------------------------------
df <- rbind(X_train, X_test)
activities <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

### 4. Appropriately labels the data set with descriptive variable names
colnames(df) <- features

### 2. Extracts only the measurements on the mean and standard deviation for each measurement
select.col <- c(grep("mean", features), grep("std", features))
select.col <- sort(select.col)

df_selection <- df[,select.col]

### Add Subject and Activities to the data
df <- cbind(subject, activities, df_selection)
colnames(df)[1:2]<-c("subject", "activity")

### 3. Uses descriptive activity names to name the activities in the data set
df <- within(data = df, {
    activity[activity == 1] <- "WALKING"
    activity[activity == 2] <- "WALKING_UPSTAIRS"
    activity[activity == 3] <- "WALKING_DOWNSTAIRS"
    activity[activity == 4] <- "SITTING"
    activity[activity == 5] <- "STANDING"
    activity[activity == 6] <- "LAYING"
})

### 5. data set with the average of each variable for each activity and each subject
library(reshape2)
dfm <- melt(df, id = c("subject", "activity"), measure.vars = colnames(df)[c(-1,-2)])
df_summary <- acast(dfm, subject ~ activity ~ variable, mean)

### Output
write.table(df_summary, file="./Tidy_data.txt", row.names=FALSE)
