# STEP 0: PREPARATIONS:

# NOTE: We will assume that the script run_analysis.R is stored 
# in the directory that contains the raw data for the project.

# Read the activity labels
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("activitynumber", "activityname")

# The column with activity numbers is redundant so let's get rid of it:
activity_labels <- activity_labels$activityname

# Read the feature names:
feature_names <- read.table("features.txt")
feature_names <- feature_names$V2

# Read the training set of feature vecors
X_train <- read.table("train/X_train.txt")

# Check the dimensionality: must have 561 features
dim(X_train) # ---> [1] 7352  561

# Read the training set of labels
y_train <- read.table("train/y_train.txt")

# Check the dimensionality: must be one label per observation
dim(y_train) # ---> [1] 7352    1

# Read the list of subjects (persons) who carried out 
# each observation in the training set
subject_train <- read.table("train/subject_train.txt")

# FOUND that the number of observations in 
# the training set n_train = 7352.
n_train <- dim(subject_train)[1]

# Read the test set of feature vecors
X_test <- read.table("test/X_test.txt")

# Check the dimensionality: must have 561 columns 
# that represent features
dim(X_test) # ---> [1] 2947  561

# Read the test set of labels
y_test <- read.table("test/y_test.txt")

# Check the dimensionality: must be one label per observation
dim(y_test) # ---> [1] 2947   1

# Read the list of subjects (persons) 
# who carried out each observation in the test set
subject_test <- read.table("test/subject_test.txt")
dim(subject_test) # ---> [1] 22947    1

# FOUND that the number of observations in 
# the test set n_test = 2947.
n_test <- dim(subject_test)[1]

# PART 1. Merge the training and the test sets to create one data set.

# Merge the feature and label training sets in one data frame:
xy_train <- cbind(X_train,y_train, subject_train)
dim(xy_train) # ---> [1] 7352  563 (NOTE: 563 = 561 + 1 + 1 --- CORRECT)

# Merge the feature and label test sets in one data frame:
xy_test <- cbind(X_test,y_test, subject_test)
dim(xy_test) # ---> [1] 2947  563 (NOTE: 563 = 561 + 1 + 1 --- CORRECT)

# Merge the train and test sets. This time we have to use the row binding - rbind():
xy_all <- rbind(xy_train, xy_test)
dim(xy_all) # --> [1] 10299   563

# The total number of observations:
n_all <- dim(xy_all)[1] # --> [1] 10299

# PART 2. Extract only the measurements on the mean and 
# standard deviation for each measurement.


# I. First, let's make a list of columns (variables) we want to extract.
# We are interested in all names that contain either "mean()" or "std()":
means_stds_feature_index <- grep("mean\\(\\)|std\\(\\)", feature_names)

# II. a) Extract the columns with mean() and std(), 
# PLUS the activity (column #562) and the subject (column #563) labels.
# b) Save the result in the new data frame.
xy_all_means_stds <- xy_all[, 
          c(means_stds_feature_index, dim(xy_all)[2]-1, dim(xy_all)[2])]

dim(xy_all_means_stds) # --> [1] 10299    68

# NOTE: According to the previous step, there are 66 variables 
# related to the means and standard deviations.

# PART 3: Use descriptive activity names to name the activities in the data set

# NOTE: I chose not to create another column that would have explicit 
# activity names, to avoid redundancy.
# Instead, I replace the numeric labels with strings of activity names.
names(xy_all_means_stds)

# "V1.1" is the name of the last coulm, which contains the activity label:
head(xy_all_means_stds$V1.1) 
tail(xy_all_means_stds$V1.1)

# Let's replace the number with an explicit name:
xy_all_means_stds <- dplyr::mutate(xy_all_means_stds, V1.1 = activity_labels[V1.1])

# TESTS
head(xy_all_means_stds$V1.1)
head(xy_all_means_stds[,c(66,67,68)])

# PART 4: Appropriately label the data set with descriptive variable names.

means_stds_feature_names <- feature_names[means_stds_feature_index]
length(means_stds_feature_names) # --> [1] 66

# Since we plan on using these feature names to properly label the 
# variables (AKA features) in the data frame,
# let's "clean them up", in the same spirit it was discussed in Week 4
# of this course:

# 1) Get rid of hyphens and parantheses:
means_stds_feature_names <- gsub("[-(),]", "", means_stds_feature_names)
head(means_stds_feature_names)

names(xy_all_means_stds) <- c(means_stds_feature_names, "Activity", "Subject")

# PART 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average 
# of each variable for each activity and each subject.

# Group the data frame by the activity and the subject:
xy_all_means_stds_grouped <- dplyr::group_by(xy_all_means_stds, Activity, Subject)

# Apply the dplyr function summarise_each: 
var_averages <- dplyr::summarise_each(xy_all_means_stds_grouped, funs(mean))
dim(var_averages) # --> [1] 180  68  <--- CORRECT
# TEST
head(var_averages)
tail(var_averages)

# Save the final data set in a txt-file:
write.table(var_averages, file = "Final_Tidy_Data_Set.txt", row.name=FALSE) 
