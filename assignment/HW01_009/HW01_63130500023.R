
# Exercise 1

number1 <-c(10.4, 5.6, 3.1, 6.4, 21.7)
 summary(number1) # AVG , MIN , MAX
 sd(number1, na.rm = FALSE) # SD
  
 sd(number1, na.rm = FALSE) ^2 # variance 
 
 #Exercise 2
 
 marvel_movies <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
                     "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
                     "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
                     "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
                     "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
                     "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")
 
 years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
            2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)
 
 
 #1
 
length(marvel_movies) # number of movie

#--------------------#

#2
marvel_movies[19] # Number 19 of movie

#--------------------#

#3
table(years) 

sort(table(years), decreasing  = TRUE) #  most released movies is years 2017 and 2021

#--------------------#











