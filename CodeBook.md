## The Codebook for the variables in the data set "Final_Tidy_Data_Set.txt"

The data set described below is obtained by applying the script "run_analysis.R" (See README.md) to the data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description of the research project that yielded the initial data is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The initial data set can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Variable Description (total of 68 variables):

Activity        (fctr):  The name of one of the six possible activities:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Subject         (int):  An index between 1 and 30 associated with one of 30 participants

##### The following 66 variables are associated with the average values of measurements that are related to one of the following two physical values:
* Acceleration - all variables that have "Acc" in their names. Units: standard gravity units 'g'
* Angular velocity vector measured by the gyroscope for each window sample -  - all variables that have "Gyro" in their names. Units: radians/second

##### NOTE: All features below are normalized and bounded within [-1,1].

tBodyAccmeanX   (dbl) 

tBodyAccmeanY   (dbl) 

tBodyAccmeanZ   (dbl) 

tBodyAccstdX    (dbl) 

tBodyAccstdY    (dbl) 

tBodyAccstdZ    (dbl)

tGravityAccmeanX  (dbl) 

tGravityAccmeanY  (dbl)

tGravityAccmeanZ  (dbl) 

tGravityAccstdX  (dbl)  

tGravityAccstdY  (dbl)  

tGravityAccstdZ  (dbl)  

tBodyAccJerkmeanX  (dbl) 

tBodyAccJerkmeanY  (dbl) 

tBodyAccJerkmeanZ  (dbl)   

tBodyAccJerkstdX  (dbl)   

tBodyAccJerkstdY  (dbl)  

tBodyAccJerkstdZ  (dbl)  

tBodyGyromeanX  (dbl)   

tBodyGyromeanY  (dbl)   

tBodyGyromeanZ  (dbl) 

tBodyGyrostdX  (dbl)  

tBodyGyrostdY  (dbl)    

tBodyGyrostdZ  (dbl)     

tBodyGyroJerkmeanX  (dbl)  

tBodyGyroJerkmeanY  (dbl)  

tBodyGyroJerkmeanZ  (dbl)  

tBodyGyroJerkstdX  (dbl)  

tBodyGyroJerkstdY  (dbl)    

tBodyGyroJerkstdZ  (dbl)    

tBodyAccMagmean      (dbl)   

tBodyAccMagstd        (dbl)     

tGravityAccMagmean     (dbl)    

tGravityAccMagstd      (dbl)    

tBodyAccJerkMagmean       (dbl)  

tBodyAccJerkMagstd      (dbl)    

tBodyGyroMagmean        (dbl)   

tBodyGyroMagstd        (dbl)     

tBodyGyroJerkMagmean     (dbl)   

tBodyGyroJerkMagstd     (dbl)   

fBodyAccmeanX  (dbl)        

fBodyAccmeanY  (dbl)            

fBodyAccmeanZ  (dbl)           

fBodyAccstdX  (dbl)             

fBodyAccstdY  (dbl)             

fBodyAccstdZ  (dbl)            

fBodyAccJerkmeanX  (dbl)        

fBodyAccJerkmeanY  (dbl)        

fBodyAccJerkmeanZ  (dbl)       

fBodyAccJerkstdX  (dbl)         

fBodyAccJerkstdY  (dbl)         

fBodyAccJerkstdZ  (dbl)        

fBodyGyromeanX  (dbl)           

fBodyGyromeanY  (dbl)           

fBodyGyromeanZ  (dbl)          

fBodyGyrostdX  (dbl)            

fBodyGyrostdY  (dbl)            

fBodyGyrostdZ  (dbl)           

fBodyAccMagmean        (dbl)     

fBodyAccMagstd     (dbl)         

fBodyBodyAccJerkMagmean   (dbl) 

fBodyBodyAccJerkMagstd     (dbl) 

fBodyBodyGyroMagmean      (dbl)  

fBodyBodyGyroMagstd       (dbl) 

fBodyBodyGyroJerkMagmean   (dbl) 

fBodyBodyGyroJerkMagstd   (dbl) 