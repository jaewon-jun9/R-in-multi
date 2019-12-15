#문제1
exam1 <- function(){
  return(alpha)
}

#exam1 = function(){
#x= paste0(LETTERS,letters) #paste에서 sep=""안줘도 됨
#return(x)
#}


#문제2
exam2 <- function(n1){
  n1 <- sum(1:n1)
    return(n1)
  } 

#exam2 = function(p1){
#  for(i in 1:p1){
#    sum= sum+i
#  }
#  return(sum)
#}



#문제3
exam3 <- function(n2,n3){
  if (n2 > n3)
    n4 <- n2-n3
  else if (n2 < n3)
    n4 <- n3-n2
  else
    n4 <- 0
        return(n4)
}

exam3(5,6)

#문제4
exam4 <- function(x,y,z){
  if (y=="+")
      g <- x+z
  else if (y=="-")
      g <- x-z
  else if (y=="*")
      g <- x*z
  else if (y=="%/%"){
        if (x==0)
          g<-"오류1"
        else if (z==0)
          g<-"오류2"
        else
          g <- x%/%z
        }  
  else if (y=="%%"){
        if (x==0)
          g <- "오류1"
        else if (z==0)
          g<-"오류2"
        else
          g <- x%%z
        }
  else
      g <- "규격의 연산자만 전달하세요"
  return(g)
}

exam4(5,"*",6)

#문제4 다른방법
#exam4 = function(n1,a1,n2){
#  if(a1 == '+'){
#    x = n1+n2
#  }else if(a1 == '-'){
#    x = n1-n2 
#  }else if(a1 == '*'){
#   x = n1*n2
#  }else if(a1 == '%/%' & n1 != 0 & n2 !=0){
#    x = n1%/%n2
#  }else if(a1 == '%%' & n1 != 0 & n2 !=0){
#    x = n1%%n2
#  }else if((a1 == '%/%' | a1 == '%%' )& n1 == 0 & n2 !=0){
#    x = "오류1"
#  }else if((a1 == '%/%' | a1 == '%%' )& n1 != 0 & n2 == 0){
#    x = '오류2'
#  }else{
#    x = '규격의 연산자만 전달하세요'
#  }
#  return(cat(n1,a1,n2,'=',x))}


#문제4
#exam4 <- function(x, y, z){
#  
#  if((y == "%/%") |( y == "%%")){
#    if(x==0) return("오류1")
#    if(z==0) return("오류2")
#  }
#  
#  switch(y,
#         "+"=return(x+z),
#         "-"=return(x-z),
#         "*"=return(x*z),
#         "%/%"=return(x %/% z),
#         "%%"=return(x %% z),
#         "규격의 연산자만 전달하세요"
#  )
#}
