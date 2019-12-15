v1 <- c(4, 1, 8, 6, 10)
#v1변수에 저장된 데이터셋에서 최대값
v2 <- max(v1)
#v1변수에 저장된 데이터셋에서 최소값
v3 <- min(v1)
r1 <- 10
r1 <- 1:10
r1 <- c(10,20,30)
r1 <- NULL
r1 <- TRUE
r1 <- '가나다'
r1 <- 'nums'#= "nums"리터럴(데이터값)
r1 <- nums #변수
r1 <- nums() #nums라는 함수를 호출하고 그의 결과값을 r1에 넣어라

'nums' <- r1 #오류
nums <- r1 # 가능
nums() <- r1 #오류

c(10,20,TRUE)
c(10,20,"A")
?rep
rep(1,100)
rep(1:3, times=5)
rep(1:3, each=5)

LETTERS;letters;month.name;month.abb;pi
LETTERS[5]
month.abb[1]
LETTERS[-1]; LETTERS[c(-2,-4)]
letters[1]
length(LETTERS)

x <- c(10,2,7,4,15)
x
print(x)
class(x)
rev(x)
range(x)
sort(x)
sort(x, decreasing = TRUE)
sort(x, decreasing = T)
order(x)

x[3] <-20
x
x + 1
x <- x + 1
max(x);min(x);mean(x);sum(x)
summary(x)

x[c(2,4)]
x[c(F,T,F,T,F)]
x > 5

x - 1
x <- x-1
x
x[x > 5]
x[x > 5 & x < 15]

x[x > 5 || x < 15]
9%/%3
9%%3
9/3
9/2
9%/%2
9%%2

names(x)
names(x) <- LETTERS[1:5]
x[2];x["B"]

c(T,T,F,F) & c(T,F,T,F)
c(T,T,F,F) | c(T,F,T,F)
c(T,T,F,F) && c(T,F,T,F)
c(T,T,F,F) || c(T,F,T,F)

names(x) <- NULL
x
names(x)
c(T,T,F,F) | c(T,F,T)

ls()
rm(num2)
x
class(x)
rm(v2)
ls()

rainfall <- c(21.6, 23.6, 45.8, 77.0, 102.2, 133.3, 327.9, 348.0, 137.6, 49.3, 53.0, 24.9)
rainfall > 100
rainfall[rainfall > 100]
which(rainfall > 100)
month.name[which(rainfall > 100)]
month.abb[which(rainfall > 100)]
month.korname <- c("1월","2월","3월", "4월", "5월",
                   "6월","7월","8월","9월","10월",
                   "11월","12월")

month.korname[which(rainfall > 100)]

which.max(rainfall)
which.min(rainfall)
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]