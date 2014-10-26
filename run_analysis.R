

  ## Working directory must be set to root of downloaded data.
  ## When run, the 'movement' data frame will contain a tidy data set
  ## containing mean and standard deviation 3D acceleration readings
  ## for 30 subjects for a variety of activities.  The 'averages' data
  ## frame will contain a tidy data set containing the averages of
  ## each variable for each activity and each subject.  See the 
  ## Readme.md and Codebook.md files for further details.

library(reshape2)
test <- read.table("./test/X_test.txt",header=FALSE)
train <- read.table("./train/X_train.txt",header=FALSE)


trainlabel <- readLines("./train/subject_train.txt")
testlabel <- readLines("./test/subject_test.txt")

trainlabel <- as.numeric(trainlabel)
testlabel <- as.numeric(testlabel)

trainactivity <- readLines("./train/y_train.txt")
testactivity <- readLines("./test/y_test.txt")

testid <- cbind(Subject=testlabel,Activity=testactivity,test)
trainid <- cbind(Subject=trainlabel,Activity=trainactivity,train)

combine <- rbind(testid,trainid)

movement <- combine[,c(1:8)]

movement$Activity <- gsub("1","WALKING",movement$Activity)
movement$Activity <- gsub("2","WALKING_UPSTAIRS",movement$Activity)
movement$Activity <- gsub("3","WALKING_DOWNSTAIRS",movement$Activity)
movement$Activity <- gsub("4","SITTING",movement$Activity)
movement$Activity <- gsub("5","STANDING",movement$Activity)
movement$Activity <- gsub("6","LAYING",movement$Activity)


names(movement) <- c("Subject","Activity","Acceleration_Mean_X","Acceleration_Mean_Y","Acceleration_Mean_Z","Acceleration_StandardDeviation_X","Acceleration_StandardDeviation_Y","Acceleration_StandardDeviation_Z")

movement <- movement[order(movement$Subject,movement$Activity),]

meanx <- tapply(movement$Acceleration_Mean_X, list(movement$Subject,movement$Activity),mean)
meanx <- melt(meanx,value.name="Ave_Accel_Mean_X")

meany <- tapply(movement$Acceleration_Mean_Y, list(movement$Subject,movement$Activity),mean)
meany <- melt(meany,value.name="Ave_Accel_Mean_Y")

meanz <- tapply(movement$Acceleration_Mean_Z, list(movement$Subject,movement$Activity),mean)
meanz <- melt(meanz,value.name="Ave_Accel_Mean_Z")

stdx <- tapply(movement$Acceleration_StandardDeviation_X, list(movement$Subject,movement$Activity),mean)
stdx <- melt(stdx,value.name="Ave_Accel_StdDev_X")

stdy <- tapply(movement$Acceleration_StandardDeviation_Y, list(movement$Subject,movement$Activity),mean)
stdy <- melt(stdy,value.name="Ave_Accel_StdDev_Y")

stdz <- tapply(movement$Acceleration_StandardDeviation_Z, list(movement$Subject,movement$Activity),mean)
stdz <- melt(stdz,value.name="Ave_Accel_StdDev_Z")


averages <- meanx
averages <- merge(averages,meany)
averages <- merge(averages,meanz)
averages <- merge(averages,stdx)
averages <- merge(averages,stdy)
averages <- merge(averages,stdz)

names(averages)[c(1,2)] = c("Subject","Activity")

averages <- averages[order(averages$Subject,averages$Activity),]

write.table(movement,"movement.txt",row.names=FALSE,sep=",")
write.table(averages,"averages.txt",row.names=FALSE,sep=",")