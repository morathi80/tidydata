#Narrative in the readme.txt
#Read test data
testset <- read.table("test/X_test.txt")
testlabel <- read.table("test/y_test.txt")
testsubject <- read.table("test/subject_test.txt")
#Name testset columns 
features <- read.table("features.txt")
names(testset) <- features[,2]
#Combine test data and name last columns
test <- cbind(testlabel, testset)
test <- cbind(testsubject, test)
names(test) <- c("subject", "activity", names(testset))
#Read train data
trainset <- read.table("train/X_train.txt")
trainlabel <- read.table("train/y_train.txt")
trainsubject <- read.table("train/subject_train.txt")
#Name train columns
names(trainset) <- features[,2]
#Combine train data and name last columns
train <- cbind(trainlabel, trainset)
train <- cbind(trainsubject, train)
names(train) <- c("subject", "activity", names(trainset))
#Combine test and train sets
fullset <- rbind(test, train)
#Extract subset mean and std
extract <- fullset[, grep("subject|activity|mean|std()", colnames(fullset),ignore.case=TRUE)]
#Name activities
activitylabel <- read.table("activity_labels.txt")
names(activitylabel) <- c("activitynumber", "activitydescription")
extract <- merge(activitylabel, extract, by.x = "activitynumber", by.y = "activity")
#Create tidy additional tidy dataset
tidyset <- suppressWarnings(aggregate(extract, by = list(extract$subject, extract$activitynumber, extract$activitydescription), mean))
tidyset <- tidyset[,-c(2,4,5,6)]
colnames(tidyset)[1:2] <- c("subject", "activitydescription")
colnames(tidyset)[3:88] <- paste("meanof", colnames(tidyset)[3:88], sep="-")
write.table(tidyset, file = "tidyset.txt")

