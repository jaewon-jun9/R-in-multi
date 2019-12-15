#문제1
grade <- sample(1:6,1)
if(grade<=3){
  cat(grade,"학년은","저학년입니다.",sep=" ")
}else{
  cat(grade,"학년은","고학년입니다.",sep=" ")
}

#문제2
choice <- sample(1:5,1)
choice <- switch (EXPR=choice,300+50,300-50,300*50,300/50,300%%50,"\n")
cat("결과값",choice,sep=":")

#문제3
count <- sample(3:10,1)
deco <- sample(1:3,1)
switch(EXPR=deco,
       for(n in 1:count)cat("*"),
       for(n in 1:count)cat("$"),
       for(n in 1:count)cat("#"))

#for반복문 대신 rep()이용
#switch(EXPR=deco,
#       cat(rep("*",count),sep=""),
#       cat(rep("$",count),sep=""),
#       cat(rep("#",count),sep=""))




#문제4
score <- sample(1:100,1)
if (score >=90){
  level<-"A 등급"
  cat(score," 점은 ",level,"입니다.",sep="")
}else if(score>=80){
  level<-"B 등급"
  cat(score," 점은 ",level,"입니다.",sep="")
}else if (score>=70){
    level<-"C 등급"
    cat(score," 점은 ",level,"입니다.",sep="")
}else if(score>=60){
    level <-"D 등급"
    cat(score," 점은 ",level,"입니다.",sep="")
}else{
  level <-"F 등급"
cat(score," 점은 ",level,"입니다.",sep="")}


#문제5
A <- LETTERS
a <- letters
alpha <- paste(A,a,sep="")
alpha
