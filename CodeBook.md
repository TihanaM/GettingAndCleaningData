---
title: "CodeBook"
author: "Tihana"
date: "June 29, 2016"
output: html_document
---

###Description and Data Source

The data used in this project originates from data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


----


###Description of the Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed **six activities** (**WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING**) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the **training data** and 30% the **test data**.

The sensor signals (**accelerometer and gyroscope**) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


----


###Attribute Information

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.


----


#####**1.Creating a combined data set by merging the training and test data.**

Set source directory and load the following files for the separate data sets prior to merging them


**Train All Set (dim = 7352 x 563) **

- `X_train.txt`       - Training set.
- `y_train.txt`       - Training labels.
- `subject_train.txt` - ID of the subject 


**Test All Set (dim = 2947 x 563) **

- `X_test.txt`         - Test set.
- `y_test.txt`         - Test labels.
- `subject_test.txt`   - ID of the subject 



**Activity and Measurement labels**

- `features.txt`
- `activity_labels.txt`

- Assign column names and merge to create one data set.
- Combined data set, `all_data`, **dim = 10299 x 563 **



----


##### **2. Subsetting data to only include the mean and standard deviation columns.** 

Use "grepl" to find out which out of the **561 measurement** columns contains "mean" and "std" in their name.
A total of **66** columns did.
All data is then subseted in "subset_all_data" which has **dim=10299 x 68**


----



##### **3. Introduction of descriptive activity names to name the activities in the data set.**

The activity column was converted into a factor variable and level names where changed according to the "activity_labels.txt" file that was provided.

Before  | After
--------|-------
1       |WALKING : subject was walking during the test
2       |WALKING_UPSTAIRS : subject was walking up a staircase during the test
3       |WALKING_DOWNSTAIRS : subject was walking down a staircase during the test
4       |SITTING : subject was sitting during the test
5       |STANDING : subject was standing during the test
6       |LAYING : subject was laying down during the test


----



##### **4. Labeling the data set measurements with more descriptive names.**

gsub was used to transform some of the measurement names into more despriptive ones.


Before  | After
--------| -------------
t       | time
f       | frequency
Acc     | Accelerometer
Gyr     | Gyroscope
Mag     | Magnitude


----


##### **5. A tidy data set is created by summarizing the mean values of each measurement by subject and activity**

**dim (tidy_data_set) = 180 x 68**

   




