myFunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}

print(1)
myFunction()
print(2)

myFunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  today <- weekdays(Sys.Date())
  if (today=="금요일")
    return()
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}

r <- myFunction()

sum(LETTERS)

matrix(1:7, nrow = 3)

#stop() 함수
testError <- function(x){
  if(x<=0)
    stop("양의 값만 전달하숑!! 더 이상 수행 안할거임..")
  return(rep("테스트",x))
}
testError(5)
testError(-1)

#warning 함수
testwarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달하숑!! 더 이상 수행 안할거임..")
  if(x>5){
    x<-5
    warning("5보다 크면 안됨!! 하여 5로 처리했삼...!!")
  }
  return(rep("테스트",x))
}

testwarn(3)
testwarn(10)

test1 <- function(){
  cat("난 수행함\n")
  testwarn(6)
  cat("나 수행할까요? \n")
}

test1()

#test1 <- function(p){
#  cat("난 수행함\n")
#  print(testError(5)) >>함수 내에서 함수쓸 때 결과도 출력하고 싶을 땐 print 써줘야함 
#  cat("나 수행할까요? \n")
#}

#try()
test2 <- function(){
  cat("난 수행함\n")
  try(testwarn(6))
  cat("나 수행할까요? \n")
}
test2()

testAll <-function(p){
  tryCatch({
    if(p=="오류테스트"){
      testError(-1)
    }else if (p=="경고테스트"){
      testwarn(6)
    }else{
      cat("정상수행..\n")
      print(testError(2))
      print(testwarn(3))
    }
  },warning=function(w){
    print(w)
    cat("-.-;;\n")
  },error = function(e){
    print(e)
    cat("ㅠㅠ\n")
  },finally ={
    cat("반드시 수행되는 부분입니다요..\n")
  })
}

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")

f.case1 <- function(x) {
  if(is.na(x))
    return("NA가 있슈")
  else
    return("NA가 없슈")
}

f.case1(100)
f.case1(NA)
f.case1(1:6)
f.case1(c(10,20,30))
f.case1(c(NA,20))
f.case1(c(10,NA,20))

f.case1 <- function(x) {
  if(any(is.na(x)))
    return("NA가 있슈")
  else
    return("NA가 없슈")
}

f.case1(100)
f.case1(NA)
f.case1(1:6)
f.case1(c(10,20,30))
f.case1(c(NA,20))
f.case1(c(10,NA,20))

f.case1 <- function(x) {
  if(all(is.na(x)))
    return("모두 NA임")
  else
    return("모두 NA인 것은 아님")
}

f.case1(100)
f.case1(NA)
f.case1(1:6)
f.case1(c(10,20,30))
f.case1(c(NA,20))
f.case1(c(10,NA,20))


#Sys.sleep(초시간)함수
testSleep <-function(x){
  for(data in 6:10){
    cat(data,"\n")
    if(x)
      Sys.sleep(2)
  }
  return()
}
testSleep(FALSE)
testSleep(TRUE)

