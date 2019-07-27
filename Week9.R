library(tidyverse)
#graphics devices are used to display plots
     #Rstudio has the "Viewer" pane, which is a screen device
     #other possibilities include PDF, PNG, JPEG, or SVG, which are file devices
#default is the Rstudio viewer pane
#some are device=specific, such as:
     #windows() does not work on Mac
     #quartz() does not work on Windows


#let's make a simple plot to practice with; we will copy it for later use
data=mpg
plot(x=data$cyl,y=data$displ,type="p",
        main="Test Plot",xlab="Cylinders",ylab="Displacement")

#how to use other graphics devices
     #launch graphics device
     #make plot
     #annotate plot
     #close graphics device using >dev.off()

#making a pdf; portable
pdf(file="plots/testplot.pdf")
plot(x=data$cyl,y=data$displ,type="p",
     main="Test Plot",xlab="Cylinders",ylab="Displacement")
dev.off()

#making an svg; supports interactivity
svg(file="plots/testplot.svg")
plot(x=data$cyl,y=data$displ,type="p",
     main="Test Plot",xlab="Cylinders",ylab="Displacement")
dev.off()

#pdf and svg are vector graphics

#making a png; does not resize well,good for plotting many points
png(file="plots/testplot.png")
plot(x=data$cyl,y=data$displ,type="p",
     main="Test Plot",xlab="Cylinders",ylab="Displacement")
dev.off()

#making a jpeg, good for photographs
jpeg(file="plots/testplot.jpeg")
plot(x=data$cyl,y=data$displ,type="p",
     main="Test Plot",xlab="Cylinders",ylab="Displacement")
dev.off()

#tiff() and bmp() may also be used
#png, jpeg, tiff, and bmp are scalar graphics (a.k.a. bitmaps)







































