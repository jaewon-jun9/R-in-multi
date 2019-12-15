word <- readLines("yes24.txt")
word

word_data <- extractNoun(word)
word_data <- unlist(word_data)
word_data <- Filter(function(x) {nchar(x) >=2}, word_data)
word_data <- table(word_data)
word_data <- as.data.frame(sort(word_data,decreasing = T))
result<-wordcloud2(word_data,rotateRatio = 0.2,fontFamily = "휴먼옛체",
                   minSize=5)

library("htmlwidgets")
saveWidget(result,"wc2.html",title="WORDCLOUD2 실습", selfcontained = F)
