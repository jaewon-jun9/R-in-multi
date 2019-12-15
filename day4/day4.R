for (data in month.name)
  print(data)


sum <-0
for(i in 5:15){
  if(i%%10==0){
    break;
  }
  sum <-sum + i
  print(paste(i,":",sum))    
}

sum <-0
for(i in 5:15){
  if(i%%10==0){
    next;
  }
  sum <-sum + i
  print(paste(i,":",sum))
}

sumNumber <- 0
while (sumNumber <= 20) {
  i <- sample(1:5,1)
  sumNumber <- sumNumber+i;
  cat(sumNumber,"\n")
}

repeat {
  cat("ㅋㅋㅋ\n")
}

sumNumber <- 0
repeat {
  i <- sample(1:5,1)
  sumNumber <- sumNumber+i;
  cat(sumNumber,"\n")
  if(sumNumber > 20)
    break;
}


f1 <- function()print("TEST")

f2 <- function(num){print("TEST");print(num)}

f3 <- function(p="R")print(p)

f4 <- function(p1="ㅋㅋㅋ",p2) for(i in 1:p2)print(p1)

f5 <- function(...){print("TEST");data <- c(...);print(length(data))}

f5(10,20,30,545,5,1,5,5,2)

f6 <- function(...){
  print("수행시작")
  data<-c(...)
  for(item in data){
    print(item)
  }
  return(length(data))
}

f7 <- function(...){
  data<-c(...)
  sum<- 0;
  for(item in data){
    if(is.numeric(item))
      sum<- sum+item
    else
      print(item)
  }
  return(sum)
}

f8 <- function(...){
  data<-list(...)
  sum<- 0;
  for(item in data){
    if(is.numeric(item))
      sum<- sum+item
    else
      print(item)
  }
  return(sum)
}

f6()
f6(10)

func1 <- function() {
  xx <- 10
  yy <- 20
  return(xx*yy)
}
func1()

result <- func1()
result
xx

func2 <- function(x,y) {
  xx <- x
  yy <- y
  return(xx*yy)
}
func2(5,6) # 식 : 연산식, 호출식, 변수, 리터럴

func3 <- function(x,y) {
  x3 <- x+1
  y3 <- y+1
  x4 <- func2(x3,y3) # 값(식) : 변수, 리터럴, 연산식, 호출식
  return(x4)
}
func3(9,19)

func4 <- function(x=100, y=200,z){
  return(x+y+z)
}
func4()
func4(10,20,30)
func4(x=1,y=2,z=3)
func4(y=1,z=2,x=3)
func4(z=1000)

a<-3;b<-7;c<-11 #89에 있는 b는 91에 있는 b와 다름 89=전역,91은 지역
ft<-function(a){
  b<-a+10
  c<<-a+10 #<<-를 쓰면 전역대입연산
  d<-a
  print(a);print(b);print(c);print(d)
  return() #NULL
}
print(ft(100))
print(a);print(b);print(c);print(d)


testParamType <- function(x){
  if(is.vector(x)) print("벡터를 전달했군요!")
  if(is.data.frame(x)) print("데이터프레임을 전달했군요!")
  if(is.list(x)) print("리스트를 전달했군요!")
  if(is.matrix(x)) print("매트릭스를 전달했군요!")
  if(is.array(x)) print("배열을 전달했군요!")
  if(is.function(x)) print("함수를 전달했군요!")
}


rm(sum)
testParamType(100)
testParamType(LETTERS)
testParamType(data.frame())
testParamType(matrix())
testParamType(list())
testParamType(array())
testParamType(sum)

