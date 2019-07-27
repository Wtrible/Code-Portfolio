library(tidyverse) #contains many useful packages, along with some of its own functions: ggplot2, tibble, readr, purrr, dplyr, stringr, forcats

#what is "Tidy Data"
#tidy data has 3 rules:
     #each variable must have its own column
     #each observation must have its own row
     #each value must have its own cell


#for the following, I do not have a useful dataset to use for practice, so I am including the call for the help files
#useful functions
gather() #can be used when variable names are actually values
?gather #use with pipe %>%
spread() #can be used when a variable;s data points are actually variable names
?spread #use with pipe %>%

separate() #separates a column into multiple variables at a given separator character
?separate
unite() #combines multiple columns into a single column (not used as frequently, but still useful to know)
?unite

#why would we use non-tidy data
     #to save space or improve performance
     #certain fields of study have developed their own conventions for storing and using data















































































