# Getting and Cleaning Data Course Project #2

Create a tidy dataset originally from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files in this repo
* README.md -- The describes how to run this program
* CodeBook.md -- Codebook describing the variables, the data and transformations
* run_analysis.R -- The script file that analyzes and create the tidy data file

## run_analysis.R goals
You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The script downloads and unzips the dataset from UCI Machine Learning Repository

The output is created in the working directory with the name of tidy-data.txt

The run_analysis.R file does the following:

* Read all tests and train data
* Merge data & read features, retain features of mean and sd
* Read activity labels
* Make a list of column and feature names
* Tidy the list and removed all non-cha characters and convert to lowercase
* Use list as column names for data
* Get mean for comb of subj and label
* Write data
