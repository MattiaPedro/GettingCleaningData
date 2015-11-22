# Description

This repository only contains two R scripts:
* `run_analysis.R` (main script)
* `string_manipulation.R`

## `run_analysis.R`

This is the main script. It takes care of loading the required library (`dplyr`) and sourcing `string_manipulation.R`, which contains the same name function.

The first part of the script load the features names from `features.txt` and the data from `subject_test.txt`, `Y_test.txt`, `X_test.txt`, `subject_train.txt`, `Y_train.txt` and `X_train.txt`, taking care of merging the data by columns (`subject` with `Y` and `X`) and then merging training and test set together by rows, as requested (point 1). At the same time it gives to variables thei names, loaded befor. It then turns this data frame into a `tbl_df` object, for faster `dplyr` operations.

The second part of the script performs `dplyr`-like operations to reduce the data set as requested (points 2,3): first `select`s only the variables corresponding to the subject, the activity, and the means and standard deviation of the other variables. Than turn the vector variable into a factor, converting integers to appropiate activity name, as prescribed in the `activity_label.txt` file. Finally it changes the names of the variables according to a more descriptive convention, described in the CodeBook. This is done through the function `string_manipulation`, from `string_manipulation.R`.

The third and last part of the script produces the data frame output_df, which contains the tidy data set as requested (point 5). It is contructed from the previous reduced dataset via summarisation (`summarise_each`), i.e., calculating the mean of all variables, after a `group_by` step grouping by Subject and Activity.

The final command saves `output_df` as a `.txt` file as requested.

## `string_manipulation.R`

This script contains only the definition of the function `string_manipulation` which is responsible for altering the variable names obtained from `features.txt` into a new and more descriptive convetion.

* the first line of code in the function corrects for an error: some features names have the word Body repeated two times.
* the next six lines makes the initial letters t and f and the abbreviations Acc and Gyro more explicit, making clear that t indicate variables in the Time doman, f variables in the Frequency domain (see the codebook), while Acc and Gyro stands for different tools: Accelerometer an Gyroscope.
* the next two lines inster underscores to separate different part of the name. The choice of keeping some underscore, in general discouraged, is explained in the codebook.
* other two lines are devote to clean the layout, eliminating the dots in the names, giving capital letters and onverting `std` into the clearer `StDeviation`.
* the last five lines clean again the layout, and give the same structure to all variable, such that for every variable name there will be `name_X`, `name_Y`, `name_Z` for the components and `name_Magnitude` for the module.
