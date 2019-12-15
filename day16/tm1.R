#(1) 좋아하는 과일이 가장 유사한 친구들을 찾아본다.
library(tm)
library(proxy)
fruit <- NULL
듀크 <- c("사과 포도 망고")
둘리 <- c("포도 자몽 자두")
또치 <- c("복숭아 사과 포도")
도우너 <- c("오렌지 바나나 복숭아")
길동 <-c("포도 바나나 망고")
희동 <- c("포도 귤 오렌지")

fruit <- c(듀크,둘리,또치,도우너,길동,희동)

cps <- VCorpus(VectorSource(fruit))
tdm <- TermDocumentMatrix(cps,
                          control=list(wordLengths = c(1, Inf)))
m <- as.matrix(tdm)
colnames(m) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
com <- t(m) %*% m 
com
dist(com, method = "cosine") #거리가 가까울 수록 유사도 높음
# dist(com, method = "Euclidean") #거리가 가까울 수록 유사도 높음

#듀크-또치,길동

#(2) 학생들에게 가장 많이 선택된 과일을 찾아본다.
sort(rowSums(m))


#포도

#(3) 학생들에게 가장 적게 선택된 과일을 찾아본다.
sort(rowSums(m))

#귤,자두,자몽