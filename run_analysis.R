#this program is for Cleanning data course project

#libraris

library(plyr)


# lets read test and train data seperately, clean them individually, then merge them together

# find feature list
feature_files<-list.files("UCI HAR Dataset", full.names ="TRUE")
active_labels <-read.table(feature_files[1],header =FALSE)
active_labels[,1] <-as.numeric(active_labels[,1]) 

# we set active labels as label_id and label

colnames(active_labels)<- c("label_id","labels")

# read features
features<- read.table(feature_files[2],header =FALSE)
features[,1]<- as.numeric(features[,1])

#similarly,change col names 
colnames(features) <- c("feature_id","feature")

# read train data
train_files<-list.files("UCI HAR Dataset\\train", full.names ="TRUE", recursive = "TRUE")
subject_train<- read.table(train_files[10],header =FALSE)
x_train <- read.table(train_files[11],header =FALSE)
y_train <- read.table(train_files[12],header =FALSE)


# read test data
test_files<-list.files("UCI HAR Dataset\\test", full.names ="TRUE", recursive = "TRUE")
subject_test<- read.table(test_files[10],header =FALSE)
x_test <- read.table(test_files[11],header =FALSE)
y_test <- read.table(test_files[12],header =FALSE)


#================================================================
# merge test and training data
test_set <-cbind(y_test,subject_test,x_test)
train_set <-cbind(y_train,subject_train,x_train)
total_data <- rbind(train_set,test_set)

#================================================================
#Extracts only the measurements on the mean and standard deviation for each measurement
mean_std_index <- grep("*-mean\\(\\)*|*-std\\(\\)*",features[,2])

#add the first columns to mean_std_index
mean_std_index <-mean_std_index+2

mean_std <- total_data[,c(1,2,mean_std_index)]


#================================================================
#Uses descriptive activity names to name the activities in the data set
colnames(mean_std)<- c("activeity_id","subject",as.character(features[mean_std_index,2])) #change colnames


#================================================================
#Appropriately labels the data set with descriptive variable names.

activity <- active_labels[mean_std[,1], 2]

mean_std <- cbind(activity,mean_std)


#================================================================
#From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject

# only calculate variables 
tidy_data <- ddply(mean_std, .(subject, activity), function(x) colMeans(x[,4:69]))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)






