🐶🐵🐺🐱🦁🐯🦒🦊🦝🐮🐷🐗🐭🐹🐰🐻🐻‍❄️🐨🐼🐸🦓🐴🦄🐔🐲🐽🐾🐒🦍🦧🦮🐕‍🦺🐩🐕🐈🐈‍⬛🐅🐆🐎🦌🦬🦏🦛🐂🐃🐄

# 😁 Assignment 4 : Data Visualization 😁

### 👻 Superstore Sales Dataset : [file CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv) 👻

## 😎 data in dataset 😎

* show dataset ใช้คำสั่ง `glimps`
```
glimpse()
```
```
$ Row.ID        <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44,~
$ Order.ID      <chr> "CA-2017-152156", "CA-2017-152156", "CA-2017-138688", "US-2016-108966", "US-2016-108966", "CA-2015-115812", "CA-2015-115812", "CA-2015-115812", "CA-2015-115812", "CA-~
$ Order.Date    <chr> "08/11/2017", "08/11/2017", "12/06/2017", "11/10/2016", "11/10/2016", "09/06/2015", "09/06/2015", "09/06/2015", "09/06/2015", "09/06/2015", "09/06/2015", "09/06/2015"~
$ Ship.Date     <chr> "11/11/2017", "11/11/2017", "16/06/2017", "18/10/2016", "18/10/2016", "14/06/2015", "14/06/2015", "14/06/2015", "14/06/2015", "14/06/2015", "14/06/2015", "14/06/2015"~
$ Ship.Mode     <chr> "Second Class", "Second Class", "Second Class", "Standard Class", "Standard Class", "Standard Class", "Standard Class", "Standard Class", "Standard Class", "Standard ~
$ Customer.ID   <chr> "CG-12520", "CG-12520", "DV-13045", "SO-20335", "SO-20335", "BH-11710", "BH-11710", "BH-11710", "BH-11710", "BH-11710", "BH-11710", "BH-11710", "AA-10480", "IM-15070"~
$ Customer.Name <chr> "Claire Gute", "Claire Gute", "Darrin Van Huff", "Sean O'Donnell", "Sean O'Donnell", "Brosina Hoffman", "Brosina Hoffman", "Brosina Hoffman", "Brosina Hoffman", "Bros~
$ Segment       <chr> "Consumer", "Consumer", "Corporate", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer~
$ Country       <chr> "United States", "United States", "United States", "United States", "United States", "United States", "United States", "United States", "United States", "United State~
$ City          <chr> "Henderson", "Henderson", "Los Angeles", "Fort Lauderdale", "Fort Lauderdale", "Los Angeles", "Los Angeles", "Los Angeles", "Los Angeles", "Los Angeles", "Los Angeles~
$ State         <chr> "Kentucky", "Kentucky", "California", "Florida", "Florida", "California", "California", "California", "California", "California", "California", "California", "North C~
$ Postal.Code   <int> 42420, 42420, 90036, 33311, 33311, 90032, 90032, 90032, 90032, 90032, 90032, 90032, 28027, 98103, 76106, 76106, 53711, 84084, 94109, 94109, 94109, 68025, 68025, 19140~
$ Region        <chr> "South", "South", "West", "South", "South", "West", "West", "West", "West", "West", "West", "West", "South", "West", "Central", "Central", "Central", "West", "West", ~
$ Product.ID    <chr> "FUR-BO-10001798", "FUR-CH-10000454", "OFF-LA-10000240", "FUR-TA-10000577", "OFF-ST-10000760", "FUR-FU-10001487", "OFF-AR-10002833", "TEC-PH-10002275", "OFF-BI-100039~
$ Category      <chr> "Furniture", "Furniture", "Office Supplies", "Furniture", "Office Supplies", "Furniture", "Office Supplies", "Technology", "Office Supplies", "Office Supplies", "Furn~
$ Sub.Category  <chr> "Bookcases", "Chairs", "Labels", "Tables", "Storage", "Furnishings", "Art", "Phones", "Binders", "Appliances", "Tables", "Phones", "Paper", "Binders", "Appliances", "~
$ Product.Name  <chr> "Bush Somerset Collection Bookcase", "Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Back", "Self-Adhesive Address Labels for Typewriters by Universal", "Bret~
$ Sales         <dbl> 261.9600, 731.9400, 14.6200, 957.5775, 22.3680, 48.8600, 7.2800, 907.1520, 18.5040, 114.9000, 1706.1840, 911.4240, 15.5520, 407.9760, 68.8100, 2.5440, 665.8800, 55.50~
```


## 🐻‍❄️ Library 🐻‍❄️ 
```
library(dplyr) 
```
* เป็น library ในการใช้ตัวช่วย %>% สามารถใช้ได้หลายคำสั่งต่อ ๆ กันได้ไม่ต้องเขียนบรรทัดใหม่
```
library(ggplot2)
```
* เป็น library ในการสร้างกราฟ 
```
library(assertive)
```
* เป็น library ในการตรวจสอบประเภท
```
library(tidyverse)
```
* เป็น library ในการเรียกใช้ ggplot
# 🐜 PartA 🐜

## 🐅 Defind  insight the data at least 6. 🐅
1. อยากรู้ว่ามีการจัดส่งพัสดุมากที่สุดระหว่าง Home office กับ  Corporate
```
exam1 <- superstore %>% filter(Segment == 'Home Office' | Segment == 'Corporate' ) %>% count(Segment)
```
* สรุปได้ว่า Corporate มากกว่า Home office 
2. อยากรู้ว่าสินค้าไหนได้รับความนิยมสูงสุด
```
exam2 <- superstore %>% filter(Product.Name == max(Product.Name)) 
```
* สรุปได้ว่าสินค้าที่ได้รับความนิยมคือ Zipper Ring Binder Pockets
3. อยากรู้ว่าจากข้อมูลลูกค้าเลือกการส่งในรุปแบบคลาสไหนมากที่สุด และ มีผลต่อราคาของสินค้าไหม
```
exam3 <-superstore %>% select(Ship.Mode , Sales) %>% arrange(desc(Sales))
```
* สรุปได้ว่าราคาของสินค้าไม่มีผลต่อการอัพเกรดคลาสในการส่ง
4. อยากรู้ว่าในปี 2018 และ 2015 ปีไหนมียอดส่งมากที่สุด
```
exam4 <- superstore %>% filter( 2018 == format(as.Date(Ship.Date , format = "%d/%m/%Y"),"%Y")) %>% count()
exam4.1 <- superstore %>% filter( 2015 == format(as.Date(Ship.Date , format = "%d/%m/%Y"),"%Y")) %>% count()
```
* สรุปว่า ปี 2018 มียอดส่งมากกว่า 2015
5. อยากรู้ว่าลูกค้าที่สั่งมากที่สุดคืออะไร
```
exam5 <- superstore %>%  filter(Customer.Name == max(Customer.Name)) 
```
* สรุปได้ว่าลูกค้าที่สั่งเยอะที่สุดคือ Zuschuss Donatelli
6. อยากรู้ว่าประเภทสินค้าไหนมากที่สุดและน้อยที่สุด
```
exam6 <- superstore %>% filter(Category == max(superstore$Category) | Category == min(superstore$Category)) %>% select(Category) %>% table()
```
* สรุปได้ว่าประเภทที่มากที่สุดคือ Furniture และน้อยที่สุดคือ Technology

## 🙉 PARTA Graphs 🙉

1. อยากรู้ grahp ประเภทไหน มีราคาสูงสุด

```
superstore %>% ggplot(aes(x=Category,y=Sales))+geom_point() + ggtitle("sales in each  category")
```
Result: <br>
<img src = "https://scontent.fbkk17-1.fna.fbcdn.net/v/t1.6435-9/246877385_110119461457573_5666829593946291777_n.jpg?_nc_cat=107&_nc_rgb565=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=I_Iu8mKlH-IAX9yGG-H&_nc_ht=scontent.fbkk17-1.fna&oh=35821189075916d1f7ebbcfc4438136f&oe=61986AE7" height = "400"  width = "950" > <br>

* ประเภท Technology มีราคาสูงที่สุด

2. อยากรูว่า grahp รัฐไหนมียอดส่งสูงสุด
```
superstore %>% select(State) %>% table() %>% 
barplot(main = "state grahp has the highest delivery volume" ,xlab = "name state" , ylab = "count")
```
Result: <br>
<img src = "https://scontent.fbkk17-1.fna.fbcdn.net/v/t1.6435-9/246278884_110150408121145_6667351284347290079_n.jpg?_nc_cat=110&_nc_rgb565=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=I2ZCB3pCu5QAX-GdbBe&tn=_5O1BZeDu-wQ_iVG&_nc_ht=scontent.fbkk17-1.fna&oh=355209e34db794fd35be3f590e68099e&oe=61972844">

*  จากกราฟทำให้รู้ว่า รัฐ California มียอดสูงสุด
## POWER BI MY DATA SET: [link Here](https://app.powerbi.com/links/2oSIyVyZOz?ctid=6f4432dc-20d2-441d-b1db-ac3380ba633d&pbi_source=linkShare)
😜😝🤤😒😓😔😕🙃🤑😲☹️🙁😖😞😟😤😢😭😦😨😧😩🤯😬😮‍💨😰😱🥵🥶😳🤪😵😵‍💫🥴😠😡🤬😷🤒🤕🤢🤮🤧😇🥳🥸
