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


#한국일보 페이지(XML 패키지 사용)
install.packages("XML")
library(XML)
imsi <- read_html("http://hankookilbo.com")
t <- htmlParse(imsi)
content<- xpathSApply(t,"//p[@class='title']",xmlValue);
content
content <- gsub("[[:punct:][:cntrl:]]","",content)
content
content <- trimws(content)
content
unique(content)

#httr패키지 사용 - GET 방식 요청
install.packages("httr")
library(httr)
http.standard <- GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')
title2 = html_nodes(read_html(http.standard),'div.toc h2')
title2 = html_text(title2)
title2


