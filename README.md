# 009-Happiness

Original Datasets from: [Happiness.csv](https://www.kaggle.com/unsdsn/world-happiness?select=2019.csv)

### About's Products Datasets

## Overview
  เป็นการวิเคราะห์ข้อมูลเชิงสถิติของแบบสำรวจสถานะค่าความสุขของแต่ละประเทศทั่วโลกในปี 2019 โดยนำแบบสำรวจที่ได้จาก Kaggle มา cleaning และวิเคราะห์โดยใช้โปรแกรมภาษา R นอกจากนี้ยังมีการนำข้อมูลที่ได้มาวิเคราะห์และหาความสัมพันธ์พร้อมกับตั้งสมมติฐานของข้อมูล

### Steps

1. Define a question
2. Loading dataset from [Happiness_original.csv](https://www.kaggle.com/unsdsn/world-happiness?select=2019.csv) and assign variable named `happiness`
3. Observe the data
   - How many observation?
   - List variable name
4. Data Cleaning
   - checking the types of values
   - checking duplicate data
   - checking NA value
5. Exploratory Data Analysis

### Define a question
1. อยากทราบว่าประเทศไหนได้คะแนนสูงสุดในแต่ละด้านของข้อมูล และได้เท่าไหร่?
2. อยากทราบว่ามีกี่ประเทศที่มีคะแนนรวมสูงกว่าค่าเฉลี่ย ประเทศอะไรบ้าง?
3. อยากทราบว่าประเทศที่มีความสุขมากที่สุดและประเทศที่มีความสุขน้อยที่สุด มีปัจจัยที่แตกต่างกันอย่างไร?
4. อยากทราบว่าคะแนน Perceptions of corruption มีผลต่อความสุขของคนในประเทศขนาดไหน?
5. อยากทราบว่ารายได้มีผลต่อความสุขจริงหรือไม่?

### Library
```{R}
library(dplyr)
library(readr)
```

### Explore
```{R}
happiness <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/009-Happiness/main/Happiness-2019.csv")
View(happiness)
```

### Observe
```{R}
happiness <- as_tibble(happiness)
glimpse(happiness)
View(happiness)
```

### Data Cleaning
```{R}
glimpse(happiness)

happiness %>% filter(duplicated(happiness)) 
happiness %>% count(duplicated(happiness))

happiness <- happiness %>% rename(Rank = `Overall rank`)
happiness <- happiness %>% rename(Country = `Country or region`)
happiness <- happiness %>% rename(GDP = `GDP per capita`)
happiness <- happiness %>% rename(SocialSupport = `Social support`)
happiness <- happiness %>% rename(Healthy = `Healthy life expectancy`)
happiness <- happiness %>% rename(Freedom = `Freedom to make life choices`)
happiness <- happiness %>% rename(TrustGov = `Perceptions of corruption`)

happiness %>% count(is.na(Rank))
happiness %>% count(is.na(Country))
happiness %>% count(is.na(Score))
happiness %>% count(is.na(GDP))
happiness %>% count(is.na(SocialSupport))
happiness %>% count(is.na(Healthy))
happiness %>% count(is.na(Freedom))
happiness %>% count(is.na(Generosity))
happiness %>% count(is.na(TrustGov))

write_csv(happiness,file = "./happiness_clean.csv")
```

### Exploratory Data Analysis
1. อยากทราบว่าประเทศไหนได้คะแนนสูงสุดในแต่ละด้านของข้อมูล และได้เท่าไหร่?
- ประเทศที่มีค่า GDP สูงที่สุด คือ ประเทศ Qatar โดยมีคะแนน 1.684
- ประเทศที่มีค่า Social support สูงที่สุด คือ ประเทศ Iceland โดยมีคะแนน 1.624
- ประเทศที่มีค่า Healthy สูงที่สุด คือ ประเทศ Singapore โดยมีคะแนน 1.141
- ประเทศที่มีค่า Freedom สูงที่สุด คือ ประเทศ Uzbekistan โดยมีคะแนน 0.631
- ประเทศที่มีค่า Generosity สูงที่สุด คือ ประเทศ Myanmar โดยมีคะแนน 0.566
- ประเทศที่มีค่า Trust government สูงที่สุด คือ ประเทศ Singapore โดยมีคะแนน 0.453
```{R}
happiness %>% dplyr::select(Country, GDP) %>% filter(GDP == max(GDP))
happiness %>% dplyr::select(Country, SocialSupport) %>% filter(SocialSupport == max(SocialSupport))
happiness %>% dplyr::select(Country, Healthy) %>% filter(Healthy == max(Healthy))
happiness %>% dplyr::select(Country, Freedom) %>% filter(Freedom == max(Freedom))
happiness %>% dplyr::select(Country, Generosity) %>% filter(Generosity == max(Generosity))
happiness %>% dplyr::select(Country, TrustGov) %>% filter(TrustGov == max(TrustGov))
```

2. อยากทราบว่ามีกี่ประเทศที่มีคะแนนรวมสูงกว่าค่าเฉลี่ย ประเทศอะไรบ้าง?
- ประเทศที่มีคะแนนรวมสูงกว่าค่าเฉลี่ย มีทั้งหมด 77 ประเทศ ได้แก่ Finland, Denmark, Norway, Iceland, Netherlands, Switzerland, Sweden, New Zealand, Canada, Austria, Australia, Costa Rica, Israel, Luxembourg, United Kingdom, Ireland, Germany, Belgium, United States, Czech Republic, United Arab Emirates, Malta, Mexico, France, Taiwan, Chile, Guatemala, Saudi Arabia, Qatar, Spain, Panama, Brazil, Uruguay, Singapore, El Salvador, Italy, Bahrain, Slovakia, Trinidad & Tobago, Poland, Uzbekistan, Lithuania, Colombia, Slovenia, Nicaragua, Kosovo, Argentina, Romania, Cyprus, Ecuador, Kuwait, Thailand, Latvia, South Korea, Estonia, Jamaica, Mauritius, Japan, Honduras, Kazakhstan, Bolivia, Hungary, Paraguay, Northern Cyprus, Peru, Portugal, Pakistan, Russia, Philippines, Serbia, Moldova, Libya, Montenegro, Tajikistan, Croatia, Hong Kong, Dominican Republic

```{R}
num <- happiness %>% count(Score > mean(Score))
View(num)

list <- happiness %>% filter(Score > mean(Score))
View(list)
```

3. อยากทราบว่าประเทศที่มีความสุขมากที่สุดและประเทศที่มีความสุขน้อยที่สุด มีปัจจัยที่แตกต่างกันอย่างไร?
- ประเทศที่มีความสุขมากที่สุด คือ ประเทศ Finland และประเทศที่มีความสุขน้อยที่สุด คือ ประเทศ South Sudan โดยประเทศ Finland มีค่า GDP, Social support, Healthy, Freedom และ Trust government มากกว่าประเทศ South Sudan ในขณะที่ประเทศ South Sudan มีค่า Generosity ที่มากกว่าประเทศ Finland เพียงอย่างเดียว
```{R}
minVSmax <- happiness %>% filter(Score == max(happiness$Score) | Score == min(happiness$Score))
View(minVSmax)
```

4. อยากทราบว่าคะแนน Perceptions of corruption มีผลต่อความสุขของคนในประเทศขนาดไหน?
- ประเทศที่รัฐบาลมีความน่าเชื่อถือมาก จะทำให้คนในประเทศมีความสุขมาก เนื่องจากมีความโปร่งใสและได้รับการไว้วางใจ สังเกตได้จากตารางแสดงผลที่แสดงให้เห็นว่าคะแนนของ Trust government จะมีค่ามากในประเทศที่มีความสุขมากเป็นอันดับต้น ๆ ในอีกทางหนึ่ง หากคะแนนของ Trust government มีค่าน้อย จะทำให้คนในประเทศนั้น ๆ มีความสุขน้อยตามลงไปด้วย
```{R}
PoC <- happiness %>% dplyr::select(TrustGov, Score, Rank) %>% arrange(desc(`TrustGov`))
View(PoC)
```

5. อยากทราบว่ารายได้มีผลต่อความสุขจริงหรือไม่?
- รายได้ หรือ GDP มีผลต่อความสุขของคนในประเทศ โดยถ้ามีรายได้มาก คนในประเทศนั้น ๆ จะมีความสุขมาก แต่ถ้ามีรายได้น้อย คนในประเทศก็จะมีความสุขน้อยตามลงไปด้วย 
```{R}
gdp <- happiness %>% dplyr::select(GDP, Score, Rank) %>% arrange(desc(GDP))
View(gdp)
```


### Tools

- R Language
- R Studio Desktop

## Table of Contents

1. [Exploratory Data Analysis](./01_explore.md)
2. [Data Visualization]()

## Resources

### Important Files in Repository

- [Happiness_Analysis](./Happiness_Analysis.R) : Exploratory Data Analysis
- [Happiness_original.csv](https://www.kaggle.com/unsdsn/world-happiness?select=2019.csv): Original Dataset
- [Happiness_clean.csv](./happiness_clean.csv): Original Dataset

### References

https://github.com/safesit23/INT214-Statistics/blob/main/workshop/Summary.md

## About Us

งานนี้เป็นส่วนของวิชา INT214 Statistics for Information technology <br/> ภาคเรียนที่ 1 ปีการศึกษา 2564 คณะเทคโนโลยีสารสนเทศ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี

### Team: อยากกรีดร้องงงง!!!!

1. StudentID: 63130500023 ชิษณุชา สมบูรณ์วรรณะ
2. StudentID: 63130500049 ธนพัฒน์ ไตรรัตน์พนาสันต์
3. StudentID: 63130500058 ธาราดล เผือกเอี่ยม
4. StudentID: 63130500059 ธิติ อึ๊งเจริญ
5. StudentID: 63130500077 ปภาดา เขียวฉอ้อน

### Instructor

- ATCHARA TRAN-U-RAIKUL
- JATAWAT XIE (Git: [safesit23](https://github.com/safesit23))
