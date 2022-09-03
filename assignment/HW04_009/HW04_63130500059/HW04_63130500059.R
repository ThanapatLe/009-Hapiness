library(dplyr)
library(readr)
library(ggplot2)
library(lubridate)

# 1. Explore the dataset
superstore_sales <- read.csv('https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv')
glimpse(superstore_sales)
View(superstore_sales)

# 2. Learning function from lubridate
month <- month(dmy(superstore_sales$Order.Date))
year <- year(dmy(superstore_sales$Order.Date))

# 3. Transform data with dplyr and finding insight the data
# 1.) Which US city had the most orders in 2018, and how much more than the least?
countState <- superstore_sales %>% count(State)
countState <- data.frame(countState)
countState %>% filter(n == max(n) | n == min(n))
countState %>% summarise(max(n) - min(n))

# 2.) In each category, what are the best-selling subcategory?
countCategory <- superstore_sales %>% select(Category, Sub.Category) %>% group_by(Category) %>% count(Sub.Category)
countCategory %>% filter(n == max(n))

# 3.) What does each segment of customer buy the most?
segmentBuy <- superstore_sales %>% select(Segment, Sub.Category) %>% group_by(Segment) %>% count(Sub.Category)
segmentBuy %>% filter(n == max(n))

# 4.) Which month in 2017 has the most orders and how much total sales?
month <- month(dmy(superstore_sales$Order.Date))
year <- year(dmy(superstore_sales$Order.Date))

order2017 <- superstore_sales %>% summarise(year, month, Sales) %>% filter(year == 2017)
monthOrder <- data.frame(order2017 %>% count(month))
monthOrder %>% filter(n == max(n))
order2017 %>% filter(month == 11) %>% summarise(sum(Sales))

# 5.) Which Ship.Mode does the consumer choose the most?
consumerShip <- superstore_sales %>% filter(Segment == 'Consumer')
consumerShip %>% group_by(Ship.Mode) %>% count(Ship.Mode) %>% arrange(desc(n))

# 6.) What is the total sales each year? What is the average per year?
year <- year(dmy(superstore_sales$Order.Date))

sumSales <- superstore_sales %>% summarise(year, Sales)
sumSales <- sumSales %>% group_by(year) %>% summarise(sum(Sales))
sumSales
summary(sumSales$`sum(Sales)`)

# 7.) Which product has the most repeat orders?
bestSeller <- superstore_sales %>% count(Product.ID)
bestSeller %>% filter(n == max(n))

# 4. Visualization with GGplot2
# 1.) The number of orders in each region?
region <- data.frame(superstore_sales %>% count(Region))
ggplot(region, aes(x = "", y = n, fill = Region)) +
  geom_col(color = "black") +
  geom_text(aes(label = n),
            position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y") +
  scale_fill_brewer() +
  theme_bw()

# 2.) In which subcategory has the most orders?
ggplot(superstore_sales, aes(x=Sub.Category)) + geom_bar()
