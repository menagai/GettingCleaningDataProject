###########################################################################
## Data summary                                                          ##
##     script made to summary the data collected by                      ##
##     Davide Anguita et al. 2012                                        ##
##                                                                       ##
## purpose: this script was created for the course project of the        ##
##          coursera's course Getting and cleanning Data.                ##
##                                                                       ##
## Project problem:                                                      ##
##      You should create one R script called run_analysis.R that        ##
##      does the following.                                              ##
##       1. Merges the training and the test sets to create one data set.##
##       2. Extracts only the measurements on the mean and standard      ##
##          deviation for each measurement.                              ##
##       3. Uses descriptive activity names to name the activities in    ##
##          the data set                                                 ##
##       4. Appropriately labels the data set with descriptive variable  ##
##          names.                                                       ##
##       5. From the data set in step 4, creates a second, independent   ##
##         tidy data set with the average of each variable for each      ##
##          activity and each subject.                                   ##
##                                                                       ##
## author: Micael Eiji Nagai                                             ##
##                                                                       ##
## input: this program use the dataset available fro Davide Anguita      ##
##        et al. 2012. The test and train directories was copied to the  ##
##        working directory                                              ##
##                                                                       ##
## output: a dataset with the subject number, the type (train or test),  ##
##         the activities, the mean and the standard deviation           ##
##         of the activities.                                            ##
##                                                                       ##
## notes:                                                                ##
##     1) the data used was collected from                               ##
##     Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra         ##
##        and Jorge L. Reyes-Ortiz. Human Activity Recognition on        ##
##        Smartphones using a Multiclass Hardware-Friendly Support       ##
##        Vector Machine. International Workshop of Ambient Assisted     ##
##        Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012          ##
##                                                                       ##
###########################################################################


## Function that read the data from train or test directory       ##
## and create a data frame with the mean and standard deviation   ##
## for each row.                                                  ##
## The parameter of this function is the type (train or test).    ##
read.data <- function( type = 'train' ){
    activities.names <- c('walking','walking_upstairs', 'walking_downstairs',
                      'sitting','standing','laying') # names of the activities
    tmp <- read.table( paste0('.//',type,'//X_',type,'.txt'), header = FALSE) # open the test set
    tmp_mean <- apply( tmp, 1, mean)    # calculate the mean of each row
    tmp_sd <- apply( tmp, 1, sd)        # calculate the standard deviation (sd) of each row
    tmp <- cbind(read.table( paste0('.//',type,'/subject_',type,'.txt'),header = FALSE, col.names = 'subject', colClasses = 'factor'),
                 type = type,
                 read.table( paste0('.//',type,'//y_',type,'.txt'), header = FALSE, col.names = 'activities'),
                 mean = tmp_mean, sd = tmp_sd) # merge the data of subject nº, activities nº and the values of mean and sd
    tmp$activities <- as.factor(activities.names[tmp$activities]) # substitute the activities code for their names
    return(tmp)                                        # return the data
}    

merged_data <- rbind(read.data('train'),read.data('test')) # merges the train and test datas

tidy_data <- aggregate(list( mean = merged_data$mean, sd = merged_data$sd),
                       by = list(subject = merged_data$subject,
                           activities = merged_data$activities, type = merged_data$type),
                       mean)            # create the tidy data with one mean and sd for each subject and activities

write.table( tidy_data, file = './/tidy_data.txt', row.name = FALSE) # write the data frame for a txt file name 
