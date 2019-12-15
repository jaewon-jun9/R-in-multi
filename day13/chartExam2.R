library(ggplot2)
ymax <- max(mpg$cty)
#문제1
plot(mpg$cty,mpg$hwy,ylab = "고속도로연비", xlab="도시연비",pch=3)

#문제2
barplot(table(mpg$drv),col = c("red","green","blue"))

#문제3
boxplot(hwy~manufacturer,data = mpg,las=2,col=heat.colors(15),
        ylab = "고속도로연비", xlab = "", ylim=c(5,40),
        main = '*제조사별 고속도로 연비*', col.main = "magenta")

