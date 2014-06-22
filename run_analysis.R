library(sqldf)
library(reshape2)

# Read features.txt
features <- read.delim("./UCI HAR Dataset/features.txt",
                       header=F,
                       sep=" ",
                       col.names=c("FeatureID","FeatureName"),
                       colClasses=c("integer","character")
)
features$FeatureName2 <- gsub("-","_",features$FeatureName,perl=T)
features$FeatureName2 <- gsub("\\(|\\)","",features$FeatureName2,perl=T)

## Read activity_labels.txt
activities <- read.delim("./UCI HAR Dataset/activity_labels.txt",
                         header=F,
                         sep=" ",
                         col.names=c("ActivityID","ActivityName"),
                         colClasses=c("integer","character")
)

## Subset measurements on mean and std dev
req_measures <- sqldf("select * from features where FeatureName like '%mean()%' or FeatureName like '%std()%'")

## Read test dataset
test.set <- read.fwf("./UCI HAR Dataset/test/X_test.txt",
                      widths=rep(16,561),
                      header=F,
                      buffersize=250,
                      col.names=features$FeatureName2,
                      colClasses=rep("numeric",561)
)
test.label <- read.delim("./UCI HAR Dataset/test/y_test.txt",
                          header=F,
                          sep=" ",
                          col.names=c("ActivityID"),
                          colClasses=c("integer")
)
test.label <- sqldf("
     select b.ActivityName 
     from 'test.label' as a, activities as b 
     where a.ActivityID=b.ActivityID
")
test.subject <- read.delim("./UCI HAR Dataset/test/subject_test.txt",
                            header=F,
                            sep=" ",
                            col.names=c("Subject"),
                            colClasses=c("integer")
)
test.set <- cbind(test.subject, test.label, test.set[,req_measures$FeatureID])

## Read train dataset
train.set <- read.fwf("./UCI HAR Dataset/train/X_train.txt",
                      widths=rep(16,561),
                      header=F,
                      buffersize=250,
                      col.names=features$FeatureName2,
                      colClasses=rep("numeric",561)
)
train.label <- read.delim("./UCI HAR Dataset/train/y_train.txt",
                          header=F,
                          sep=" ",
                          col.names=c("ActivityID"),
                          colClasses=c("integer")
)
train.label <- sqldf("
     select b.ActivityName 
     from 'train.label' as a, activities as b 
     where a.ActivityID=b.ActivityID
")
train.subject <- read.delim("./UCI HAR Dataset/train/subject_train.txt",
                            header=F,
                            sep=" ",
                            col.names=c("Subject"),
                            colClasses=c("integer")
)
train.set <- cbind(train.subject, train.label, train.set[,req_measures$FeatureID])

## Merge train and test dataset and create tidy dataset
data.set <- rbind(test.set,train.set)

## Create and save secondary tidy dataset
data.summary <- dcast(
     melt(data.set,
          id=c("Subject","ActivityName"),
          measures.var=req_measures$FeatureName2
     ), Subject+ActivityName ~ variable, mean
)
write.table(data.summary, "summary_measurements.txt", sep=" ", row.names=F)
