### Run_Analysis.R Code Book (describes Variables, Data, and Coding used to clean Run_Analysis.R source Data)

#### Description of run_analysis.R variables:
* unextracted - holds zipped file for extraction
* website - varification of current data file posted to website
* subject_test - subject labels for the Test data
* subject_train - subject labels for the Train data
* xtest - stores the x_test.txt accelerometer data, then extracted data
* ytest - stores the y_test.txt accelerometer data
* xtrain - stores the x_train.txt accelerometer data, then extracted data
* ytrain - stores the y_train.txt accelerometer data
* features - stores the features.txt labels
* labels - stores the activity_labels.txt labels
* feature_metadata - stores the feature.txt labels for dataset column labeling
* activity_metadata - stores the activity labels for dataset column labeling
* data - stores merged x axis data tables
* activity - stores merged y axis data tables
* subject - stores merged subject labels
* tableCombine - stores main dataset file
* idlabels - stores labels for activity/subject averaging
* datalabels - stores averaged data
* SecondDataSet - stores dataset for averaging
* SecondDataAvg - stores tidy second dataset

#### Description of run_analysis.R data:
##### Data sources:
The file "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" contains smartphone accelerometer data for analysis of the daily activities of test subjects.

The following files contain the accelerometer data, and data labels:
* subject_test.txt
* subject_train.txt
* features.txt
* y_train.txt
* y_test.txt
* X_train.txt
* X_test.txt

##### Data storage locations for processing by run_analysis.R, authored by John Akwei:
* getdata-projectfiles-UCI.zip
* "/Users/johnakwei/Desktop/Coursera/GettingandCleaningData/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"

##### Data outputs:
The data outputs I provided via my script, "run_analysis.R" are:
* DataSetCombined.txt - Main Accelerometer Dataset
* DataSetCombined.csv - Proof of tidy formatting of DataSetCombined.txt
* DataSetAveraged.txt - An Activity/Subject averaged Dataset
* DataSetAveraged.csv - Proof of tidy formatting of DataSetAveraged.txt

#### Description of run_analysis.R coding:

* The required packages to run the script are: "data.table" and "reshape2".
* Setting of local directories are required for data download, extraction, processing, and output.
* The required data is then downloaded and extracted.
* The unprocessed datasets are assigned variables for processing.
* The dataset columns are then formatted and labeled.
* The mean/standard deviation data is then extracted.
* The test/train datasets are then merged with descriptive activity names.
* The test/train datasets are then merged with subject names.
* The main dataset file is then merged with column binding, and outputed.
* The second dataset file is then averaged according to activity/subject, and outputed.
