#문제1
exam5 <- function(x,y="#"){
  if (x<0)
    return()
  else
    rep(y,x) 
  }


#문제2
exam6 <- function(score){
  if (is.na(score))
    print("NA는 처리불가")
  else{ 
      if (score>=85)
        grade <- "상"
      else if (score>=70)
        grade <- "중"
      else
        grade <- "하"
  print(paste0(score," 점은 ",grade,"등급입니다."))
  }
}

exam6(84)
exam6(NA)

#문제3
countEvenOdd <- function(x){
  c_even<-0
  c_odd<-0
  if (is.numeric(x)){
    for(i in 1:length(x))
      if (x[i]%%2==0)
        c_even <- c_even+1
      else #if (x[i]%%2==1)
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
       return(warning("숫자 벡터를 전달하숑!"))
     }
  else
    return(error("벡터만 전달하숑!"))
  }
vmSum(data.frame())
vmSum(c(1,2,3))
vmSum(c(1,"d",3))
