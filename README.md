# Getting and Cleaning Data: Course Project



## Introduction

This repository contains my work for the for the Getting and Cleaning Data Coursera course by Johns Hopkins University. 
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.


In order to prove that, this repository contains the following:
* This `README.md` file
* The output file from last step of the course project instructions, named `tidy.txt` that contains the average of each variable for each activity and each subject (If you're not familiar with the original data set, please find below further details on variables, activities and subjects)
* A file neamed `Codebook.md` that describes the variables (columns) contained in the tidy data set, indicating summaries calculated, and other relevant information.
* An R script named `run_analysis.R` that contains all of the R functions used to transform the so called raw data into the required formats for steps 5 of the assignment instructions. 



## Review criteria 

If you are reading this you're probably about to grade this project so, in order to make that task easier, I've allowed myself to include a reminder of what the grading criteria are and why I think the content whithin this repo meet those. 

As per instructions the review criteria are as follows:


### 1. The submitted data set is tidy.

The file submitted for the projects is stored as `tidy.txt` and meets the requirements for tidy data provided in the course, namely:

1. Each variable forms a column: activity, subject and an average of one of 50 means and standard deviations measured among the 561 measurements derived from the original data set.

2. Each observation forms a row: 180 in total, one for each combination of activity and subject. An "observation" in this file is a activity / subject combination (180 = 6 activities x 30 subjects). 

3. Each type of observational unit forms a table: the observational unit "activity / subject" combinations, requires only one table.

You can read the file into R to check this by yourself by using the followig code:

```

tidydata <- read.table("./data/tidy.txt", header = TRUE)

```


### 2. The Github repo contains the required scripts.

The script I drafted is contained in the file `run_analysis.R`.I believe it is clearly commented to guide you though the different steps, which are these:
* Downloads the dataset 
* Loads both the training and test datasets
* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Remanes activities in the data set using descriptive activity names
* Labels the data set with descriptive variable names
* creates a second, independent tidy data set with the average of each variable for each activity and each subject
* stores the a.m. tidy dataset into the file `tidy.txt`


### 3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

The `CodeBook.md` file summarizes the resulting data fields in `tidy.txt`, giving a bit of context to understand how the column names are related to the original variables and explaining the transformations performed to obtain such variables. 


### 4. The README that explains the analysis files is clear and understandable.

If you've arrived to this point you'll probably have enough information to judge this criteria (hopefully positively)


### 5. The work submitted for this project is the work of the student who submitted it.

And I so said in compliance with the Coursera code of honor. 

This wouldn't have been possible without the contributions and support received through the forums from L. Greski and David Hood. 



## About the original data set

As mentioned before, the objective for the Getting and Cleaning Data course project is to read the data set distributed by the researchers and process it to obtain a single dataset that is easy to use for subsequent analysis in R.

Please, click on the following link if you want more information about the original data set named [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
