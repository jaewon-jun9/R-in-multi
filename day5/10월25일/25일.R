mySum <- function(v) {   
  if(is.null(v)){
    result <- NULL
  } else {
    if (is.vector(v) && !is.list(v)) {
      if(any(is.na(v))){
        warning("NA를 최저값으로 변경하여 처리함!!")
        v[is.na(v)] <- min(v, na.rm = T)
        print(v)
      }
      oddIndex <- seq(1, length(v), 2)
      evenIndex <- seq(2, length(v), 2)
      oddSum <- sum(v[oddIndex])
      evenSum <- sum(v[evenIndex])
      result <- list(oddSum=oddSum, evenSum=evenSum)
    } else {
      stop("벡터만 처리 가능!!")
    }
  }
  return(result)
}

mySum(1:10)
mySum(c(10,20,NA))
mySum(NULL)

mySum

myExpr <- function(f){
  if(is.function(f)) {
     data <- sample(1:45, 6)
     print(data)
     return(f(data))
  } else {
    stop("수행 안할꺼임!!")
  }
}

myExpr(sum)
myExpr(max)
myExpr(1:10)

createVector <- function(...) {
  v <- c(...)
  if (length(v) == 0)
    v <- NULL  
  else if (any(is.na(v)))
    v <- NA
  return(v)
}

createVector(10,20,30)
createVector(10,20,30, "A")
createVector()
createVector(10,20,NA,30)
createVector(10,20,30, FALSE)
createVector(10,20,30, "A", FALSE)

data <- scan("data/iotest1.txt")
cat("오름차순 : ", sort(data), "\n")
cat("내림차순 : ", sort(data, decreasing=T), "\n")
cat("합 : ", sum(data), "\n")
cat("평균 : ", mean(data), "\n")


data <- scan("data/iotest2.txt", what="")
fdata <- factor(data)
countdata <- summary(fdata)
sortdata <- sort(countdata, decreasing=T)
word <- names(sortdata[1])
cat("가장 많이 등장한 단어는 ", word,"입니다")

data <- scan("data/iotest2.txt", what="")
countdata <- table(data)
sortdata <- sort(countdata, decreasing=T)
word <- names(sortdata[1])
cat("가장 많이 등장한 단어는 ", word,"입니다")

test5 = scan('C:/Rstudy/data/iotest2.txt',what ="")
table(test5)
x = test5[max(table(test5))]
cat('가장 많이 등가하는 단어는',x,'입니다')
