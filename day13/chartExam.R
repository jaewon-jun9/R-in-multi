(클릭 <- read.table("product_click.log"))
names(클릭) <- c("날짜시간","상품ID")
(클릭)

#문제1
png(filename="clicklog1.png", height=400, width=700, bg="white")
plot(클릭$상품ID, main="세로바 그래프 실습", xlab = "상품ID",
       ylab="클릭수",ylim=c(0,100),col=terrain.colors(10))
dev.off()

#문제2
클릭$시간 = strptime(클릭$날짜시간,format='%Y%m%d%H%M')
클릭$그룹 = format(클릭$시간,'%H')
t <- as.numeric(unlist(labels(table(클릭$그룹))))
png(filename="clicklog2.png", height=400, width=700, bg="white")
pie(table(클릭$그룹),
    labels=paste(t,t+1,sep = "~"),col=rainbow(18),main="파이 그래프 실습")
dev.off()

#문제2 다른 ver
library(stringr)
st <- str_sub(클릭$날짜시간,start=9,end=10)
nst <- as.numeric(sort(unique(st)))
pie(table(st),
    labels=paste(nst,nst+1,sep="~"),
    col=rainbow(18),
    main = "파이 그래프 실습")
