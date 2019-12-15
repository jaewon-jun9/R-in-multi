library(dplyr)
library(ggplot2)

#-----------------------------------------------------------------------------

#문제 7-1
mpg_1 <- mpg %>% mutate(total = cty+hwy)
#문제 7-2
mpg_1 <- mpg_1 %>% mutate(mean_total = total/2)
#문제 7-3
mpg_1 %>% arrange(desc(mean_total)) %>% head(3)
#문제 7-4
mpg %>% mutate(total=cty+hwy) %>% 
  mutate(mean_total = total/2) %>% 
    arrange(desc(mean_total)) %>% 
      head(3)

#-----------------------------------------------------------------------------

#문제 8-1
mpg %>%  
  group_by(class) %>% 
    summarise(mean_cty = mean(cty))
#문제 8-2
mpg %>%
  group_by(class) %>% 
    summarise(mean_cty = mean(cty)) %>% 
      arrange(desc(mean_cty))
#문제 8-3
mpg %>% group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% arrange(desc(mean_hwy)) %>% 
    head(3)
#문제 8-4
mpg %>% filter(class=="compact") %>% group_by(manufacturer) %>% 
  summarise(compact_n=n()) %>% arrange(desc(compact_n))

#-----------------------------------------------------------------------------

#문제 9
fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl = c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
fuel
#문제 9-1
mpg <- left_join(mpg , fuel , by = "fl")
#문제 9-2
mpg %>% select(model,fl,price_fl) %>% head(5)

#-----------------------------------------------------------------------------

#문제 10-1
midwest <- midwest %>% mutate(perunadults = ((poptotal-popadults)/poptotal)*100)
#문제 10-2
midwest %>% select(county,perunadults) %>%
  arrange(desc(perunadults)) %>% head(5)
#문제 10-3
midwest %>% mutate(perunadults_grade = ifelse(perunadults<30,"small", ifelse(perunadults<40,"middle","large"))) %>%
  group_by(perunadults_grade) %>% summarise(perunadults_grade_n =n())
#문제 10-4
midwest %>% mutate(perpopasian = (popasian/poptotal)*100) %>% 
  arrange(perpopasian) %>% head(10) %>% select(state,county,perpopasian)

#-----------------------------------------------------------------------------

#문제 11
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"] <- NA
#문제 11-1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
#문제 11-2
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>%
  summarise(mean_hwy = mean(hwy)) %>% arrange(desc(mean_hwy))

#-----------------------------------------------------------------------------

#문제 12
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"] <- "k"
mpg[c(29,43,129,203),"cty"] <- c(3,4,39,42)
#문제 12-1
table(mpg$drv)
mpg <- mpg %>% filter(!drv%in%"k")
table(mpg$drv)
#문제 12-2
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9|mpg$cty>26,NA,mpg$cty)
mpg <- mpg %>% filter(!is.na(mpg$cty))
boxplot(mpg$cty)
#문제 12-3
mpg %>% group_by(drv) %>%
  summarise(mean_cty= mean(cty)) %>% arrange(mean_cty)




