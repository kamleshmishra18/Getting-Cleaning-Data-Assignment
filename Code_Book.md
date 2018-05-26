Steps for Completing Exercise

  1. Download the ZIP file from the assignment Page.
  2. UNZIP the file to the Directory whereever you want
  3. Check the files provided (optional)
  4. Files/Folders included for this assignment.
  
    a. 'features_info.txt': Shows information about the variables used on the feature vector.
    b. 'features.txt': List of all features.
    c. 'activity_labels.txt': Links the class labels with their activity name.
    d. 'train/X_train.txt': Training set.
    e. 'train/y_train.txt': Training labels.
    f. 'test/X_test.txt': Test set.
    g. 'test/y_test.txt': Test labels.
    h. 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
    i. 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
    j. 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
    k. 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
  
  5. Code details
  ## Get the dplyr package library
  ## If you get error as Not able to get dplyr, install the package first
    ## Setting The file path so that no need to type the full path in each read.
  ## 1. Output Steps - Create the data set of training and test
      #Reading training tables - xtrain / ytrain, subject train
      #Reading the testing tables
      #Read the features data
      #Read activity labels data
  ## 2. Output Steps - Features data set of training and test
      #Create Sanity and Column Values to the Train Data
      #Create Sanity and column values to the test data
      #Create sanity check for the activity labels value
  ## 3. Merging the train and test data
  ## 4. Creating the main data table merging both table table
  ## 5. Extracting only the measurements on the mean and standard deviation for each measurement
      #Step is to read all the values that are available
      #Get a subset of all the mean and standards and the correspondongin activityID and subjectID 
      #A subtset has to be created to get the required dataset
  ## 6. Using descriptive activity names to name the activities in the data set
  ## 7. creates a second, independent tidy data set with the average of each variable for each activity and each subject          
  ## 8. Save new data to default directory
  
