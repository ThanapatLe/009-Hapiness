library(dplyr)
library(readr)

# Explore
happiness <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/009-Happiness/main/Happiness-2019.csv")
View(happiness)

# Observe
happiness <- as_tibble(happiness)
glimpse(happiness)
View(happiness)

# Data Cleaning
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

# Exploratory Data Analysis
#1. อยากทราบว่าประเทศไหนได้คะแนนสูงสุดในแต่ละด้านของข้อมูล และได้เท่าไหร่?
happiness %>% dplyr::select(Country, GDP) %>% filter(GDP == max(GDP))
happiness %>% dplyr::select(Country, SocialSupport) %>% filter(SocialSupport == max(SocialSupport))
happiness %>% dplyr::select(Country, Healthy) %>% filter(Healthy == max(Healthy))
happiness %>% dplyr::select(Country, Freedom) %>% filter(Freedom == max(Freedom))
happiness %>% dplyr::select(Country, Generosity) %>% filter(Generosity == max(Generosity))
happiness %>% dplyr::select(Country, TrustGov) %>% filter(TrustGov == max(TrustGov))

#2. อยากทราบว่ามีกี่ประเทศที่มีคะแนนรวมสูงกว่าค่าเฉลี่ย ประเทศอะไรบ้าง?
num <- happiness %>% count(Score > mean(Score))
View(num)

list <- happiness %>% filter(Score > mean(Score))
View(list)

#3. อยากทราบว่าประเทศที่มีความสุขมากที่สุดและประเทศที่มีความสุขน้อยที่สุด มีปัจจัยที่แตกต่างกันอย่างไร?
minVSmax <- happiness %>% filter(Score == max(happiness$Score) | Score == min(happiness$Score))
View(minVSmax)

#4. อยากทราบว่าคะแนน Perceptions of corruption มีผลต่อความสุขของคนในประเทศขนาดไหน?
PoC <- happiness %>% dplyr::select(`Perceptions of corruption`, Score, `Overall rank`) %>% arrange(desc(`Perceptions of corruption`))
View(PoC)

#5. อยากทราบว่ารายได้มีผลต่อความสุขจริงหรือไม่?
gdp <- happiness %>% dplyr::select(`GDP per capita`, Score, `Overall rank`) %>% arrange(desc(`GDP per capita`))
View(gdp)
