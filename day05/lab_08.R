#문제1-teachter.ver
mySum <- function(v) {   
  if(is.null(v)){
    return()
  } else {
    if (is.vector(v) && !is.list(v)) {
      if(any(is.na(v))){
        warning("NA를 최저값으로 변경하여 처리함!!")
        v[is.na(v)] <- min(v, na.rm = T)
        print(v) #중간중간 확인하라는 의미. 수행잘되면
                 #나중에 지우면 됨
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


#문제1
mySum <- function(x){
    if(any(is.vector(x))|any(is.list(x)!=T))
    if (any(is.na(x))){
     x[is.na(x)] <- min(x,na.rm = T)
     for (i in 1:length(x))
       if (i%%2==0)
         oddSum <- sum(x[i])
       else
         evenSum <- sum(x[i])
     try(warning("NA를 최저값으로 변경하여 처리함!"))
     return(list(oddSum=oddSum,evenSum=evenSum))
    }else{
      for (i in 1:length(x))
        if (i%%2==0)
          oddSum <- sum(x[i])
        else
          evenSum <- sum(x[i])
      return(list(oddSum=oddSum,evenSum=evenSum))
    } 
  else if (is.null(x))
    return()
  else
    return(stop("벡터만 처리가능!!"))
}

mySum(c(2,10,3))

#f1 <- function(){
#  
#}
#
#f1()
#print(f1)
#f2 <- f1
#print(f2)


#문제2

myExpr <- function(func){
  if (is.function(func)!=T)
    stop("수행 안할거임!!")
  else
    a <- sample(1:45,6)
    b <- func(a)
    return(b)
}

myExpr(max)
myExpr(min)


#문제3

createVector <- function(...){
  x <- c(...)
  if (is.null(x))
    x <- NULL
  else if (any(is.na(x)))
    x <- NA
  return(x)
}

createVector("d",14)
createVector("d",14,NA)
createVector()


#문제4

a <- scan("data/iotest1.txt")
sort(a)
sort(a,decreasing = T)
sum(a)       
mean(a)

#문제5

a <- scan("data/iotest2.txt",what = "", encoding = "UTF-8")
name <- levels(factor(a))
cat("가장 많이 등장한 단어는",
    name[which(table(a)==max(table(a)))],
    "입니다.")







