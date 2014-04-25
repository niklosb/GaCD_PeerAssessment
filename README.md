Getting and Cleaning Data - Peer Assessment
===================

The RunAnalysis script works by storing the features, labels, subject, x and y data for both test and training in data tables. The test and training data is then merged into one table using row binding. descriptive names are then set for the x data set from the features data table. The activity labels are then merged on to the y data set. Next the subjects, y, and x data sets a combined using column binding. 

The now almost tidy data set is then scanned for features that pertain to mean and standard deviation. The other features are removed. Finally the means of the activity and subject feature pairs are found and the results are printed.
