#Datakind - Datadive Sep 18 2021 
#Proj-housing-insecurity 


# Research Question 3 (ACS): What are the differences between the 2014 and 2019 5-year American Community Survey datasets? Which 
# variables or labels are missing from the 2014 data but in the 2019 data, and vice versa? Which 2019 variables have changed 
# significantly from the 2014 estimates?

# Task 1: Using the ACS data dictionary found here, compare variables from 2014 with variables from 2019. Do the variable codes and 
# labels remain consistent across ACS versions? For example, does DP_002E in 2014 and DP_002E in 2019 refer to the same information? 
# (Note that you can attempt this task using any county's ACS datasets - we know for certain that (e.g.) 2014 Hillsborough County 
# # and 2014 Miami-Dade County variables are consistent with each other.)
# 
# data dictionary - https://drive.google.com/file/d/1Nd1TgI7-IARuoqDiexzT8MWLR6A3RQhx/view

library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(janitor)    #helps to compare columns in dfs 


#Set a working directory 
setwd("/Users/jordancreenaune/Documents/R/datakind/American Community Survey Data")
#Import two data sets needed for this analysis 
miamid_2014 <- read.csv("miami_dade_acs5-2014_census.csv")
miamid_2019 <- read.csv("miami_dade_acs5-2019_census.csv")

#Check data is imported 
head(miamid_2014)
head(miamid_2019)

#find number of columns in each data set 
ncol(miamid_2014)
ncol(miamid_2019)

#find the list of columns that are deleted when the dfs are merged 

#setdiff(hills_2014,hills_2019) #doesnt work if column numbers dont match 

hillscombined <- list(hills_2014,hills_2019)


hillscombined <- compare_df_cols(hillscombined)

sum(is.na(hillscombined$hillscombined_1)) #61 

n_a_compared <- hillscombined %>%
                  rowid_to_column() %>%
                  filter(is.na(hillscombined_1))






