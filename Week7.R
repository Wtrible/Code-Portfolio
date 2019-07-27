library(tidyverse) #we need ggplot2, whihc is contained within tidyverse
data=mpg #we will use the mpg data for this

p1=ggplot(data=data,aes(x=displ,y=hwy))+
  geom_point()
p1 #this creates a ggplot from the "data" data set with the aesthetics set to displ one the x axis and hwy on the y axis, then applies the geometric form of point (for a scatterplot)
p2=ggplot(data=data) +
  geom_point(mapping=aes(x=displ,y-hwy))
p2 #this will make the same plot, but I like the conventions of p1
#however, this convention can make the following easier:
p3=ggplot(data=data)+
  geom_point(mapping=aes(x=displ,y=hwy,colour=class,size=cyl))
p3 #the size of the points are now affected by the cyl variable, and the colours of the points are affected by the class variable
#if you want to set them like this, you can
data$fordblue=ifelse(data$manufacturer=="ford","blue","red")
p4=ggplot(data=data,aes(x=displ,y=hwy)) +
  geom_point(colour=data$fordblue,
             size=data$cyl)
p4 #this set size based on cyl and points are blue if the manufacturer is ford, otherwise it is red

#each geom has its own aesthetic options, such as size, shape, colour, et cetera. 
#not all geoms have the same options. for example, setting the shape of the points makes no sense if you are not plotting points, such as a boxplot

p5=ggplot(data=data,aes(x=displ,y=hwy))+
  geom_point()+
  facet_wrap(~ class)
p5 #this facets the plot, creating several plots side-by-side
#in this case, each value of the class variable has its own plot

p6=ggplot(data=data,aes(x=displ,y=hwy))+
  geom_point()+
  facet_wrap(drv ~ cyl)
p6 # this facets with two variables at once, so that each combination of those two varibales has its own plot

#facets work best with categorical variables

#much more information about different geoms can be found at:
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

p7=ggplot(data=data,aes(x=displ,y=hwy))+
  geom_smooth()
p7 #geom_smooth plots a curve to describe the relationship between the two variables

p8=ggplot(data=data,aes(x=displ,y=hwy))+
  geom_point()+
  geom_smooth()
p8 #you can lay geoms on top of each other this shows the points and the descriptive line















































