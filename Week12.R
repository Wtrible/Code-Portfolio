library(tidyverse)

#Linear Regression relies on several assumptions
     #linearity; DV can be written as a linear combination of the IVs
     #independence; errors are independence
     #normality; distribution of the errors is normal
     #equal variance; errors have equal variance at any set of IVs


#checking assumptions
#we will create 3 models to test these assumptions
sim_1 = function(sample_size = 500) {
  x = runif(n = sample_size) * 5
  y = 3 + 5 * x + rnorm(n = sample_size, mean = 0, sd = 1)
  data.frame(x, y)
}

sim_2 = function(sample_size = 500) {
  x = runif(n = sample_size) * 5
  y = 3 + 5 * x + rnorm(n = sample_size, mean = 0, sd = x)
  data.frame(x, y)
}

sim_3 = function(sample_size = 500) {
  x = runif(n = sample_size) * 5
  y = 3 + 5 * x ^ 2 + rnorm(n = sample_size, mean = 0, sd = 5)
  data.frame(x, y)
}

#create sim data
set.seed(42)
s1=sim_1()
set.seed(42)
s2=sim_2()
set.seed(42)
s3=sim_3()

#plot the model
plot(y ~ x,data=s1,main="Sim 1",col="grey")
lm1=lm(y ~ x,data=s1)
abline(fit1)
#fitted vs residuals plot
plot(fitted(lm1),resid(lm1),col="grey",xlab="fitted",ylab="residuals",main="Sim 1")
abline(h=0) 
#examine the plot; make sure that the data is spread evenly both vertically and horizontally
   #if the spread is uneven, this fails to meet the assumptions stated above
   #if the spread does not follow the abline, it is non-linear (and fails the assumption)

#for comparison, let's look at our other simulated data sets
lm2=lm(y ~ x,data=s2)
plot(fitted(lm2),resid(lm2),col="grey",xlab="fitted",ylab="residuals",main="Sim 2")
abline(h=0)
# note the uneven spread

lm3=lm(y ~ x,data=s3)
plot(fitted(lm3),resid(lm3),col="grey",xlab="fitted",ylab="residuals",main="Sim 3")
abline(h=0)
#notice the curve

#in summary:
     #lm1 has constant variance, but is not linear
     #lm2 does not have constant variance, but is linear
     #lm3 has constant variance, but is not linear

#constant variance is called homoscedasticity
#to test for homoscedasticity, we will use the Breusch-Pagan Test
     #the BP test uses a null hypothesis of homoscedasticity, so a sufficiently large p-value is good
library(lmtest)
bptest(lm1) #runs the BP test on our simulation 1
# p>0.05, test successful, do not reject null
bptest(lm2)
# p<0.05, test failed, reject null
bptest(lm3)
# p>0.05, test successful, do not reject null

#normality
     #to test for normality, we will use the Shapiro-Wilk Test
     #SW test uses a null hypothesis of normality, so we want a sufficiently large p-value
shapiro.test(resid(lm1))
# p>0.05, test successful, do not reject null
shapiro.test(resid(lm2))
# p<0.05, test failed, reject null
shapiro.test(resid(lm3))
# p<0.05, test failed, reject null

##
##
##
#checking for and removing outliers

#cook's distance and mahalanobis distance; a large distance indicates high influence, and a likely outlier
d1=s1
d1$cooks=cooks.distance(lm1) #cooks distance is large if it is greater than 4/n
d1$mahal=mahalanobis(s1,colMeans(s1),cov(s1))

d1.2=subset(d1,d1$cooks<=(4/nrow(d1))) #remove cooks outliers
#removed 22 outliers
d1.3=subset(d1.2,d1.2$mahal>=qchisq(p=0.001,df=1)) #df is the number of IVs, use this to remove mahal outliers
#removed 0 outliers









































































































