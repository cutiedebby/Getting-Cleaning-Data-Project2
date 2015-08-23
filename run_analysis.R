## get data, if not exist, unzip
file <- 'UCI HAR Dataset.zip'

if(!file.exists(file)) {
	fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
	
	download.file(fileURL, file, method = 'curl')
	
	unzip(file)
}

library(plyr)

## read all tests and train data
         test.labels <- read.table('UCI HAR Dataset/test/y_test.txt', col.names = 'label')

  test.subjects <- read.table('UCI HAR Dataset/test/subject_test.txt', col.names = 'subject')

  test.data <- read.table('UCI HAR Dataset/test/X_test.txt')

  train.labels <- read.table('UCI HAR Dataset/train/y_train.txt', col.names = 'label')

  train.subjects <- read.table('UCI HAR Dataset/train/subject_train.txt', col.names = 'subject')

  train.data <- read.table('UCI HAR Dataset/train/X_train.txt')

## Merge data & read features, retain features of mean and sd
         data <- rbind(cbind(test.subjects, test.labels, test.data), cbind(train.subjects, train.labels, train.data))

 features <- read.table('UCI HAR Dataset/features.txt', strip.white = TRUE, stringsAsFactors = FALSE)



 features.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
 

## be specific and increment
data_mean_std <- data[, c(1, 2, features.mean.std$V1 + 2)]

## read activity labels
labels <- read.table('UCI HAR Dataset/activity_labels.txt', stringsAsFactors = FALSE)

## replace labels with label names
data_mean_std$label <- labels[data_mean_std$label, 2]

## make a list of column and feature names
current.colnames <- c('subject', 'label', features.mean.std$V2)

## tidy the list and removed all non-cha characters and convert to lowercase
current.colnames <- tolower(gsub("[^[:alpha:]]", "", current.colnames))

## use list as column names for data
colnames(data_mean_std) <- current.colnames

## get mean for comb of subj and label
aggregateData <- aggregate(data_mean_std[, 3:ncol(data_mean_std)], by = list(subject = data_mean_std$subject, label = data_mean_std$label), mean)


## write table ()
write.table(format(aggregateData, scientific=T), "tidy-data.txt", row.names = F, col.names = F, quote = 2)


































































































































































































