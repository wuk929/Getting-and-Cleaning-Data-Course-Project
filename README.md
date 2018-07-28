# Getting-and-Cleaning-Data-Course-Project
==================================================================
Getting and Cleaning Data Course Project
==================================================================
Ilia Bulkin
==================================================================
Main goal of the script attached is to produce a tidy dataset, according to the project requirements.
Code can be devided in the following steps:
	1) At the beggining initial data was readed by read.table function and dplyr package was activated. Column names were attached by colnames function to test and train files.
	2) Test and train datasets were merged by rbind function that does not mix the order.
	3) Activity were added to X data as a column and numbers were replaced by actual names by two for loops.
	4) Column names were modified to becoume more discriptive, accordind to the "Features_info.txt", by gsub function. 
	5) New dataset was created as a combination of the main data (X and Y) and subject column.
	6) New dataset was orgonised according to the project requirements by group_by and summarise_all function. The result was saved by write.table function.
==================================================================
