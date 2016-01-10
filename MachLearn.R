install.packages("xlsx")
install.packages("dplyr")
library(dplyr)
library(xlsx)

#read data
mydata1 <- read.xlsx("ADDS1.xlsx", header=TRUE,sheetIndex = 1)
mydatadf1<-data.frame(mydata1)

mydata2 <- read.xlsx("ADDS2.xlsx", header=TRUE,sheetIndex = 1)
mydatadf2<-data.frame(mydata2)

mydata <- read.xlsx("ADDS3.xlsx", header=TRUE,sheetIndex = 1)
mydata4 <- read.xlsx("ADDS4.xlsx", header=TRUE,sheetIndex = 1)
par(mar = rep(2, 4)) #resize
plot(mydata$Old, mydata$Object_Target_T2) #plot


# set.seed(2)
# #clustering
# km.out1=kmeans(mydatadf1,2,nstart=20)
# km.out1$cluster
# plot(mydatadf1,col=(km.out1$cluster+1),main="ADDS1 K-Mean Clustering of ERP, GAP, Pos, Obj ET Old Results with K=2",pch=20,cex=2)
# identify(mydatadf1)

set.seed(2)
#clustering
km.out2=kmeans(mydatadf2,2,nstart=20)
km.out2$cluster
plot(mydatadf2,col=(km.out2$cluster+1),main="K-Mean Clustering of ERP Old & ET Old Results with K=2",xlab="",ylab="",pch=20,cex=2)
identify(mydatadf2)

########## not so important
set.seed(2)
#clustering
km.out1=kmeans(mydata$OldOnly,2,nstart=20)
km.out1$cluster
plot(mydata$OldOnly,col=(km.out1$cluster+1),main="K-Mean Clustering of ERP Old Amplitudes Results with K=2",xlab="",ylab="",pch=20,cex=2)
identify(mydata$OldOnly)

#clustering
km.out4=kmeans(mydata4$Object_Target_T2,2,nstart=20)
km.out4$cluster
plot(mydata4$Object_Target_T2,col=(km.out4$cluster+1),main="K-Mean Clustering of Old Eye-tracker Stimuli Results with K=2",xlab="",ylab="",pch=20,cex=2)
########## 


#• Detect outliers with graphics
plot(mydata$OldOnly,xlab='')
abline(h=mean(mydata$OldOnly,na.rm=T),lty=1,col="red")
abline(h=mean(mydata$OldOnly,na.rm=T)+sd(mydata$OldOnly,na.rm=T),lty=2,col="blue")
abline(h=mean(mydata$OldOnly,na.rm=T)-sd(mydata$OldOnly,na.rm=T),lty=2,col="blue")
abline(h=median(mydata$OldOnly,na.rm=T),lty=3,col="green")
identify(mydata$OldOnly)

#• Detect outliers with graphics
plot(mydata4$Object_Target_T2,xlab='')
abline(h=mean(mydata4$Object_Target_T2,na.rm=T),lty=1,col="red")
abline(h=mean(mydata4$Object_Target_T2,na.rm=T)+sd(mydata4$Object_Target_T2,na.rm=T),lty=2,col="blue")
abline(h=mean(mydata4$Object_Target_T2,na.rm=T)-sd(mydata4$Object_Target_T2,na.rm=T),lty=2,col="blue")
abline(h=median(mydata4$Object_Target_T2,na.rm=T),lty=3,col="green")
identify(mydata4$Object_Target_T2)

#• Detect outliers with graphics
plot(mydatadf2,xlab='')
abline(h=mean(mydatadf2,na.rm=T),lty=1,col="red")
identify(mydatadf2)
