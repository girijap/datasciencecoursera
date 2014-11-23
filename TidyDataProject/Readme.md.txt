Introduction
This readme file explains the creation of a Tidy.txt file of clean data as requested in the project for Coursera class "Getting and Cleaning Data”.

Raw data information
For the training data the features exist in the X_train.txt, activity labels are in the y_train.txt file and the training subjects are in the subject_train.txt file.
For the test data the features exist in the X_test.txt, activity labels are in the y_test.txt file and the test subjects are in the subject_test.txt file.

Script and the Tidy dataset information
The script run_analysis.R merges the training and test datasets assuming the raw data is extracted and exists under the UCIdataset directory.
After merging the data descriptive labels are added and only columns associated with the mean and standard deviation are kept.
Finally this script uses the reshape2 library and creates a tidy data set containing the means of all the columns for each activity and each subject. This tidy dataset exists in a file called Tidy.txt.

Code Book information
The Codebook.md file explains the process for obtaining the clean data and the variables used.
