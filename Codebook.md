Codebook for run_analysis.R
============================
#### Data
The file "tidy_data.txt" contains a dataset with 180 rows and 68 columns, summarizing the raw data from the training and test measurements. The first column contains the subject id, the second column contains the activity for which the measurements were obtained. The rest of the columns contain mean and standarddeviation values of the measurements (variable names are shown in the section "Variable list", in this codebook.
The tidy data set was created by using the script "run_analysis.R", described in the next section.

The original data was obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



#### run_analysis.R description
The run_analysis.R script was used to tidy up the original data, by following the following steps:
1. Loads subject files, training and test sets, and training and test labels, and merges them all together by using rbind()

2. The activities are properly named, by setting the activity column levels according to "activity_labels.txt", included in the dataset

3. All columns are properly labelled, by using the "features.txt", included in the dataset. Subject and activity labels are set manually.

4. The merged dataset is subsetted to only include columns with mean() and std() data.

5. All columnnames are changed to lower case, and parentheses and hyphens are removed.

6. A dataset containing average values of each variable for each activity and subject, is created by using the aggregate() function.

7. Finally, the dataset containing average values of each variable for each activity and subject, is saved in a .txt file in the working directory



#### Variable list
"xyz" denotes that this variable is available in an x, y, and z version (axis orientation).
Furthermore, all variables are only present as a mean or standarddeviation average, denoted by "-", which can be either "mean" or "std".

* tbodyacc-xyz
* tgravityacc-xyz
* tbodyaccjerk-xyz
* tbodygyro-xyz
* tbodygyrojerk-xyz
* tbodyaccmag
* tgravityaccmag
* tbodyaccjerkmag
* tbodygyromag
* tbodygyrojerkmag
* fbodyacc-xyz
* fbodyaccjerk-xyz
* fbodygyro-xyz
* fbodyaccmag
* fbodyaccjerkmag
* fbodygyromag
* fbodygyrojerkmag

An example: tbodyacc-xyz, is present in tbodyaccmeanx, tbodyaccmeany, tbodyaccmeanz, tbodyaccstdx, tbodyaccstdy, and tbodyaccstdz
