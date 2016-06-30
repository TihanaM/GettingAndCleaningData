---
title: "Getting and Cleaning Data Course Project"
author: "Tihana"
date: "June 29, 2016"
output: html_document
---
The R script `run_analysis.R` was created for the project assigned in the Getting and Cleaning Data Coursera course.

The purpose of the project is to demonstrate the ability to effectivly collect and clean data with a final goal of preparing a tidy data set that can be used for further analysis. 

The data used in this project originates from data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


----



#####**What the R script `run_analysis.R` does**

1. Downloads the required dataset if it does not exist in the working directory.

2. Unzip the data folder and load training and test datasets

3. Load subject and activity label data for each data set (training and test) and merge them

3. Load the text files for activity labels and column labels.

4. Merge the two datasets.

5. Subset the dataset to contain only columns with mean or standard deviation.

6. Convert the activity column into a factor to relabel the activities from numbers to words as described in activity_labels.txt

7. Clean up the names of the different measurements.

8. Produce a tidy data set by summarizing the mean values of each measurement by subject and activity.




----



#####**Reproducing this project**


1. The `run_analysis.R` file should be opened in a text editor.

2. The R script should be altered to match the working directory/folder where the run_analysis.R file has been saved. Use the setwd function to do so.

3. Run `run_analysis.R` to create the desired output.



----



##### **Files Provided**

1. The script file,`run_analysis.R`, to reproduce the project is included in the repo.

2. A code book file , `CodeBook.md`, contains descriptions on the variables, data and any transformations performed in the process of cleaning the data. 

3. This `README.md` file is included in the repo as well.



----



#####**Output**

1. A text file `tidy_data_set.txt` file is created in the working directory.


