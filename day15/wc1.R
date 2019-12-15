library(stringr)
library(RColorBrewer)

word <- readLines("공구.txt",encoding = 'UTF-8')
word

word_data <- extractNoun(word)
word_data

undata <- unlist(word_data)
undata <- gsub("[[:punct:]]","",undata)
undata <- gsub("[0-9ㅜ]","",undata)
undata <- gsub("♥","",undata)
undata <- gsub("공구.*","",undata)
# 공구.+하면 뒤에 붙은것들은 날라가는데 공구는 안날라감
# 공구.*하면 공구로 시작하는 모든 글자 날라감
undata <- gsub("해주세.*","",undata)
undata <- gsub("원해.*","",undata)
undata <- gsub("부탁","",undata)
undata <- gsub("필요해요","",undata)
undata <- gsub("기다립니","",undata)
undata <- gsub("[A-z]","",undata)
undata <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <=5}, undata)
word_table <- table(undata)
final <- sort(word_table, decreasing = T)
final2 <- as.data.frame(final)

png(filename="wc.png", height=400, width=700, bg="white")

windowsFonts(lett=windowsFont("휴먼옛체"))
wordcloud(final2$undata, final2$Freq,family="lett",
          min.freq = 2, random.color=T,
          random.order = FALSE, 
          rot.per = 0.5, scale = c(4, 1),colors = brewer.pal(9,"Set1"))

dev.off()


