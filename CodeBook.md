# Code Book

This Code Book serves as a description of the dataset `output.txt` submitted by Mattia Pedrini in partial fulfillment of the requirments for the Coursera course Getting and Cleaning data, from John Hopkins University.

## Introduction

The dataset is an elaboration over the Human Activity Recognition Using Smartphones Dataset, publicly available  [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## The Human Activity Recognition Using Smartphones Dataset

As a guide to understand the structure of the submitted dataset (and as acknowledgement as well), we quote here the original description of the Human Activity Recognition Using Smartphones Dataset.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

Notes: 

* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

## The Dataset

In this dataset we provide features from the accelerometer and gyroscope 3-axial raw signals `Time_Accelerometer_XYZ` and `Time_BodyGyroscope_XYZ`. These time domain signals (denoted by the prefix Time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`Time_BodyAccelerometer_XYZ` and `Time_GravityAccelerometer_XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`Time_BodyAccelerometer_Jerk_XYZ` and `Time_BodyGyroscope_Jerk_XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`Time_BodyAccelerometer_Magnitude`, `Time_GravityAccelerometer_Magnitude`, `Time_BodyAccelerometer_Jerk_Magnitude`, `Time_BodyGyroscope_Magnitude`, `Time_BodyGyroscope_Jerk_Magnitude`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `Frequency_BodyAccelerometer_XYZ`, `Frequency_BodyAccelerometer_Jerk_XYZ`, `Frequency_BodyGyroscope_XYZ`, `Frequency_BodyAccelerometer_Magnitude`, `Frequency_BodyAccelerometer_Jerk_Magnitude`, `Frequency_BodyGyroscope_Magnitude`, `Frequency_BodyGyroscope_Jerk_Magnitude`. (Note the prefix Frequency to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* `Time_BodyAccelerometer_XYZ`
* `Time_GravityAccelerometer_XYZ`
* `Time_BodyAccelerometer_Jerk_XYZ`
* `Time_BodyGyroscope_XYZ`
* `Time_BodyGyroscope_Jerk_XYZ`
* `Time_BodyAccelerometer_Magnitude`
* `Time_GravityAccelerometer_Magnitude`
* `Time_BodyAccelerometer_Jerk_Magnitude`
* `Time_BodyGyroscope_Magnitude`
* `Time_BodyGyroscope_Jerk_Magnitude`
* `Frequency_BodyAccelerometer_XYZ`
* `Frequency_BodyAccelerometer_Jerk_XYZ`
* `Frequency_BodyGyroscope_XYZ`
* `Frequency_BodyAccelerometer_Magnitude`
* `Frequency_BodyAccelerometer_Jerk_Magnitude`
* `Frequency_BodyGyroscope_Magnitude`
* `Frequency_BodyGyroscope_Jerk_Magnitude`

For each of these signals, mean (denoted `_Mean`) and standard deviation (denoted `_StDeviation`) were estimated

Lastly, each of the variables was averaged across all the measurments for a single `Subject` in a single `Activity` (the two features acting as keys).

