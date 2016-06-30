## Step 1
## Downloading file
#################################################################################################

if(!file.exists("./data")){dir.create("./data")}

file_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_Url,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

list.files("./data/UCI HAR Dataset", recursive = TRUE)


## Step 2
## Importing files for training and test sets and creating one data set
#################################################################################################

##importing files for test
test_subject<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
test_set<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
test_lable<-read.table("./data/UCI HAR Dataset/test/y_test.txt")


##importing files for training
train_subject<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
train_set<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
train_lable<-read.table("./data/UCI HAR Dataset/train/y_train.txt")

##introducing feature labels
set_lable<-read.table("./data/UCI HAR Dataset/features.txt")

##introducing activity labels
activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
activity_labels

##putting lables to column names of train_set and test_set data
lables<-set_lable[,2]
names(train_set)<-lables
names(test_set)<-lables


##checking dimensions
dim(train_set)  ##7352 x 561
dim(test_set)  ##2947 x 561

##creating TRAIN ALL set
train_all<-cbind(train_set,train_subject,train_lable)
dim(train_all)  ##7352 x 563

##creating TEST ALL set
test_all<-cbind(test_set,test_subject,test_lable)
dim(test_all)  ##2947 x 563

##combining ALL DATA
all_data<-rbind(train_all, test_all)
dim(all_data)  ##10299   563

##adding names for activity and subject
names(all_data)[562]<-"subject"
names(all_data)[563]<-"activity"



## Step 3
## Creating a subset of the data with mean and standard deviation of each measurement
#################################################################################################



##finding columns with "std" and "mean" - and getting column number out

stat_lable<-set_lable[grepl("mean\\(\\)|std\\(\\)",set_lable$V2),]
dim(stat_lable) ## 66 x 2

library(dplyr)

##forming a variable holding all the relevant columns for subsetting of data
subset_cols<-stat_lable[,1]


##subset all_data
subset_all_data<-subset(all_data[,c(subset_cols,562,563)])
dim(subset_all_data)  ##10299    68




## Step 4
## Using descriptive activity names
#################################################################################################


##turning activity column into factor variable and changing names of levels
subset_all_data_activity<-subset_all_data
subset_all_data_activity$activity=factor(subset_all_data_activity$activity)
levels(subset_all_data_activity$activity)
levels(subset_all_data_activity$activity)[levels(subset_all_data_activity$activity)=="1"]="WALKING"
levels(subset_all_data_activity$activity)[levels(subset_all_data_activity$activity)=="2"]="WALKING_UPSTAIRS"
levels(subset_all_data_activity$activity)[levels(subset_all_data_activity$activity)=="3"]="WALKING_DOWNSTAIRS"
levels(subset_all_data_activity$activity)[levels(subset_all_data_activity$activity)=="4"]="SITTING"
levels(subset_all_data_activity$activity)[levels(subset_all_data_activity$activity)=="5"]="STANDING"
levels(subset_all_data_activity$activity)[levels(subset_all_data_activity$activity)=="6"]="LAYING"





## Step 5
## Use descriptive names for the different measurements
#################################################################################################

##Have a look at names for the different measures and change to more descriptive
names(subset_all_data_activity)

names(subset_all_data_activity)<-gsub("^t", "time", names(subset_all_data_activity))
names(subset_all_data_activity)<-gsub("^f", "frequency", names(subset_all_data_activity))
names(subset_all_data_activity)<-gsub("Acc", "Accelerometer", names(subset_all_data_activity))
names(subset_all_data_activity)<-gsub("Gyro", "Gyroscope", names(subset_all_data_activity))
names(subset_all_data_activity)<-gsub("Mag", "Magnitude", names(subset_all_data_activity))

names(subset_all_data_activity)




## Step 6
## Creation of a second, independent tidy data set with averae of each measurement variable for each acitivity and each subject
#############################################################################################################################

##Splitting data for averages by first grouping it by subject then activity
tidy_data_set<-group_by(subset_all_data_activity, subject, activity)%>%summarise_each(funs(mean))
dim(tidy_data_set) ##180 x 68
write.table(tidy_data_set, file = "tidy_data_set.txt",row.name=FALSE)
