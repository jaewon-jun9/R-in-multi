#문제1
#(1)
a <- array(1:24, dim = c(2,3,4))
a
#(2)
a[2,,]
#(3)
a[,1,]
#(4)
a[,,3]
#(5)
a+100
#(6)
a[,,4]*100
#(7)
a[1,-1,] #a[1,2:3,]
#(8)
a[2,,2] <-a[2,,2]+100
#(9)
a[,,1] <- a[,,1] -2
#(10)
a <- a*10
#(11)
rm(a)

#문제2
df1 <- data.frame("x"=c(1:5),"y"=c(seq(2,10,2)))
df1

#문제3
df2 <- data.frame("col1"=c(1:5),"col2"=c(letters[1:5]),"col3"=c(6:10))
df2

#문제4
제품명 <-  c("사과","딸기","수박")
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
df3 <- data.frame(제품명, 가격, 판매량,stringsAsFactors=FALSE)
str(df3)

#문제5
df3_p_mean <- mean(df3$가격)
df3_p_mean
df3_s_mean <- mean(df3$판매량)
df3_s_mean

#문제5
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)

df4 <- data.frame(name,gender,math,stringsAsFactors = F)
str(df4)

#(a)
df4$stat <- c(76,73,95,82,35)
df4
#(b)
df4$score <- df4$math + df4$stat
df4
#(c)
df4$grade <- ifelse(score>=150,"A",ifelse(score>=100,"B",ifelse(score>=70,"C","D")))
df4

#문제7
str(emp)
#문제8
emp[3:5,]
#문제9
emp$ename
#문제10
emp[c("ename","sal")]
#문제11
emp[emp$job=="SALESMAN",c("ename","sal","deptno")]
#문제12
emp[emp$sal>=1000 & emp$sal<=3000 ,c("ename","sal","deptno")]
#문제13
emp[!emp$job=="ANALYST",c("ename","job","sal")]
#emp[emp$job!="ANALYST",c("ename","job","sal")]
#문제14
emp[emp$job=="SALESMAN"|emp$job=="ANALYST",c("ename","job")]
#문제15
emp[is.na(emp$comm),c("ename","sal")]
#문제16
emp[order(emp$sal,decreasing = T),]

