#Part1
library(dplyr)
library(DescTools)
library(stringr)
library(ggplot2)
library(assertive)

Superstore <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
View(Superstore)
glimpse(Superstore)

#Part2
Superstore %>% summarise(Sales = max(Sales, na.rm = TRUE))

#Part3
#(1)
Superstore %>% filter(Ship.Mode=="First Class") %>% count()

#(2)
Mode(Superstore$Customer.Name)

#(3)
Superstore %>% select(Product.Name, Sales) %>% filter(Sales==max(Sales))

#(4)
Superstore %>% distinct(Ship.Mode)
Mode(Superstore$Ship.Mode)

#(5)
X <- Superstore %>% select(Product.Name, Sales) %>% filter(Sales>mean(Sales))
as_tibble(X)

#(6)
Superstore %>% group_by(Category) %>% select(Category,Sales) %>% summarise(total = sum(Sales))

#Part4
#(1)
sub_category_plot <- ggplot(Superstore, aes(x = Sales, y = Sub.Category))+
  geom_bar(stat="identity")+
  scale_x_continuous(breaks=c(50000 ,250000 ,450000 ,650000 ,850000))

sub_category_plot + ggtitle("Total of sales and sub category") +
  xlab("Total Sales") + ylab("sub category")

#(2)
ShipMode_plot <- ggplot(Superstore, aes(x = Ship.Mode, y = Sales))+
  geom_bar(stat="identity")+
  scale_y_continuous(breaks=c(50000 ,250000 ,450000 ,650000 ,850000, 1050000, 1250000))

ShipMode_plot + ggtitle("Total of sales and Ship mode") +
  xlab("Ship Modes") + ylab("Total Sales")
