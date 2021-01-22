rm(list=ls())
library(igraph)
setwd("...") #Set your working directory
options(scipen=999)

data = read.table("Staphylococcus.txt", sep="") 
threshhold <- 200
data<- subset(data, data[ , 3] > threshhold) #prune the edges based on threshold 
#data <- data[,-3] #or just remove the weights if not used

l=unique(c(as.character(data$V1), as.character(data$V2))) # convert each string into a unique number
data <- data.frame(V1=as.numeric(factor(data$V1, levels=l)), V2=as.numeric(factor(data$V2, levels=l)))

sortedAdjacency  <- data[with(data, order(data[,1],data[,2])), ] # sort the adjacency list
data <- sortedAdjacency 
data <- data-1 #nodes from 0 to N-1

dirnew = getwd()
#save adjacencly list in a format that is used in Java
write.table(data,paste(dirnew,"/adjacencyList.txt",sep=""),row.names=FALSE, col.names = FALSE) 
