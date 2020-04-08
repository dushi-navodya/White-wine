
library(dplyr)  
library(rattle)  
library(NbClust)  
library(fpc)  
library(caret)  
library(MASS)  
library(flexclust)  

wineData<-read.csv("F:/MSC-Advanced Software Engineering/Data Mining/Assignment01/Whitewine.csv")  # use your own folder 

##head(wineData)
##str(wineData)
##table(wineData$quality)

data.train <- scale(wineData[-1])
##summary(data.train)
## preProcess(wineData, method=c("center", "scale"))  
set.seed(1234)

nc <- NbClust(data.train,
              min.nc=2, max.nc=15,
              method="kmeans")

table(nc$Best.n[1,])
barplot(table(nc$Best.n[1,]),    # provide bar charts####
        xlab="Numer of Clusters",
        ylab="Number of Criteria",
        main="Number of Clusters Chosen by 30 Criteria")

