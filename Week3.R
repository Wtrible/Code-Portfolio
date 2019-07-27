#Formulate your question
#Which Counties in the United States have the highest average solar radiation?

#load data set
library(readr)
ozone=read.csv(file="~/HU/2019 Summer/ANLY-506 EDA/EDA Rproject/US EPA data 2017.csv")
data=ozone               

#check packaging (I think this also counts as "Checking my n's")
nrow(data)
ncol(data)
#both items match the number in the .csv file.
#I freaked out for a moment because I thought we were using the same dataset as the textbook, and I got a different result. I now realise this is not the case.

#run str()
str(data)

#look at head and tail of data set
head(data)
tail(data)
#when using tail(), I noticed that the terms "State Name" and "County Name" are loosely defined, as "County of Mexico" is listed as a state, with the secific county listed as "Baja California Norte"

#check your n's
unique(data$State.Name)
#My data represent all 50 states, plus the District of Columbia, Puerto Rico, the U.S. Virgin Islands, and the Country of Mexico

#validate with at least one external data source
library(psych)
describe(data$Arithmetic.Mean[which(data$Pollutant.Standard=="Ozone 8-Hour 2008")])
#according to the textbook, whose source is the EPA, the 8-hour average pollutant count in 2008 was not to exceed 0.075 ppm. Our data appears to agree with that.

#Try the easy solution first
sunburn=subset(data,data$Parameter.Name=="Solar radiation")
library(tidyverse)
sunrank=sunburn[,c(28,51,52)]
sunrank=sunrank %>% 
  group_by(Arithmetic.Mean,State.Name,County.Name) %>%
  arrange(desc(Arithmetic.Mean))
head(sunrank) #highest solar radiation
tail(sunrank) #lowest solar radiation

#challenge your solution
#Many regions do not have the measurment of solar radiation levels
#It is also possible that I am reading the measurments incorrectly, as I do not have a legend to define each of the variables/columns with. I am simply assuming that the Arithmetic.Mean column was the correct one to use.

#Follow-Up questions
#Do I have the right Data? No, these data were compiled for the purpose of evaluating air pollution, and my question is in regard to solar radiation.
#Do I need other data? Longitudinal data may be helpful to remove outliers, along with data for more regions.
#Do I have the right question? No, I believe a better question would be "Which regions in the United States have the most sunight?" (as measured by cloud cover, precipitation, and objects that may obstruct sunight) This question would provide more useful and relevant results to society, as those locations would be good candidates for solar energy farms.
