Assumptions:
-test data is in a folder called test
-training data is in a folder called training
-metadata is in the root folder
-a change in input dataformat must result in a change in the script

Step 1. Merge test and training sets to create one dataset.

First load test sets. Consist of three files. One containing subject information the second the test set and the third the test labels.

Now combine the test set, test labels and the test subjects, start the file with subject, than activity en testset. Then name the columns.

The column names of the test set and train set is seperatly given in a file called features.txt. Feature file consists of column number and column name. Naming the columns is step 4 of the assignment but it makes analysis (step 2) easier if the namingstep is done out of order. 

Second load training sets. Consist of three files. One containing subject information, the second the training set and the training labels.
Then combine the train set, train labels and the train subjects, start the file with subject, than activity en testset.

Lastly combine test and training datasets. The sets are considered to be complementary. The subjects in the test set aren't available in the train set and visa versa.

Step 2. Extract only the measurements on the mean and standard deviation for each measurement.

Mean and standard deviation are in the column names of the full set.
The feature_info.txt describes the feature definition:
- signals
- estimates
- direction
The estimates mean and standard deviation are denoted as std(), mean() and Mean. We also like to keep subject and activity columns. Only columns with these descriptions are kept.

Step3. Use descriptive activity names to name the activities in the data set.

The discription of the activities are in a seperate file called activity_labels.txt. These are usefull for understanding and describing the activities. We keep both the numbers and their description. The numbers are easier in analysis and the description is easier to read.

Step 5. From the data set in step 3 (remember we've done 4 earlier), create a second, independent tidy data set with the average of each variable for each activity and each subject.

First aggregate the requested estimates. Then remove the old columns (mean over text give a lot of warnings and NA's). We also remove the activity numbers (these are considered duplicate variables for the tidy set). Rename the columns with descriptive names. Lastly add "meanof" to each column name.

This dataset meets the principe of tidy dataset because the variables (the mean and std estimates) are independent measurements of the subject/activity combination.