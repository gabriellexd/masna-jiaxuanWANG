getwd()
library(ggplot2)
library(tidyverse)

######===============1.a histogram and density plot=======================######
#============a. A histogram and a density plot of some numeric (ratio or interval scale ) variables.
#####----histogram
vwdata0<-read.csv("VW ID. 3 Pro Max EV Consumption.csv",header=F)
vwdata<-read.csv("VW ID. 3 Pro Max EV Consumption.csv",header=F,skip = 1) #变成T就显示了
df1<-data.frame(vwdata$V7)
max(df1)
min(df1)
hist_p<-ggplot(df1,aes(x=vwdata$V7)) +
  geom_histogram(bins=5) +
  labs(x='Distance')
  #记得设置bin=?的间隔，不然无法pick scale
hist_p
####----density plot
den_p<-ggplot(df1,aes(x=vwdata$V7)) +
  geom_density()
den_p


#============================b. A bar and a pie chart for some factor variables 
#(if you do not have factor variables in your dataset
#, take some numeric variables and convert them to factors)
####----bar chart
HeatedSeat<-factor(vwdata$V14) #注意看variable是最上面带选项的那一行
df2<-data.frame(HeatedSeat)
class(HeatedSeat)

bar_chart <- ggplot(data=df2, aes(HeatedSeat, ..count..))+
  geom_bar(stat='count')
bar_chart
####----pie chart
pie_chart<-ggplot(data=df2,aes(HeatedSeat))+
  geom_bar(width=1)+
  coord_polar(theta='x')
pie_chart

#===========================c.Box (or violin) plots for some numeric variables
box_plot<-ggplot(df2,aes(HeatedSeat))+
  geom_boxplot()
box_plot

######===============2.Looking at the correlations in your data find some variables that might be related.=======================######
#a.Make a scatterplot showing their relationship
### We would like to see if Distance have something to do with Consumption
df.DistCon<-data.frame(vwdata$V7,vwdata$V10)
scatter_plot<-ggplot(df.DistCon,aes(x=vwdata$V7,y=vwdata$V10))+geom_point()
scatter_plot<-scatter_plot+labs(x='Distance',
                                y='Consumption') #加标题
scatter_plot

#b.Make a 2D density heatmap to show how the values of the 2 variables
#are distributed
heatmap<-scatter_plot+ geom_bin2d(bins=70)+theme_bw()
heatmap


saveRDS(vwdata,file = "Project3",ascii = FALSE,version = NULL, compress = TRUE, refhook = NULL)

