run_analysis <- function() {

#1. Merges the training and the test sets to create one data set.

subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")
X_train <- read.table("X_train.txt")
train <-cbind(subject_train,y_train,X_train)

subject_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")
X_test <- read.table("X_test.txt")
test <-cbind(subject_test,y_test,X_test)

train_test <- rbind(train,test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

train_test <- train_test[c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,296:298,347:352,375:377,426:431,454:456,505:506,515)]

#3. Uses descriptive activity names to name the activities in the data set

train_test[,2] <- as.character(train_test[,2])
train_test[,2] <- replace(train_test[,2], train_test[,2] == 1, 'Walking')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 2, 'Walking Upstairs')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 3, 'Walking Downstairs')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 4, 'Sitting')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 5, 'Standing')
train_test[,2] <- replace(train_test[,2], train_test[,2] == 6, 'Laying')

#4. Appropriately labels the data set with descriptive variable names. 

colnames(train_test) <- c("Subject","Activity","Body_Acc_Mean_X","Body_Acc_Mean_Y","Body_Acc_Mean_Z","Body_Acc_Std_X","Body_Acc_Std_Y","Body_Acc_Std_Z","Gravity_Acc_Mean_X","Gravity_Acc_Mean_Y","Gravity_Acc_Mean_Z","Gravity_Acc_Std_X","Gravity_Acc_Std_Y","Gravity_Acc_Std_Z","Body_Acc_Jerk_Mean_X","Body_Acc_Jerk_Mean_Y","Body_Acc_Jerk_Mean_Z","Body_Acc_Jerk_Std_X","Body_Acc_Jerk_Std_Y","Body_Acc_Jerk_Std_Z","Body_Gyro_Mean_X","Body_Gyro_Mean_Y","Body_Gyro_Mean_Z","Body_Gyro_Std_X","Body_Gyro_Std_Y","Body_Gyro_Std_Z","Body_Gyro_Jerk_Mean_X","Body_Gyro_Jerk_Mean_Y","Body_Gyro_Jerk_Mean_Z","Body_Gyro_Jerk_Std_X","Body_Gyro_Jerk_Std_Y","Body_Gyro_Jerk_Std_Z","Body_Acc_Mag_Mean","Body_Acc_Mag_Std","Gravity_Acc_Mag_Mean","Gravity_Acc_Mag_Std","Body_Acc_Jerk_Mag_Mean","Body_Acc_Jerk_Mag_Std","Body_Gyro_Mag_Mean","Body_Gyro_Mag_Std","Body_Gyro_Jerk_Mag_Mean","Body_Gyro_Jerk_Mag_Std","F_Body_Acc_Mean_X","F_Body_Acc_Mean_Y","F_Body_Acc_Mean_Z","F_Body_Acc_Std_X","F_Body_Acc_Std_Y","F_Body_Acc_Std_Z","Body_Acc_Mean_Freq_X","Body_Acc_Mean_Freq_Y","Body_Acc_Mean_Freq_Z","F_Body_Acc_Jerk_Mean_X","F_Body_Acc_Jerk_Mean_Y","F_Body_Acc_Jerk_Mean_Z","F_Body_Acc_Jerk_Std_X","F_Body_Acc_Jerk_Std_Y","F_Body_Acc_Jerk_Std_Z","Body_Acc_Jerk_Mean_Freq_X","Body_Acc_Jerk_Mean_Freq_Y","Body_Acc_Jerk_Mean_Freq_Z","F_Body_Gyro_Mean_X","F_Body_Gyro_Mean_Y","F_Body_Gyro_Mean_Z","F_Body_Gyro_Std_X","F_Body_Gyro_Std_Y","F_Body_Gyro_Std_Z","Body_Gyro_Mean_Freq_X","Body_Gyro_Mean_Freq_Y","Body_Gyro_Mean_Freq_Z","F_Body_Acc_Mag_Mean","F_Body_Acc_Mag_Std","Body_Acc_Mag_Mean_Freq")

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Final_Table <- train_test[0,1:72]	#Assign the same column names to Final_Table

Activities <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")
 
r <- 1
for(s in 1:30){
	Final_Table[r:(r+5),1] <- s

	for(a in 1:6){
		
	Final_Table[r-1+a,2] <- Activities[a]			#Insert Activity Name into Activity Column
	MeanValues <- subset(train_test, Subject==s & Activity==Activities[a]) #Select current Subject and Activity
	MeanValues <- sapply(MeanValues[,3:72], mean)		#Calculate Means of Columns 3:72 & returnes a vector of numeric
	MeanValues <- t(as.data.frame(MeanValues))		#Converts vector to data frame with 70 rows and 1 column & Transpose data frame to 1 row and 70 columns
	Final_Table[r-1+a,3:72] <- MeanValues[1,1:70]		#Insert calculated Means in columns 1 to 70 and place them in final table columns 3:72
	}
	r <-r+6
}

#write.table(Final_Table, "run_analysis.txt", row.names = FALSE)

return (Final_Table)

}