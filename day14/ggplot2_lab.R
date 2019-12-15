library(ggplot2)
library(dplyr)
#문제1
ggplot(data = mpg,aes(x=cty, y=hwy))+geom_point(colour="Blue")
ggsave("result1.png")
#문제2
ggplot(data= mpg, aes(x=class))+geom_bar(aes(fill=drv))
ggsave("result2.png")
#문제3
options(scipen = 99)
ggplot(data = midwest,aes(x=poptotal, y=popasian)) + geom_point() + xlim(0,500000) + ylim(0,10000)
ggsave("result3.png")
#문제4
mpg_1 <- mpg %>% filter(class=="compact"|class=="subcompact"|class=="suv")
ggplot(data=mpg_1,aes(x=class,y=cty)) + geom_boxplot()
ggsave("result4.png")
#문제5
click <- read.table("product_click.log")
ggplot(data= click, aes(x=V2))+geom_bar(aes(fill=V2))
ggsave("result5.png")
#문제6
datetime <- strptime(click$V1,format='%Y%m%d%H%M')
day <- format(datetime,'%A')
ggplot(data=click,aes(x=day))+geom_bar(aes(fill=day))+labs(x="요일",y="클릭수")+ylim(0,200)+ theme_linedraw()
ggsave("result6.png")
