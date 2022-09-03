install.packages(ggplot2)
library(dplyr)
library(ggplot2)
library(assertive)

# 1. Explore the dataset
superstore<- read.csv('https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv')
glimpse(superstore)
View(superstore)

# 2. Learning function from Tidyverse
superstore_filter <- superstore %>% 
  filter(Order.ID == "CA-2017-138688")
glimpse(superstore_filter)

# 3. Transform data with dplyr and finding insight the data
# 1.) สินค้าใดที่ได้รับความนิยมสูงสุดและมีจำนวนเท่าไหร่
superstore_max <- superstore %>% 
  filter(Product.Name == max(Product.Name)) %>% 
  select(Product.Name)
glimpse(superstore_max)

# 2.) สินค้าใดที่ได้รับความนิยมน้อยสุดและมีจำนวนเท่าไหร่
superstore_min <- superstore %>% 
  filter(Product.Name == min(Product.Name)) %>% 
  select(Product.Name)
glimpse(superstore_min)

# 3.) ยอดขายรวมของแต่ละ city ที่มียอดขายรวมมากกว่า 10000 โดยเรียงยอดขายรวมจากมากไปน้อย
sumcities <- superstore %>% 
  group_by(City) %>% 
  summarise(totalsale = sum(Sales)) %>%
  filter(totalsale >= 100000) %>%
  arrange(desc(totalsale))
sumcities

# 4.) พนักงานที่อยู่ในสาขาเมือง San Francisco มีการขายสินค้าอะไรบ้าง
SanFran_Customer <- superstore %>% 
  select(Customer.Name, City, Product.Name) %>% 
  filter(City == "San Francisco");
as_tibble(SanFran_Customer);

# 5.) ลูกค้าคนใดที่ซื้อสินค้าราคาถูกที่สุด
cheapestPrice <- superstore %>% 
  select(Customer.Name,Product.Name,Sales) %>% 
  filter(superstore$Sales == min(superstore$Sales));
as_tibble(cheapestPrice)

# 6.) ให้แสดงสินค้าที่มีชื่อขึ้นต้นด้วยคำว่า Panasonic   
findPanasonic <- str_subset(superstore$Product.Name, "Panasonic");
as_tibble(findPanasonic);


# 4. Visualization with GGplot2
# 1.) กราฟที่แสดงความสัมพันธ์ระหว่าง sales กับ category
category_plot <- ggplot(superstore, aes(x = Category, y = Sales))+
  geom_bar(stat="identity")+
  scale_y_continuous(breaks=c(50000 ,250000 ,450000 ,650000 ,850000))

category_plot + ggtitle("Total of sales and category") +
  xlab("Total Sales") + ylab("Category")

# 2.) กราฟที่แสดงความสัมพันธ์ระหว่าง sales กับ region
region_plot <- ggplot(superstore, aes(x = Sales, y = Region))+
  geom_bar(stat="identity")+
  scale_x_continuous(breaks=c(50000 ,250000 ,450000 ,650000 ,850000))

region_plot + ggtitle("Total of sales and category") +
  xlab("Region") + ylab("Total Sales")