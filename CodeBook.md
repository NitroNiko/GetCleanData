# CodeBook

The RAW data for this analysis was provided by:
_http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#_

the download was taken from:
_https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip_

The data was recorded with a Samsung acceleration and gyro sensor, attached to 30 subjects,
how had to perform six different activities. Please read the README.txt provided in the *.zip
file for further much more detailed information on the RAW data.

###Analysis Steps overview: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Variables of the tidy data set _Tidy_data.txt_:
each row is on of the 30 subjects
each coloum states the _Activity.variable.statistics_

 _avtivities:_
 - "WALKING"
 - "WALKING_UPSTAIRS"
 - "WALKING_DOWNSTAIRS"
 - "SITTING"
 - "STANDING"
 - "LAYING"

 _variables:_
 - t : timedomain
 - f : frequency domain
 - bodyAcc: gravity corrected acceleration
 - totalAcc: smartphone accelerometer X axis in standard gravity units 'g'
 - bodygyrp: angular velocity vector measured by the gyroscope

 _statistics:_
 - mean : average value
 - std : standard deviation
