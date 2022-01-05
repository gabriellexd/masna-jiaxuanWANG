Install.packages("rJava")

install.packages("readxl")

library(readxl)
library(ggplot2)
brooklyn <-read_excel("/Users/jiaxuan/_MASNA projects/Jan.5_Python&R/Q1/rollingsales_brooklyn.xlsx",skip = 4)
#记得是绝对路径 cmd+opt+c；skip= n 是跳过前n行                                          

library(tidyverse)
glimpse(brooklyn)


#(4. Pick the variables that you think can be relevant 
#for your analysis. Copy these variables into a separate dataset.)
#create data frame 记得用美元符号；单引号
df <- data.frame(brooklyn$`YEAR BUILT`,brooklyn$`SALE PRICE`)


#5. Check that all R data types actually match the data 
#(e.g. no numbers are stored as characters). 
#If there are, convert the data to the relevant types.
class(df$brooklyn..YEAR.BUILT.)
class(df$brooklyn..SALE.PRICE.)

#6.In this dataset, check if there are any missing data. 
#If there are, clean your data by removing the 
#observations where data are missing.
new_df <-na.omit(df)

saveRDS(new_df,file = "PriceAnalysis",ascii = FALSE,version = NULL, compress = TRUE, refhook = NULL)


p<- ggplot(df,aes(x=df$brooklyn..SALE.PRICE.))+
  geom_histogram(breaks=seq(0,))