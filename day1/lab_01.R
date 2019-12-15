#문제1
v1 <- c(1:10)
v2 <- v1 * 2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]
v1; v2; v3; max_v;min_v;avg_v;sum_v

#문제2
seq(1,9,2)
rep(1,5)
rep(1:3,3)
rep(1:4,each = 2)

#문제3
v3 <- seq(1,10,3)
names(v3) <- LETTERS[1:4]

#문제4
count <- sample(1:100,7)
week.korname <- c("일요일", "월요일","화요일" ,"수요일","목요일","금요일","토요일")
# 생략가능 names(count) <- week.korname
week.korname[which.max(count)]
week.korname[which.min(count)]
week.korname[which(count > 50)]

paste(month.korname, count, sep = ":")
paste("I'm","Duli", "!!")
# = paste("I'm","Duli", "!!", sep=" ")
paste("I'm","Duli", "!!", sep="")
paste0("I'm","Duli", "!!")

fruit <- c("Apple","Banana", "Strawberry")
food <- c("Pie", "Juice", "Cake")
paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse = "-")
paste(fruit, food, sep=" ", collapse = " ")
