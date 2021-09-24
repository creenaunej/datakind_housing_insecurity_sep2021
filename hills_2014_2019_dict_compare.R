#Set a working directory 
setwd("/Users/jordancreenaune/Documents/R/datakind/American Community Survey Data")
#Import two data sets needed for this analysis 
hills_2014 <- read.csv("hillsborough_acs5-2014_census.csv")
hills_2019 <- read.csv("hillsborough_acs5-2019_census.csv")
acs_dict <- read.csv("acs5_variable_dict_2014_2019.csv")
#Check data is imported 
head(hills_2014)
head(hills_2019)

#find number of columns in each data set 
ncol(hills_2014)
ncol(hills_2019)

hillscombined <- list(hills_2014,hills_2019)


hillscombined <- compare_df_cols(hillscombined)

sum(is.na(hillscombined$hillscombined_1)) #61 

n_a_compared <- hillscombined %>%
  rowid_to_column() %>%
  filter(is.na(hillscombined_1)) %>% 
  rename(variable_code = column_name)



dict_compared_combined <- merge(n_a_compared,acs_dict, by='variable_code' )

