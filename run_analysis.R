library(dplyr)
setwd("D:/R/data")
trX<-read.table("X_train.txt",stringsAsFactors = FALSE)
teX<-read.table("X_test.txt",stringsAsFactors = FALSE)
trY<-read.table("y_train.txt",stringsAsFactors = FALSE)
teY<-read.table("y_test.txt",stringsAsFactors = FALSE)
trS<-read.table("subject_train.txt",stringsAsFactors = FALSE)
teS<-read.table("subject_test.txt",stringsAsFactors = FALSE)
ft<-read.table("features.txt",stringsAsFactors = FALSE)
Y<-rbind(trY,teY)
S<-rbind(trS,teS)
ac<-read.table("activity_labels.txt")
ac[,2]<-as.character(ac[,2])
cn<-ft[,2]
nb<-sort(c(grep("mean",cn),grep("std",cn)))
nb<-nb[!nb %in% grep("meanFreq",cn)]
colnames(trX)<-cn
colnames(teX)<-cn
X<-rbind(trX,teX)
X<-X[nb]

X$Activity<-Y$V1
n<-ncol(X)
for (i in 1:nrow(X)) {
  for (k in 1:6) {
  if (X[i,n]==k) {X[i,n]<-ac[k,2]}
  }}

nm<-colnames(X)
nm<-gsub("BodyBody","Body",nm) #Typo correction
nm<-gsub("tBodyAcc","time domain signals from the body accelerometer",nm)
nm<-gsub("tGravityAcc","time domain signals from the gravity accelerometer",nm)
nm<-gsub("tBodyAccJerk","time domain Jerk signals from the body accelerometer",nm)
nm<-gsub("tBodyGyro","time domain signals from the body gyroscope",nm)
nm<-gsub("tBodyGyroJerk","time domain Jerk signals from the body gyroscope",nm)
nm<-gsub("tBodyAccMag","magnitude of time domain signals from the body accelerometer",nm)
nm<-gsub("tGravityAccMag","magnitude of time domain signals from the gravity accelerometer",nm)
nm<-gsub("tBodyAccJerkMag","magnitude of time domain Jerk signals from the body accelerometer",nm)
nm<-gsub("tBodyGyroMag","magnitude of time domain signals from the body gyroscope",nm)
nm<-gsub("tBodyGyroJerkMag","magnitude of time domain Jerk signals from the body gyroscope",nm)
nm<-gsub("fBodyAcc","frequency domain signals from the body accelerometer",nm)
nm<-gsub("fBodyAccJerk","frequency domain Jerk signals from the body accelerometer",nm)
nm<-gsub("fBodyGyro","frequency domain signals from the body gyroscope",nm)
nm<-gsub("fBodyAccMag","magnitude of frequency domain signals from the body accelerometer",nm)
nm<-gsub("fBodyAccJerkMag	","magnitude of frequency domain Jerk signals from the body acceleromete",nm)
nm<-gsub("fBodyGyroMag","magnitude of frequency domain signals from the body gyroscope",nm)
nm<-gsub("fBodyGyroJerkMag","magnitude of frequency domain Jerk signals from the body gyroscope",nm)
nm<-gsub("mean()","Mean value",nm)
nm<-gsub("std()","Standard deviation",nm)
nm<-gsub("X","X direction",nm)
nm<-gsub("Y","Y direction",nm)
nm<-gsub("Z","Z direction",nm)
colnames(X)<-nm

itds<-X
itds$Subject<-S[,1]
df1 <- itds %>%
 group_by(Activity,Subject) %>%
 summarise_all(mean)

write.table(itds,file = "tidy_data.txt",row.names = FALSE)
