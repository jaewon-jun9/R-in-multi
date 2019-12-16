y <- c(0,25,50,75,100)
z <- c(50,50,50,50,50)
y == z
y != z
y > z
y < z
y >= z
y <= z
y == 50 #알아서 복사 ex) 50 50 50 50 50
y > 50

num1 <- 11 #c(11)
num2 <- 3 #c(3)
num1/num2
num1%%num2
num1 %/% num2

#LIST 리스트
lds <- list(1,2,3) #각각 묶음
lds
lds +100 #오류
lds[1] #첫번째 보따리
lds[1]+10 #오류
lds[[1]]+10 #가능

names(lds) <- LETTERS[1:3]
lds
lds[[2]]
lds[["B"]]
lds$B


a <- list(
  a=1:3,
  b="a string",
  c=pi,
  d=list(-1,-5)
  )

a
a[1]
a[[1]]
a$a
a[1]+1 #오류 unlist(a[1])+1 (O)
a[[1]]+1
a[[1]][2] +100
new_a <-unlist(a[1])
a[1]; new_a
names(new_a) <- NULL
new_a
names(a) <- NULL
a

ls()
length(ls())
save(list=ls(),file="all.rda")
rm(list=ls())
ls()
load("all.rda")
ls()


#read file data
nums<- scan("data/sample_num.txt", what="")
word_ansi <- scan("data/sample_ansi.txt",what="")
word_utf8 <- scan("data/sample_utf8.txt",what="",encoding = "UTF-8")
word_utf8
word_utf8_new <- scan("data/sample_utf8.txt",what="")
word_utf8_new
lines_ansi <- readLines("data/sample_ansi.txt")
lines_utf8 <- readLines("data/sample_utf8.txt",encoding = "UTF-8")

#if else
randomNum <- sample(1:10,1)
if(randomNum>5){
  cat(randomNum,":5보다 크군요","\n")
}else{
  cat(randomNum,":5보다 작거나 같군요","\n")
}

if(randomNum%%2){
  cat(randomNum,";홀수","\n")
}else{
  cat(randomNum,";짝수","\n")
}

score <- c(50)
if (score >= 90) {
  cat(score, "는 A등급입니다","\n")
}else if (score >=80){
  cat(score, "는 B등급입니다","\n")
}else if (score >=70){
  cat(score, "는 C등급입니다","\n")
}else if (score >=60){
  cat(score, "는 D등급입니다","\n")
}else{
  cat(score, "는 F등급입니다","\n")
}

score <- sample(0:100,1)
if (score >= 90){
  cat(score, "는 A등급입니다","\n")
}else if (score >=80){
  cat(score, "는 B등급입니다","\n")
}else if (score >=70){
  cat(score, "는 C등급입니다","\n")
}else if (score >=60){
  cat(score, "는 D등급입니다","\n")
}else{
  cat(score, "는 F등급입니다","\n")
}

#for 실습
for(data in month.name)
  print(data)
for(data in month.name) print(data); print("ㅋㅋ")
for(data in month.name){print(data);print("ㅋㅋ")}

for(n in 1:5)
  cat("hello?","\n")

for(i in 1:5){
  for(j in 1:5){
    cat("i",i,"j=",j,"\n")
  }
}

#구구단
for(dan in 1:9){
  for(num in 1:9){
    cat(dan,"x",num,"=",dan*num,"\t")
  }
  cat("\n")
}

#switch 문을 대신하는 함수
month <- sample(1:12,1)
month <- paste(month,"월",sep="") #sep="" 생략하면 "3 월"로 나옴. "3 월"과"3월"은 다름.
result <- switch(EXPR = month,
                 "12월"=,"1월"=,"2월"="겨울",
                 "3월"=,"4월"=,"5월"="봄",
                 "6월"=,"7월"=,"8월"="여름",
                 "가을")
cat(month,"은"," ",result,"입니다.\n",sep="")

num <- sample(1:10,1)
num
switch(EXPR = num,"A","B","C","D")

for(num in 1:10){
  cat(num,":",switch(EXPR = num,"A","B","C","D"),"\n")
}

for(num in 1:10){
  num<- as.character(num)
  cat(num,":",switch(EXPR = num,"7"="A","8"="B","9"="C","10"="D","ㅋ"),"\n")
}


