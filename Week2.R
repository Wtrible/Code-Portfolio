#create objects a, b, and c
a=c(1:10)
b=c("a","b","c","d","e","f","g","h","i","j")
c=c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,TRUE,FALSE)
#view the list
ls()

#open the club file
club=read.table(file="http://nathanieldphillips.com/wp-content/uploads/2015/12/club.txt",
                sep="\t",
                header=TRUE)
#save the club file to data folder
write.table(club,
            file="data/club.txt",
            sep="\t")
#save a, b, c, and club.df to an rdata file
save(a,b,c,club,file="data/myobjects.RData")
#clear the environment
rm(list=ls())
ls()

#create some code for the environment
data=mtcars
summaries=summary(data)
library(psych)
descrptions=describe(data)

#save everything in the environment to an rdata file
save.image(file="data/myobjects2.RData")

