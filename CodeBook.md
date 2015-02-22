# Course Project - Run Analysis Code Book

## Data Source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Description:

30 volunteers within an age range of 19 to 48 years were asked to carry out 6 activities: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying.
Each volunteer/subject was asked to wear a Samsung Galaxy S II smartphone on their waist.
The embedded accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The obtained measurements were randomly split into a 70% train data set and a 30% test data set.

The following files were processed:

File | Rows | Columns
--- | --- | ---
Subject_train.txt	| 7352 | 1
y_train.txt		| 7352 | 1
X_train.txt		| 7352 | 561
Subject_test.txt	| 2947 | 1
y_test.txt		| 2947 | 1
X_test.txt		| 2947 | 561

The files starting with "Subject" contain the subject identifiers (1-30) who carried out the experiment.
The files starting with "X" contain the accelerometer and gyroscope measurements as a 561-feature vector with time and frequency domain variables.
The files staring with "Y" contain the activity identifiers (1-6).

Listed in the table below are the activities associated with the values found in the "Y" files:

Value | Activity
--- | ---
1 | Walking
2 | Walking Upstairs
3 | Walking Downstairs
4 | Sitting
5 | Standing
6 | Laying


## Data Transformation

For both the train and test data sets:
The Subject, X, and Y files were concatenated to produce a data set of 563 columns.

The train and test data sets were then merged to produce 10,299 rows/observations.

Group | Rows
--- | ---
Train | 7352
Test | 2947
Total: 10,299

The 563 columns of the merged data set were then reduced to 72 columns.
The first column is for the subject, the second column is for activity and the remaining 70 columns are for the mean and standard deviation measurements.

Data Set | Rows | Columns
--- | --- | ---
Merged | 10,299 | 72

The data was then transformed to contain the average of each measurement for each activity and each subject.

Data Set | Rows | Columns
--- | --- | ---
Final | 180 | 72

## Variable Description

Below is an explanation of each data field/column/measurement variable:

Column | Variable | Description | Units/Type
--- | --- | --- | ---
1 | Subject | Values 1-30. Each value represents a volunteer. | Integer
2 | Activity | Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying | Character
3 | Body_Acc_Mean_X | Mean value of body acceleration signals on the X-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration. | Standard gravity units (g)
4 | Body_Acc_Mean_Y | Mean value of body acceleration signals on the Y-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration. | Standard gravity units (g)
5 | Body_Acc_Mean_Z | Mean value of body acceleration signals on the Z-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration. | Standard gravity units (g)
6 | Body_Acc_Std_X | Standard deviation value of body acceleration signals on the X-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration. | Standard gravity units (g)
7 | Body_Acc_Std_Y | Standard deviation value of body acceleration signals on the X-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration. | Standard gravity units (g)
8 | Body_Acc_Std_Z | Standard deviation value of body acceleration signals on the X-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration. | Standard gravity units (g)
9 | Gravity_Acc_Mean_X | Mean value of Gravity acceleration signals on the X-axis. The gravity acceleration signal was obtained by subtracting the total acceleration from gravity. | Standard gravity units (g)
10 | Gravity_Acc_Mean_Y | Mean value of Gravity acceleration signals on the Y-axis. The gravity acceleration signal was obtained by subtracting the total acceleration from gravity. | Standard gravity units (g)
11 | Gravity_Acc_Mean_Z | Mean value of Gravity acceleration signals on the Z-axis. The gravity acceleration signal was obtained by subtracting the total acceleration from gravity. | Standard gravity units (g)
12 | Gravity_Acc_Std_X | Standard deviation value of Gravity acceleration signals on the X-axis. The gravity acceleration signal was obtained by subtracting the total acceleration from gravity. | Standard gravity units (g)
13 | Gravity_Acc_Std_Y | Standard deviation value of Gravity acceleration signals on the Y-axis. The gravity acceleration signal was obtained by subtracting the total acceleration from gravity. | Standard gravity units (g)
14 | Gravity_Acc_Std_Z | Standard deviation value of Gravity acceleration signals on the Z-axis. The gravity acceleration signal was obtained by subtracting the total acceleration from gravity. | Standard gravity units (g)
15 | Body_Acc_Jerk_Mean_X | Mean value of the body of the Jerk signals on the X-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals. | Radians per second
16 | Body_Acc_Jerk_Mean_Y | Mean value of the body of the Jerk signals on the Y-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals. | Radians per second
17 | Body_Acc_Jerk_Mean_Z | Mean value of the body of the Jerk signals on the Z-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals. | Radians per second
18 | Body_Acc_Jerk_Std_X | Standard deviation value of the body of the Jerk signals on the X-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals. | Radians per second
19 | Body_Acc_Jerk_Std_Y | Standard deviation value of the body of the Jerk signals on the Y-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals. | Radians per second
20 | Body_Acc_Jerk_Std_Z | Standard deviation value of the body of the Jerk signals on the Z-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals. | Radians per second
21 | Body_Gyro_Mean_X | Mean value of the Gyro signals on the X-axis. The angular velocity vector was obtained from the gyroscope. | Radians per second
22 | Body_Gyro_Mean_Y | Mean value of the Gyro signals on the Y-axis. The angular velocity vector was obtained from the gyroscope. | Radians per second
23 | Body_Gyro_Mean_Z | Mean value of the Gyro signals on the Z-axis. The angular velocity vector was obtained from the gyroscope. | Radians per second
24 | Body_Gyro_Std_X | Standard deviation value of the Gyro signals on the X-axis. The angular velocity vector was obtained from the gyroscope. | Radians per second
25 | Body_Gyro_Std_Y | Standard deviation value of the Gyro signals on the Y-axis. The angular velocity vector was obtained from the gyroscope. | Radians per second
26 | Body_Gyro_Std_Z | Standard deviation value of the Gyro signals on the Z-axis. The angular velocity vector was obtained from the gyroscope. | Radians per second
27 | Body_Gyro_Jerk_Mean_X | Mean value of the Gyro Jerk signals on the X-axis. This was calculated using body linear acceleration from the accelerometer and angular velocity from the gyroscope. | Radians per second
28 | Body_Gyro_Jerk_Mean_Y | Mean value of the Gyro Jerk signals on the Y-axis. This was calculated using body linear acceleration from the accelerometer and angular velocity from the gyroscope. | Radians per second
29 | Body_Gyro_Jerk_Mean_Z | Mean value of the Gyro Jerk signals on the Z-axis. This was calculated using body linear acceleration from the accelerometer and angular velocity from the gyroscope. | Radians per second
30 | Body_Gyro_Jerk_Std_X | Standard deviation value of the Gyro Jerk signals on the X-axis. This was calculated using body linear acceleration from the accelerometer and angular velocity from the gyroscope. | Radians per second
31 | Body_Gyro_Jerk_Std_Y | Standard deviation value of the Gyro Jerk signals on the Y-axis. This was calculated using body linear acceleration from the accelerometer and angular velocity from the gyroscope. | Radians per second
32 | Body_Gyro_Jerk_Std_Z | Standard deviation value of the Gyro Jerk signals on the Z-axis. This was calculated using body linear acceleration from the accelerometer and angular velocity from the gyroscope. | Radians per second
33 | Body_Acc_Mag_Mean | Magnitude of the mean body acceleration signals on the three-dimensional signals. The body acceleration signal was obtained by subtracting the gravity from the total acceleration and calculating the magnitude using the Euclidean norm. | Standard gravity units (g)
34 | Body_Acc_Mag_Std | Magnitude of the standard deviation body acceleration signals on the three-dimensional signals. The body acceleration signal was obtained by subtracting the gravity from the total acceleration and calculating the magnitude using the Euclidean norm. | Standard gravity units (g)
35 | Gravity_Acc_Mag_Mean | Magnitude of the mean Gravity acceleration signals on the three-dimensional signals. The gravity acceleration signal was obtained by subtracting the total acceleration from gravity and calculating the magnitude using the Euclidean norm. | Standard gravity units (g)
36 | Gravity_Acc_Mag_Std | Magnitude of the standard deviation Gravity acceleration signals on the three-dimensional signals. The gravity acceleration signal was obtained by subtracting the total acceleration from gravity and calculating the magnitude using the Euclidean norm. | Standard gravity units (g)
37 | Body_Acc_Jerk_Mag_Mean | Magnitude of the mean body Jerk signals on the three-dimensional signals. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals and calculating the magnitude using the Euclidean norm. | Radians per second
38 | Body_Acc_Jerk_Mag_Std | Magnitude of the standard deviation body Jerk signals on the three-dimensional signals. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals and calculating the magnitude using the Euclidean norm. | Radians per second
39 | Body_Gyro_Mag_Mean | Magnitude of the mean Gyro signals on the three-dimensional signals. The angular velocity vector was obtained from the gyroscope and calculating the magnitude using the Euclidean norm. | Standard gravity units (g)
40 | Body_Gyro_Mag_Std | Magnitude of the standard deviation Gyro signals on the three-dimensional signals. The angular velocity vector was obtained from the gyroscope and calculating the magnitude using the Euclidean norm. | Standard gravity units (g)
41 | Body_Gyro_Jerk_Mag_Mean | Magnitude of the mean Gyro Jerk signals on the three-dimensional signals. This was calculated using body linear acceleration from the accelerometer and angular velocity from the gyroscope and calculating the magnitude using the Euclidean norm. | Radians per second
42 | Body_Gyro_Jerk_Mag_Std | Magnitude of standard deviation Gyro Jerk signals on the three-dimensional signals. This was calculated using body linear acceleration from the accelerometer and angular velocity from the gyroscope and calculating the magnitude using the Euclidean norm. | Radians per second
43 | F_Body_Acc_Mean_X | Mean value of body acceleration signals on the X-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration and applying a Fast Fourier Transform (FFT). | Standard gravity units (g)
44 | F_Body_Acc_Mean_Y | Mean value of body acceleration signals on the Y-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration and applying a Fast Fourier Transform (FFT). | Standard gravity units (g)
45 | F_Body_Acc_Mean_Z | Mean value of body acceleration signals on the Z-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration and applying a Fast Fourier Transform (FFT). | Standard gravity units (g)
46 | F_Body_Acc_Std_X | Standard deviation value of body acceleration signals on the X-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration and applying a Fast Fourier Transform (FFT). | Standard gravity units (g)
47 | F_Body_Acc_Std_Y | Standard deviation value of body acceleration signals on the Y-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration and applying a Fast Fourier Transform (FFT). | Standard gravity units (g)
48 | F_Body_Acc_Std_Z | Standard deviation value of body acceleration signals on the Z-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration and applying a Fast Fourier Transform (FFT). | Standard gravity units (g)
49 | Body_Acc_Mean_Freq_X | Mean frequency of body acceleration signals on the X-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration. | Standard gravity units (g)
50 | Body_Acc_Mean_Freq_Y | Mean frequency value of body acceleration signals on the Y-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration. | Standard gravity units (g)
51 | Body_Acc_Mean_Freq_Z | Mean frequency value of body acceleration signals on the Z-axis. The body acceleration signal was obtained by subtracting the gravity from the total acceleration. | Standard gravity units (g)
52 | F_Body_Acc_Jerk_Mean_X | Mean value of the body of the Jerk signals on the X-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals and applying a Fast Fourier Transform (FFT). | Radians per second
53 | F_Body_Acc_Jerk_Mean_Y | Mean value of the body of the Jerk signals on the Y-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals and applying a Fast Fourier Transform (FFT). | Radians per second
54 | F_Body_Acc_Jerk_Mean_Z | Mean value of the body of the Jerk signals on the Z-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals and applying a Fast Fourier Transform (FFT). | Radians per second
55 | F_Body_Acc_Jerk_Std_X | Standard deviation value of the body of the Jerk signals on the X-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals and applying a Fast Fourier Transform (FFT). | Radians per second
56 | F_Body_Acc_Jerk_Std_Y | Standard deviation value of the body of the Jerk signals on the Y-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals and applying a Fast Fourier Transform (FFT). | Radians per second
57 | F_Body_Acc_Jerk_Std_Z | Standard deviation value of the body of the Jerk signals on the Z-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals and applying a Fast Fourier Transform (FFT). | Radians per second
58 | Body_Acc_Jerk_Mean_Freq_X | Mean frequency value of the body of the Jerk signals on the X-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals. | Radians per second
59 | Body_Acc_Jerk_Mean_Freq_Y | Mean frequency value of the body of the Jerk signals on the Y-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals. | Radians per second
60 | Body_Acc_Jerk_Mean_Freq_Z | Mean frequency value of the body of the Jerk signals on the Z-axis. The body linear acceleration and angular velocity were derived in time to obtain the Jerk signals. | Radians per second
61 | F_Body_Gyro_Mean_X | Mean value of the Gyro signals on the X-axis. The angular velocity vector was obtained from the gyroscope and applying a Fast Fourier Transform (FFT). | Radians per second
62 | F_Body_Gyro_Mean_Y | Mean value of the Gyro signals on the Y-axis. The angular velocity vector was obtained from the gyroscope and applying a Fast Fourier Transform (FFT). | Radians per second
63 | F_Body_Gyro_Mean_Z | Mean value of the Gyro signals on the Z-axis. The angular velocity vector was obtained from the gyroscope and applying a Fast Fourier Transform (FFT). | Radians per second
64 | F_Body_Gyro_Std_X | Standard deviation value of the Gyro signals on the X-axis. The angular velocity vector was obtained from the gyroscope and applying a Fast Fourier Transform (FFT). | Radians per second
65 | F_Body_Gyro_Std_Y | Standard deviation value of the Gyro signals on the Y-axis. The angular velocity vector was obtained from the gyroscope and applying a Fast Fourier Transform (FFT). | Radians per second
66 | F_Body_Gyro_Std_Z | Standard deviation value of the Gyro signals on the Z-axis. The angular velocity vector was obtained from the gyroscope and applying a Fast Fourier Transform (FFT). | Radians per second
67 | Body_Gyro_Mean_Freq_X | Mean frequency value of the Gyro signals on the X-axis. The angular velocity vector was obtained from the gyroscope. | Radians per second
68 | Body_Gyro_Mean_Freq_Y | Mean frequency value of the Gyro signals on the Y-axis. The angular velocity vector was obtained from the gyroscope. | Radians per second
69 | Body_Gyro_Mean_Freq_Z | Mean frequency value of the Gyro signals on the Z-axis. The angular velocity vector was obtained from the gyroscope. | Radians per second
70 | F_Body_Acc_Mag_Mean | Magnitude of the mean body acceleration signals on the three-dimensional signals. The body acceleration signal was obtained by subtracting the gravity from the total acceleration, calculating the magnitude using the Euclidean norm and applying a Fast Fourier Transform (FFT). | Standard gravity units (g)
71 | F_Body_Acc_Mag_Std | Magnitude of the standard deviation body acceleration signals on the three-dimensional signals. The body acceleration signal was obtained by subtracting the gravity from the total acceleration, calculating the magnitude using the Euclidean norm and applying a Fast Fourier Transform (FFT). | Standard gravity units (g)
72 | Body_Acc_Mag_Mean_Freq | Magnitude of the mean frequency body acceleration signals on the three-dimensional signals. The body acceleration signal was obtained by subtracting the gravity from the total acceleration, calculating the magnitude using the Euclidean norm and applying a Fast Fourier Transform (FFT). | Standard gravity units (g)
