#정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub("A","",word)
gsub("a","",word)
gsub("Aa","",word)
gsub("(Aa)","",word)
gsub("(Aa){2}","",word)
gsub("[Aa]","",word)
gsub("[가-힣]","",word)
gsub("[^가-힣]","",word)
gsub("[&^%*]","",word)
gsub("[[:punct:]]","",word)
gsub("[[:alnum:]]","",word)
gsub("[1234567890]","",word)
gsub("[0-9]","",word)
gsub("\\d","",word)
gsub("[[:digit:]]","",word)
gsub("[^[:alnum:]]","",word)
gsub("[[:space:]]","",word)


#한국일보 페이지 title가져오기(XML 패키지 사용)
install.packages("XML")
library(XML)
imsi <- read_html("http://hankookilbo.com")
t <- htmlParse(imsi)
content<- xpathSApply(t,"//p[@class='title']",xmlValue);
content
# content <- gsub("[[:punct:][:cntrl:]]","",content)
content <- trimws(content) # 얘를 하면 위에 걸 굳이 안해도 됨
content<- xpathSApply(t,"//p[@class='title']",xmlValue,trim=T); #trim=T를 하면 위에 걸 굳이 안해도 됨
content
unique(content) #unique는 중복제거

#한국일보 페이지 연관뉴스제목(news-related) 가져오기
content<- xpathSApply(t,"//p[@class='news-related']",xmlValue,trim=T);
unique(content)




#httr패키지 사용 - GET 방식 요청
install.packages("httr")
library(httr)
http.standard <- GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')
title2 <- html_nodes(read_html(http.standard),'body > h2:nth-of-type(1)')
title2 <- html_text(title2, trim = T)
title2

#xpath로 실습해보기
http.standard <- GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')
t <- htmlParse(http.standard)
title2 <- xpathSApply(t, "//body/h2[1]",xmlValue, trim = T)
title2 <- html_text(title2, trim = T)
title2


str(http.standard)

#http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week
game <- POST('http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week',
             encode = 'form',body=list(txtPeriodW = '2019-10-5'))
title3 = html_nodes(read_html(game),'a.tracktitle')
title3 = html_text(title3)
title3[1:10]


#이미지, 첨부파일 다운 받기
#pdf
res = GET('http://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(res,'raw'), 'c:/Temp/httr.pdf')   #raw : 이미지

#jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h,'img')
img.src = html_attr(imgs,'src')
for (i in 1:length(img.src)) {
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i],sep=""))
  writeBin(content(res,'raw'),paste('c:/Temp/',img.src[i],sep = ""))
}




?writeBin()






