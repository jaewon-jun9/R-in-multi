library(Kormaps)
data(korpopmap2)
data(korpopmap3)
Encoding(korpopmap2@data$name)<-'UTF-8'
korpopmap2@data$code.data
korpopmap2@data$name
gucodename <- korpopmap2@data[,c("name", "code.data")]

names(gucodename)
Encoding(korpopmap3@data$name)<-'UTF-8'
korpopmap3@data$code.data
korpopmap3@data$name

guname <- '강남구'
gucode <- gucodename[gucodename$name == guname, "code.data"]
pattern <- paste0('^', gucode)
korpopmap3@data[grep(pattern, korpopmap3@data$code.data), 
                c("code.data", "name")]

#정규표현식
gsub("ABC", "***", "ABCabcABC")  #ABC를 **로 변환
gsub("ABC", "***", "ABCabcABC", ignore.case=T)
x<-c("ABCabcABC", "abcABCabc")
gsub("ABC", "***", x) 
gsub("b.n", "***", "i love banana")  #b랑 n이랑 사이에 아무거나 한개까지 바꿈
gsub("b.*n", "***", "i love banana") #b랑 n사이에 몇개가 와도 상관x, b~n까지 바꿈
gsub("[bn]a", "***", "i love banana") #ba도 찾고 na도 찾음
gsub("010-[0-9]{4}-[0-9]{4}", "010-****-****", "내 폰번호는 010-1234-6789") #자바에서 많이 씀
gsub("010-\\d{4}-\\d{4}", "010-****-****", "내 폰번호는 010-1234-6789") 
gsub(" +", " ", "i   love    banana")

#apply () 계열의 함수들...
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F", "M", "M", "F", "F")

df <- data.frame(w=weight, h=height)
df


apply(df, 1, sum, na.rm=TRUE)
apply(df, 2, sum, na.rm=TRUE)
lapply(df, sum, na.rm=TRUE)
sapply(df, sum, na.rm=TRUE)
tapply(df$w, gender, mean, na.rm=TRUE)
tapply(1:6, gender, sum, na.rm=TRUE)
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])
?mapply()
count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(5)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}

sapply(df$w, myf)
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)
count <- 1
sapply(df, myf)
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]


r <- sapply(df, myf)
str(r)



install.packages("KoNLP")
library(KoNLP)
library(wordcloud)
library(RColorBrewer)
library(stringr)
useSejongDic()
install.packages("tm")
library(tm)

lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps)
tdm
as.matrix(tdm)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
tdm
(m <- as.matrix(tdm))

colnames(m) <- c("doc1", "doc2", "doc3", "doc4", "doc5", "doc6")
rowSums(m)
colSums(m)


com <- m %*% t(m) #행렬의 곱
View(com)

install.packages("qgraph")
library(qgraph)

qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))




install.packages("proxy")
library(proxy)
dd <- NULL
d1 <- c("aaa bbb ccc")
d2 <- c("aaa bbb ddd")
d3 <- c("aaa bbb ccc")
d4 <- c("xxx yyy zzz")
dd <- c(d1, d2, d3, d4)
cps <- Corpus(VectorSource(dd))
dtm <- DocumentTermMatrix(cps)
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com
dist(com, method = "cosine")
dist(com, method = "Euclidean")
install.packages("lsa")
library(lsa)
cosine(com)


# Install
install.packages("tm")  # 텍스트 마이닝을 위한 패키지
install.packages("SnowballC") # 어간추출을 위한 패키지
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)

# VectorSource () 함수는 문자형 벡터 모음을 만듭니다.
docs <- Corpus(VectorSource(text))
# 텍스트의 특수 문자 등을 대체하기 위해 tm_map () 함수를 사용하여 변환이 수행됩니다.
# “/”,“@”및“|”을 공백으로 바꿉니다.
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")



# 소문자로 변환
docs <- tm_map(docs, content_transformer(tolower))

# 수치 데이터 제거
docs <- tm_map(docs, removeNumbers)
# 영어 불용어 제거
docs <- tm_map(docs, removeWords, stopwords("english"))

# 벡터 구조로 사용자가 직접 불용어  설정 , 제거
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 

# 문장 부호 punctuations
docs <- tm_map(docs, removePunctuation)

# 공백 제거
docs <- tm_map(docs, stripWhitespace)

# 텍스트 형태소 분석
# docs <- tm_map(docs, stemDocument)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

#---------------------------------------------------------------------------------


install.packages("reshape2")
library(reshape2)

head(french_fries)
# time : 몇 주차 실험인가
# treatment : 사용한 식용유의 종류
# subject : 실험 대상자
# rep : 이 측정이 몇 번째 반복인가
# potato : 감자 맛
# buttery : 버터 맛
# grassy : 풀맛
# rancid : 신맛
# painty : 안 좋은 냄새

# 문제 : buttery 열의 평균, grassy 열의 평균, rancid 의 평균, painty 의 평균을 구하시오.
apply(french_fries[5:9],2,mean,na.rm=T)


m <- melt(french_fries, id.vars=1:4) #id.var = "기준열" measure.vars= "변환열"
head(m)
View(m)
library(dplyr)
m %>% group_by(variable) %>% summarize(평균=mean(value, na.rm=T))
m2 <- melt(french_fries, id.vars=1:4, na.rm=T)
dim(m2)
dim(m)
m2 %>% group_by(variable) %>% summarize(평균=mean(value))

r <- dcast(m, time+treatment+subject + rep ~ ...)
head(r)

rownames(r) <- NULL
rownames(french_fries) <- NULL

identical(r, french_fries)

# 책에 있는 예제들

str(airquality)
dim(airquality)
View(airquality)
names(airquality)

names(airquality) <- tolower(names(airquality))
head(airquality)
names(airquality)

melt_test <- melt(airquality)
dim(melt_test)
melt_test2 <- melt(airquality, id.vars=c("month", "wind"), measure.vars="ozone")
head(melt_test2)
dim(melt_test2)

melt_test3 <- melt(airquality, id.vars=c("month", "wind"))
head(melt_test3)
dim(melt_test3)

aq_melt <- melt(airquality, id.vars=c("month", "day"), na.rm=T)
dim(aq_melt)
aq_dcast <- dcast(aq_melt, month+day ~ variable)
View(airquality); 
View(aq_melt); 
View(aq_dcast); 
dcast(aq_melt, month~variable, mean)