library(httr)
library(XML)
library(rvest)

#naverblog "여름추천요리 내용(discription) 끌어오기"
#내용(discription)인건 네이버 오픈 api 사이트 들어가면 알 수 있음!
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
# URLencode("여름추천요리")
query <- URLencode(iconv("여름추천요리","euc-kr","UTF-8"))
query
url<- paste(searchUrl, "?query=", query , "&display=20", sep="")
      # = paste0(serarchUrl, "?query=", query, "&display=20")  

doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))

#xml
doc1 <- htmlParse(doc, encoding="UTF-8")
text1<- xpathSApply(doc1, "//item/description", xmlValue)
text1

#rvest + httr
doc2 <- html_nodes(read_html(doc, encoding="UTF-8"), xpath='//item/description')
text2 <- html_text(doc2)
text2

#rvest
doc3 <- html_nodes(content(doc, encoding="UTF-8"), xpath='//item/description')
text3 <- html_text(doc3)
text3



#navernews에서 '검찰'이 들어간 기사 내용추출
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("검찰","euc-kr","UTF-8"))
url<- paste(searchUrl, "?query=", query, "&display=20", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))

paringData <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(paringData, "//item/description", xmlValue); 
text



# 트위터 글 읽어오기
install.packages("twitteR")
library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)
# oauth 정보 저장 확인
key <- "단풍"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content


library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
str(df)

busRouteId <- df$busRouteId
busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df


#selenium실습(google.ver)
install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445,
                      browserName = "chrome")
#localhost는 자기 자신 의미함

remDr$open()
remDr$navigate("http://www.google.com/ncr") #ncr은 안줘도 되는 부분
      #navigate는 뒤에 url을 서버에서 데려와서 렌더링 까지 해주는 명령어

webElem <- remDr$findElement(using="css","[name = 'q']")
webElem$sendKeysToElement(list("JAVA",key="enter"))


#selenium실습(naver.ver)
remDr$navigate("http://www.naver.com/")
webElem <- remDr$findElement(using="css","[title = '검색어 입력']")
                                        # = [name = 'query']
webElem$sendKeysToElement(list("JAVA",key="enter"))
                              # ㄴ검색할 내용

#click event 실습
remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")
more <- remDr$findElements(using = "css",'span.u_cbox_in_view_comment')
sapply(more,function(x){x$clickElement()})

#elements와 element의 차이
remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")
more <- remDr$findElement(using = "css",'span.u_cbox_in_view_comment')
more$clickElement()

#2page
more <- remDr$findElements(using = "css",'
#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(4) > span')
sapply(more,function(x){x$clickElement()})
#3page
more <- remDr$findElements(using = "css",'
#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(5) > span')
sapply(more,function(x){x$clickElement()})


#2~10page
for (i in 4:12) {
  nextCss <- paste0("#cbox_module > div > div.u_cbox_paginate > div >
                    a:nth-child(",i,") > span")
  nextPage <- remDr$findElement(using = 'css',nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
}


#위와 동일 elements.ver
for (i in 4:12) {
  nextCss <- paste0("#cbox_module > div > div.u_cbox_paginate > div >
                    a:nth-child(",i,") > span")
  nextPage <- remDr$findElements(using = 'css',nextCss)
  sapply(nextPage,function(x){x$clickElement()})
  Sys.sleep(3)
}


