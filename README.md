# Course Project - Run Analysis

The script run_analysis.R requires the following files to be located in your working directory:
* subject_train.txt
* y_train.txt
* X_train.txt
* subject_test.txt
* y_test.txt
* X_test.txt

The script executes the tasks listed below and in the same order:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Here is how the script works:

###### 1. Merges the training and the test sets to create one data set.

First the file **Subject_train.txt** is loaded. This contains the subject identifiers (1-30) who carried out the experiment.

`subject_train <- read.table("subject_train.txt")`

Next the file **y_train.txt** is loaded. This contains the Activity identifiers (1-6).

`y_train <- read.table("y_train.txt")`

Then the file **X_train.txt** is loaded. This contains the accelerometer and gyroscope measurements.

`X_train <- read.table("X_train.txt")`

The 3 files have the same number of rows (observations) and different columns (variables):

File | Rows | Columns
--- | --- | ---
Subject_train.txt	| 7352 | 1
y_train.txt		| 7352 | 1
X_train.txt		| 7352 | 561

Therefore the columns are bound together using `cbind()`:

`train <-cbind(subject_train,y_train,X_train)`

The same is performed for the test group files:

```
subject_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")
X_test <- read.table("X_test.txt")
```

File | Rows | Columns
--- | --- | ---
Subject_test.txt	| 2947 | 1
y_test.txt		| 2947 | 1
X_test.txt		| 2947 | 561

Again the columns are bound together using `cbind()`:

`test <-cbind(subject_test,y_test,X_test)`

Finally the two tables (train & test) are merged together by binding the rows/observations using `rbind()`.

`train_test <- rbind(train,test)`

Data Set | Rows | Columns
--- | --- | ---
train_test	| 10,299 | 563

###### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

The mean and standard deviation columns are explicitly selected using concatenate/combine function `c()` and subsetting those values in the merged data set.

`train_test <- train_test[c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,296:298,347:352,375:377,426:431,454:456,505:506,515)]`

Data Set | Rows | Columns
--- | --- | ---
train_test	| 10,299 | 72

Important to note here is that because we have Subject in the first column and Activity in the second
we have to offset the 561 measurement appended columns by 2 therefore 
if we want to select columns 41-46 from the original X_train.txt and X_test.txt files we have to actually select columns 43:48 from this data set.

###### 3. Uses descriptive activity names to name the activities in the data set

The values 1-6 in the 2nd column (Activity) are converted to words representing the activity performed by the Subject:
```
train_test[,2] <- as.character(train_test[,2])
train_test[,2] <- replace(train_test[,2], train_test[,2] == 1, 'Walking')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 2, 'Walking Upstairs')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 3, 'Walking Downstairs')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 4, 'Sitting')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 5, 'Standing')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 6, 'Laying')
```

###### 4. Appropriately label the data set with descriptive variable names.

Here the column names/labels are explicitly set using `colnames()`:

`colnames(train_test) <- c("Subject","Activity","Body_Acc_Mean_X","Body_Acc_Mean_Y","Body_Acc_Mean_Z","Body_Acc_Std_X","Body_Acc_Std_Y","Body_Acc_Std_Z","Gravity_Acc_Mean_X","Gravity_Acc_Mean_Y","Gravity_Acc_Mean_Z","Gravity_Acc_Std_X","Gravity_Acc_Std_Y","Gravity_Acc_Std_Z","Body_Acc_Jerk_Mean_X","Body_Acc_Jerk_Mean_Y","Body_Acc_Jerk_Mean_Z","Body_Acc_Jerk_Std_X","Body_Acc_Jerk_Std_Y","Body_Acc_Jerk_Std_Z","Body_Gyro_Mean_X","Body_Gyro_Mean_Y","Body_Gyro_Mean_Z","Body_Gyro_Std_X","Body_Gyro_Std_Y","Body_Gyro_Std_Z","Body_Gyro_Jerk_Mean_X","Body_Gyro_Jerk_Mean_Y","Body_Gyro_Jerk_Mean_Z","Body_Gyro_Jerk_Std_X","Body_Gyro_Jerk_Std_Y","Body_Gyro_Jerk_Std_Z","Body_Acc_Mag_Mean","Body_Acc_Mag_Std","Gravity_Acc_Mag_Mean","Gravity_Acc_Mag_Std","Body_Acc_Jerk_Mag_Mean","Body_Acc_Jerk_Mag_Std","Body_Gyro_Mag_Mean","Body_Gyro_Mag_Std","Body_Gyro_Jerk_Mag_Mean","Body_Gyro_Jerk_Mag_Std","F_Body_Acc_Mean_X","F_Body_Acc_Mean_Y","F_Body_Acc_Mean_Z","F_Body_Acc_Std_X","F_Body_Acc_Std_Y","F_Body_Acc_Std_Z","Body_Acc_Mean_Freq_X","Body_Acc_Mean_Freq_Y","Body_Acc_Mean_Freq_Z","F_Body_Acc_Jerk_Mean_X","F_Body_Acc_Jerk_Mean_Y","F_Body_Acc_Jerk_Mean_Z","F_Body_Acc_Jerk_Std_X","F_Body_Acc_Jerk_Std_Y","F_Body_Acc_Jerk_Std_Z","Body_Acc_Jerk_Mean_Freq_X","Body_Acc_Jerk_Mean_Freq_Y","Body_Acc_Jerk_Mean_Freq_Z","F_Body_Gyro_Mean_X","F_Body_Gyro_Mean_Y","F_Body_Gyro_Mean_Z","F_Body_Gyro_Std_X","F_Body_Gyro_Std_Y","F_Body_Gyro_Std_Z","Body_Gyro_Mean_Freq_X","Body_Gyro_Mean_Freq_Y","Body_Gyro_Mean_Freq_Z","F_Body_Acc_Mag_Mean","F_Body_Acc_Mag_Std","Body_Acc_Mag_Mean_Freq")`

###### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A new data frame called `Final_Table` is created and is assigned the same column names as the previously merged data set.
This is done by selecting the 0 row from the `train_test` data frame which contain the column names and selecting all columns from 1 to 72.

`Final_Table <- train_test[0,1:72]`

A character vector is created for the activities so it can be used for comparing the values 1-6 in activity column.

`Activities <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")`

The final step is to loop through the 6 activities for each of the 30 subjects and calculate the mean for each column.
Each activity for each subject is selected for processing using the `subset()` fuction.

`MeanValues <- subset(train_test, Subject==s & Activity==Activities[a])`

The mean of each column is then calculated using `sappply()` and `mean()`.

`MeanValues <- sapply(MeanValues[,3:72], mean)`

`sapply()` returns a numeric vector therefore we have to convert it back to a 
data frame using `as.data.frame()`. The `as.data.frame` function returns 70 rows and 1 column however we want 1 row and 70 columns therefore we have to transpose the data frame using `t()`.

`MeanValues <- t(as.data.frame(MeanValues))`

The final 70 columns with calculated means are then inserted into the `Final_Table` data frame.

Again, because the `Final_Table` data.frame has Subject and Activity in their first 2 columns we have to offset the data by 2 hence the 1:70 vs 3:72 value ranges.

`Final_Table[r-1+a,3:72] <- MeanValues[1,1:70]`

Here is what the whole proccess put together looks like:


```
r <- 1
for(s in 1:30){
	Final_Table[r:(r+5),1] <- s

	for(a in 1:6){
		
	Final_Table[r-1+a,2] <- Activities[a]
	MeanValues <- subset(train_test, Subject==s & Activity==Activities[a])
	MeanValues <- sapply(MeanValues[,3:72], mean)
	MeanValues <- t(as.data.frame(MeanValues))
	Final_Table[r-1+a,3:72] <- MeanValues[1,1:70]
	}
	r <-r+6
}
```

The final data is returned with:
`return (Final_Table)`

Data Set | Rows | Columns
--- | --- | ---
Final_Table	| 180 | 72

or it can be exported as a text file using:
`write.table(Final_Table, "run_analysis.txt", row.names = FALSE)`

