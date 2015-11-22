############################# function string_manipulation ###########################################
# function to tranform the features names in more descriptive ones, as requested in point (4). The function is just a sequence
# of substring replacements with the function gsub.
string_manipulation <- function(variables) {
  variables <- gsub("BodyBody", "Body", variables)
  variables <- gsub("tBodyAcc", "Time_BodyAccelerometer", variables)
  variables <- gsub("tGravityAcc", "Time_GravityAccelerometer", variables)
  variables <- gsub("fBodyAcc", "Frequency_BodyAccelerometer", variables)
  variables <- gsub("fGravityAcc", "Frequency_GravityAccelerometer", variables)
  variables <- gsub("tBodyGyro", "Time_BodyGyroscope", variables)
  variables <- gsub("fBodyGyro", "Frequency_BodyGyroscope", variables)
  variables <- gsub("Jerk", "_Jerk", variables)
  variables <- gsub("Mag", "_Magnitude", variables)
  variables <- gsub("\\.mean\\.\\.", "_Mean", variables)
  variables <- gsub("\\.std\\.\\.", "_StDeviation", variables)
  variables <- gsub("_Magnitude_Mean", "_Mean_Magnitude", variables)
  variables <- gsub("_Magnitude_StDeviation", "_StDeviation_Magnitude", variables)
  variables <- gsub("\\.X", "_X", variables)
  variables <- gsub("\\.Y", "_Y", variables)
  variables <- gsub("\\.Z", "_Z", variables)
  variables
}