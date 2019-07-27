library(tidyverse) #we need dplyr, which can be loaded by itself, or is contained within tidyverse
library(nycflights13) #this package contains a data set we will use for practice

data=flights

#dplyr functions
filter() #select observations by their values
?filter
arrange() #reorder the rows
?arrange
select() #select variables by their names
?select
mutate() #create new variable susing functions of old variables
?mutate
summarise() #create a summary; used differently than >summary()
?summarise

group_by() #can be used with the above function to perform them on specific groups, instead of on the entire data set
?group_by

#all of the above function follow a similar format:
     #>function(data frame, other arguments to describe what to do)
          #output is a new data frame

#practice time
d1=filter(data,month==1,day==1) #select all flights from january first
d1

#tips and tricks for testing equality
     #when testing for equality, use == instead of =, as = is used to assign value, not test it
     #when testing if a mathematical expression equals a specific value, it may be useful to use >near(expression, test value) this will reduce errors
          #example: >sqrt(2)^2 == 2 is FALSE, but >near(sqrt(2),2) is TRUE

#numerical comparison operators
     #> : greater than
     #< : less than
     #== : equal to
     #>= : greater than or equal to
     #<= : less than or equal to
     #!= : not equal to
#logical operators
     #& : and
     #| : or
     #! : not
     #xor(x,y) : exclusive or
#to test if a value is NA
     #is.na(value)

d2=filter(data,month==11 | month==12) #selects all flights that were in novermber or december
d2
filter(data,month== 11 | 12) #this does not always work, so use the previous convention
filter(data,month %in% c(11,12)) #this does work


d3=arrange(data,year,month,day) #reorder the rows based on year. if year is the same, month is the tie-breaker. if month is also the same, day is the tie-breaker
d3 #default is ascending order
d4=arrange(data,desc(dep_delay)) #reorders the data frame in descending order by dep_delay
d4

#missing values always appear at the end

d5=select(data,year,month,day) #creates a data frame of the named columns, leaving out the rest
d5
d6=select(data,year:day) #creates a data frame of all columns from year to day (inclusive)
d6
d7=select(data,-(year:day)) #creates a data frame of all columns EXCEPT for the columns from year to day (inclusive)
d7

#these can also be useful with select()
     #starts_with("blah") : matches names that begin with "blah"
     #ends_with("blah") : matches names that end with "blah"
     #contains("blah") : matches names that contain "blah"
     #matches("blah") : selects variables that contain the regular expression "blah"
     #num_range("x",1:3) : matches x1, x2, and x3

rename(data,tail_num=tailnum) #creates a new data frame in which the tail_num column has been renamed tailnum

select(data, time_hour, air_time, everything()) #creates a new data frame in which the time_hour and air_time columns have been moved to the front
#everything() clls everything else


d8=mutate(data,
       gain = dep_delay - arr_delay, 
       speed = distance / air_time *60) #creates two new variables (gain and speed) at the end of the data set using values form other variables
head(d8$gain)
head(d8$speed)

d9=data
d9$gain=d9$dep_delay-d9$arr_delay #I like to do it this way, but mutate() works better within a pipe 
head(d9$gain)

d10=transmute(data,
              gain = dep_delay - arr_delay, 
              speed = distance / air_time *60) #creates a new data frame with ONLY the new variables created
d10

#pipes: %>%
d11= data %>%
  arrange(year,month,day) %>%
  mutate(gain = dep_delay - arr_delay, 
         speed = distance / air_time *60)
d11 #the pipe takes the object from the previous function and uses it in the next step in the pipeline
#this pipe took the "data" data frame, then arranged it by the listed arguments, then mutated it to create two new variables











































