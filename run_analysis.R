library(dplyr)
source("string_manipulation.R")

# loading the 561 features names as a character vector
features <- as.character(read.table("UCI HAR Dataset/features.txt")[,2])

# loading all the data at once, combining with cbind and rbind. Column names are also assigned:
# - subject - for the subject identifier
# - label - for the activity label
# - all the names in the vector features, for the data in X_train/test
# the loaded data frame is also converted to a tbl_df object, for the purpose of using dplyr commands
#
#In particular, this realzes point (1) of the assignment
data_df <- tbl_df(rbind(
  cbind(read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject"),
        read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label"),
        read.table("UCI HAR Dataset/train/X_train.txt", col.names = features)
  ),
  cbind(read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject"),
        read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label"),
        read.table("UCI HAR Dataset/test/X_test.txt", col.names = features)
  )
))

# some checks on data consistency. Printing the number of entries for each subject, for each activity, and grouped by both
data_df %>% group_by(subject) %>% summarise(length(label))
data_df %>% group_by(label) %>% summarise(length(label))
data_df %>% group_by(subject, label) %>% summarise(length(label))

# using dplyr operations, the dataset required by points (2) and (3) is constructed.
reduct_df <- data_df %>%
  # selecting from data_df the columns subject and label, plus all the columns containing the string ".mean.." (note that this is a trick
  # to exclude columns with "meanFreq") which we are not interested in, and all the columns containing "std" (for Standard Deviation)
  select(subject, label, contains(".mean.."), contains("std")) %>% 
  # in order to use descriptive activity names, we transform the column 'label' to a factor with by applying the factor command naming 
  # the levels 1:6 with the appropriate activity.
  mutate(label = factor(label, levels = 1:6, labels = c("Walking", "Walking Up", "Walking Down", "Sitting", "Standing", "Laying"))) %>% 
  # we also renamed the first two columns. This makes the data clearer and is also part of point (4)
  rename(Subject = subject, Activity = label)

# transforming the features names according to the conventions in the README file, and to the request of point (4), with the function
# string_manipulation defined in string_manipulation.R
names(reduct_df)[3:68] <- string_manipulation(names(reduct_df)[3:68])

# using dplyr command, we produce the final tidy dataset as in point (5)
output_df <- reduct_df %>% 
  # we usa a combination of group_by and summarise, to produce the mean of each column for each combination of Subject-Activity
  group_by(Subject, Activity) %>% 
  # for speeding up and for cleaner code, we actually use the variant summarise_each, which allow us to apply the same function
  # to each of the 66 features
  summarise_each(funs(mean))

# saving the new dataset following the instruction given
write.table(output_df, file = "output.txt", row.names = FALSE)

