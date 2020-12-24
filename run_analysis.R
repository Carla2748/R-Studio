
#Import of the data and creation of variables
xtest =read.table ( "X_test.txt")
ytest =read.table ( "Y_test.txt")
subtest =read.table ( "subject_test.txt")

#Join of the create dvariables to get a final version
test <- cbind(xtest,ytest,subtest)

#Import of the data and creation of variables
xtrain =read.table ( "X_train.txt")
ytrain =read.table ( "Y_train.txt")
subtrain =read.table ( "subject_train.txt")

#Join of the create dvariables to get a final version
train <- cbind(xtrain,ytrain,subtrain)

#Join of test and train data
combined <- rbind(train, test)

#Get correct names
columnnames =read.table ( "activity_labels.txt")
colnamechar = as.character(columnnames)

#Assing correct names
colnames(combined) =colnamechar


data.table::fwrite(x = combined, file = "tidyData.txt", quote = FALSE)

