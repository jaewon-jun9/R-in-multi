#문제1
exam5 <- function(x,y="#"){
  if (x<0)
    return()
  else
    rep(y,x) 
  }

exam5(-1)


#문제2
exam6 <- function(score){
  if (any(is.na(score)))
    print("NA는 처리불가")
  else{ 
      if (any((score>=85)))
        grade <- "상"
      else if (any((score>=70)))
        grade <- "중"
      else
        grade <- "하"
  print(paste0(score," 점은 ",grade,"등급입니다."))
  }
}

exam6(c(84,55,89,74))

exam6(NA)

#문제2
exam6 <-function(vec){
  for (d in vec) {
  if (is.na(d)){
    cat(d,'는 처리불가')
  }else if (d>=85){
    cat(d,'점은 상등급입니다.')
  }else if (d>=70){
    cat(d,'점은 중등급입니다.')
  }else{
    cat(d,'점은 하등급입니다.')
  }
}}

exam6(34)





#문제3
countEvenOdd <- function(x){
  c_even<-0
  c_odd<-0
  if (is.numeric(x)){
    for(i in 1:length(x))
      if (x[i]%%2==0)
        c_even <- c_even+1
      else
        c_odd <- c_odd+1
    return(list(even=c_even,odd=c_odd))
  }
  else
    return()
}

countEvenOdd(c(12,3,6,6,8,8,1,4,15,5,6))



#문제4
vmSum <- function(x){
   if (is.vector(x)){
     if (is.numeric(x))
       return(sum(x))
     else
       print(0)
       return("숫자 벡터를 전달하숑!")
     }
  else
    return("벡터만 전달하숑!")
  }

vmSum(data.frame())
vmSum(c(1,2,3))
vmSum(c(1,"d",3))

#문제5
vmSum2 <- function(x){
  if (is.vector(x)){
    if (is.numeric(x))
      return(sum(x))
    else
      print(0)
    return(warning("숫자 벡터를 전달하숑!"))
  }
  else
    stop("벡터만 전달하숑!")
}

vmSum2(list())
vmSum2(c(1,2,3))
vmSum2(c(1,3))





