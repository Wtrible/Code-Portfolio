library(tidyverse)
data=mtcars #we will be using the mtcars dataset for practice; it is built into R

#Principle Component Analysis (PCA) works best with numerical data
data= data[,c(-8,-9)] #remove the two categorical variables (vs and am)

data.pca=prcomp(data,center=TRUE,scale=TRUE) #compute principal components
summary(data.pca) #each of the principle components (PCA1 to PCA9, in this case) explains a certain Proportion of the Variance

#we need ggbiplot, which is not available on CRAN
library(devtools)
find_rtools()
install_github("vqv/ggbiplot")
#
library(ggbiplot) #we will use this to create a biplot
#biplots display the position of each sample int erms of PC1 and PC2 and the initial variable sthat map onto this viz
library(ggthemes)

ggbiplot(data.pca) #create a biplot of the pca
#next we will add labels
ggbiplot(data.pca,labels=rownames(data))

#let's categorise the cars by origin (info provided by datacamp)
d2=c(rep("Japan", 3), rep("US",4), rep("Europe", 7),rep("US",3), "Europe", rep("Japan", 3), rep("US",4), rep("Europe", 3), "US", rep("Europe", 3))
ggbiplot(data.pca,labels=rownames(data),groups=d2,ellipse=TRUE)

#while the defaults for ggbiplot are PCA1 and PCA2, we can select different PCA values
#let's make a plot with PCA3 and PCA4
ggbiplot(data.pca,choices=c(3,4),labels=rownames(data),groups=d2,ellipse=TRUE)

##other paramters with ggbiplot
#we can add a circle to our plot
ggbiplot(data.pca,labels=rownames(data),groups=d2,ellipse=TRUE,circle=TRUE)
#we can scale observations and variables
ggbiplot(data.pca,obs.scale=1,var.scale=1,labels=rownames(data),groups=d2,ellipse=TRUE)
#we can remove the lines
ggbiplot(data.pca,obs.scale=1,var.scale=1,labels=rownames(data),groups=d2,ellipse=TRUE,var.axes=FALSE)

#the following functions can also be used to customise the plot
ggbiplot(data.pca,obs.scale=1,var.scale=1,labels=rownames(data),groups=d2,ellipse=TRUE,var.axes=FALSE) +
  scale_colour_manual(name="Origin",values=c("forest green","red3","dark blue")) + #this allows us to specify the group colours
  ggtitle("PCA of mtcars dataset") + #sets a title
  theme_economist() + #specify a theme; I am using the economist theme
  theme(legend.position="bottom") #sets the location of the legend; the "theme()" argument overrides the preset theme settings

#let's play with the data to see how our changes take effect
#we will make a super car, and see where it goes on the biplot
supercar=c(1000,60,50,500,0,0.5,2.5,0,1,0,0)
d3=rbind(data,supercar)
d3.2=c(d2,"Andromeda") #clearly our super car is from another galaxy
d3=d3[,c(-8,-9)] #remove that categories
d3.pca=prcomp(d3,center=TRUE,scale=TRUE)
#let's plot it!
ggbiplot(d3.pca,obs.scale=1,var.scale=1,labels=c(rownames(data),"supercar"),groups=d3.2,ellipse=TRUE,var.axes=FALSE) +
  scale_colour_manual(name="Origin",values=c("forest green","red3","dark blue","violet")) + 
  ggtitle("PCA of mtcars dataset, plus supercar") + 
  theme_economist() + 
  theme(legend.position="bottom") 
#welp, that threw off our PCA



































































































