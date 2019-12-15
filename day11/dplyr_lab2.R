install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

#문제1
str(mpg)
mpg <- as.data.frame(mpg)

#문제1-1
dim(mpg)
paste0("행 : ",nrow(mpg),"개 , ","열 : ",ncol(mpg),"개")
#문제1-2
mpg %>% head(10)
#문제1-3
mpg %>% tail(10)
#문제1-4
mpg
#문제1-5
apply(mpg,2,summary)
#문제1-6
str(mpg)

#문제2-1
mpg <- mpg %>% rename(city=cty , highway=hwy)

#문제2-2
head(mpg)

#문제3-1
midwest <- as.data.frame(midwest)
class(midwest)

#문제3-2
midwest_1 <- midwest %>% rename(total=poptotal,asian=popasian)

#문제3-3
midwest_1 <- midwest_1 %>% mutate(perasian = (asian/total)*100)

#문제3-4
midwest_1 <- midwest_1 %>%
  mutate(perasianmean = ifelse(perasian > mean(perasian), "large", "small"))


#문제4-1
mpg %>%
  filter(displ <=4 | displ>=5) %>% 
    mutate(displ_g = ifelse(displ<=4,"displ_4","displ_5")) %>%
      group_by(displ_g) %>% 
        summarise(mean(highway))

#문제4-2

mpg %>% filter(manufacturer=="audi"|manufacturer=="toyota") %>%
  group_by(manufacturer) %>% summarise(mean(city))

#문제4-3
mpg %>% filter(manufacturer=="chevrolet"|manufacturer=="ford" |
               manufacturer=="honda") %>%
    summarise(mean(highway))

#문제5-1
a <- mpg %>% select(class,city)

#문제5-2
a %>% filter(class=="suv"|class=="compact") %>%
  group_by(class) %>% summarise(mean(city))

#문제6-1
mpg %>% filter(manufacturer=="audi") %>% arrange(desc(highway)) %>% 
  head(5)






