#create some data
a=c(1:10)
b=c("a","b","c","d","e","f","g","h","i","j")
c=c(1,34,23,54,36,32,13,24,75,46)
#a, b, and c are all vectors

#understanding your vectors
class(a) #returns the class of the named vector
length(a) #returns the number of data points in the vector


#creating matrices and data frames
m1=cbind(a,b,c) #combine by column (vectors are side-by-side)
m1
m2=rbind(a,b,c) #combine by row (vectors are on top of each other)
m2
m3=matrix(a,nrow=2,ncol=5) #turn vector "a" into a matrix with nrow rows and ncol columns
m3
m4=data.frame(a,b,c) #create a data frame from the named vectors
m4

#the following data frames are included in Base R
data("ChickWeight")
data("InsectSprays")
data("ToothGrowth")
data("PlantGrowth")

#understanding your data frame
head(m4) #print the first few rows
tail(m4) #print the last few rows
View(m4) #view the data frame in a window
nrow(m4) #returns the number of rows
ncol(m4) #returns the number of columns
rownames(m4) #returns the names of the rows; if set equal to a character vector, the vector will replace the old names
colnames(m4) #returns the names of the columns; if set equal to a character vector, the vector will replace the old names
str(m4) #shows the structure of the data frame (shows the name of the data frame, the number of observations, the number of variables, the names of the variables, the classes of the variables, and the first few observations of each variable)
summary(m4) #returns summary stats for each variable of the data frame (min, 1st quartile, median, mean, 3rd quartile, max)

#subsetting a data frame
m5=m4[1:5,1:2] #creates a subset of rows 1 to 5 and columns 1 to 2 of the named data frame
m5
m4$a #calls variable "a" from data frame m4
#data frame info can be extracted with >dataframename[rows,columns]
m6=subset(m4,m4$a>=7) #creates a subset of data frame m4 of all observations for which variable "a" is greater than or equal to 7
m6

















