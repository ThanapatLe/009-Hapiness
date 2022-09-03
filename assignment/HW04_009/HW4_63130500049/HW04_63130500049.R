# 1.Explore the dataset

# dataset Computer Science
ComSci <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")


# Call library
library("dplyr")
library("ggplot2")
library('assertive')
library("readr")
library("stringr")
library("tibble")
library("tidyverse")

### 1.1 see Dataset
View(ComSci)
glimpse(ComSci)
### 1.2 check datatype
ComSci$Number_Of_Pages %>% is.numeric()
ComSci$Book_title %>% is.character()
ComSci$Rating %>% is.numeric()
### 1.6 check number of row and column in dataset
ComSci %>% glimpse()


# 2.Learning function from Tidyverse
tibble(x =0:20 , y = -(x^2) , z =x+y)

# 3.Tranform data
### 3.1 find the max Reviews of this Dateset
ComSci$Reviews %>% str_remove(",") %>% as.numeric() %>% max(.,na.rm = T)
### 3.2 find average of Rating of this Dataset
ComSci$Rating %>% mean(.,na.rm=T)
### 3.3 check type of the book that has more than 900 pages in this Dataset
ComSci %>% filter(Number_Of_Pages > 900) %>% select(Type,Number_Of_Pages)
### 3.4 find quantile2 of Rating this dataset
ComSci$Rating %>% quantile(0.5,na.rm = T)
### 3.5 Show title , rating and price of this dataset that have rating more than 4.75
ComSci %>% filter(Rating > 4.75) %>% select(Book_title,Rating ,Price) %>% arrange(Rating)
### 3.6 Show the price that more than 200 and ordering by desc
ComSci %>% filter(Price > 200) %>% select(Price) %>% arrange(desc(Price))

# 4.use GGplot2 to plot the graph
## 4.1 plot graph show relation between Price and Number of Pages
ComSci %>% ggplot(aes(x=Number_Of_Pages,y=Price))+geom_point(aes(color=ComSci$Price))
## 4.2 plot graph histogram show Price
ComSci %>% ggplot(aes(x=Price))+geom_histogram(binwidth = 15)+ggtitle("Price")+xlab("Price")+ylab("Count")

#write.csv(ComSci,"HW04_Com_Science.csv")