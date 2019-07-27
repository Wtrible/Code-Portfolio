library(tidyverse) #the packages within are necessary for data manipulation
library(cluster) #provides clustering algorithms
library(factoextra) #provides clustering viz
library(dendextend) #assists in comparing two dendrograms

#we will be using the USArrests dataset, provided by r
data=USArrests

#cluster analysis works best if data is scaled; generally, using z-scores works well
data=na.omit(data) #remove NAs
data=scale(data) #scale the data

#cluster analysis classifies data into groups based on their statistical distance
#frequently used distance measure include:
     #Euclidean distance
     #Manhattan distance
     #Pearson correlational distance
     #Spearman correlational distance
     #Kendall correlational distance
#many functions have euclidean as the default
#distance measures similarity/dissimilarity between two observations

dist1=get_dist(data) #creates a distance matrix between rows of the data frame. euclidean distance is default
fviz_dist(dist1) #creates a viz of the distance matrix
#these two fucntions are form the factoextra package

#k-means clustering has the analyst pre-specify the number of groups/clusters
k1=kmeans(data, centers=2,nstart=25) #calculates k-means cluster with 2 groups, and 25 initial configurations

fviz_cluster(k1,data=data) #to view the clusters
#it is often advantageous to run the calculations several times, selecting a different number of clusters each time
k2=kmeans(data,centers=3,nstart=25)
fviz_cluster(k2,data=data) #run with 3 clusters

#how to determine the optimal number of clusters
#elbow method (within-cluster sum of squares)
set.seed(42)
fviz_nbclust(data,kmeans,method="wss") #this creates a plot for the elbow method for kmeans clustering using the method of wss (within-cluster sum of squares)
#use the point at the elbow. in this case, it appears to be 4

#silhouette method
set.seed(42)
fviz_nbclust(data,kmeans,method="silhouette") #creates a viz for silhouette method fornkmeans clustering using the silhouette method
#use highest point, in this case it is 2, with 4 as the second-most optimal numbe rof clusters

#gap statistic
set.seed(42)
gapstat=clusGap(data,FUN=kmeans,nstart=25,K.max=10,B=50) #calculates gap statistic using kmeans clsutering with 25 initial variations, 10 max clusters, and 50 Monte Carlo samples
fviz_gap_stat(gapstat) #creates a viz of the gap stat
#use max value, in this case it appears to be 4

#4 clusters seems to be the consensus among the 3 methods
k3=kmeans(data,centers=4,nstart=25)
fviz_cluster(k3,data=data)


##
##
#hierarchical clustering

#agglomerative clustering starts with many clusters and merges until one cluster remains
#divisive clustering starts with one cluster and splits it until it is many

#agglomerative is sometimes called AGNES; agglomerative nesting
#divisive is sometimes called DIANA; divisive analysis

#linkage measures the similarity/dissimilarity between two clusters of observations
#methods to measure linkage include:
     #max linkage clustering (a.k.a. complete linkage clustering)
     #min linkage clustering (a.k.a. single linkage clustering)
     #mean linkage clustering (a.k.a. average linkage clustering)
     #centroid linkage clustering
     #ward's min variance method

#agglomerative clustering
hc1=agnes(data,method="complete") #calculates agglomerative clusters using complete linkage method
hc1$ac #prints the agglomerative coefficient; values closer to 1 suggest strong clustering structure

#assess all clustering methods
clustmethods=c( "average", "single", "complete", "ward") #agnes does not use centroid method
agnesclust=function(x) {
  agnes(data, method = x)$ac
}
map_dbl(clustmethods,agnesclust) #displays the agglomerative coefficients for each clustering method
#the closest to 1 is the optimal method, in this case it is ward's method

hc2=agnes(data,method="ward")
pltree(hc2,cex=0.6,hang=-1) #creates a viz of the dendrogram (cex and hang are for formatting)

#divisive clustering
hc3=diana(data) #does not have a method input
hc3$dc #divisive coefficient
pltree(hc3,cex=0.6,hang=-1)


#display dendrogram with k clusters highlighted
rect.hclust(hc3,k=4,border=2:5) #k is the number of clusters, border sets colors
#display dendrogram by highlighting clusters after cutting at height h
rect.hclust(hc3,h=500) #the height on the left is not always measured the same as the h variable


#determining optimal clusters
#elbow method
fviz_nbclust(data,FUN=hcut,method="wss")
#silhouette method
fviz_nbclust(data,FUN=hcut,method="silhouette")
#gap stat method
gapstat=clusGap(data,FUN=hcut,nstart=25,K.max=10,B=50)
fviz_gap_stat(gapstat)

























































