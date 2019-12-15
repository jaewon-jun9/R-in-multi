#문제1
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("단풍","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))

doc_blog <- htmlParse(doc, encoding = "utf-8")
naverblog <- xpathSApply(doc_blog, "//item/description",xmlValue)
naverblog

write(naverblog,"naverblog.txt")


#문제2
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))

doc_news <- htmlParse(doc, encoding = "utf-8")
navernews <- xpathSApply(doc_news, "//item/title",xmlValue)
navernews

write(navernews,"navernews.txt")


#문제3

key <- "취업"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content

write(content,"twitter.txt")

#문제4
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste0("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No)
doc <- xmlParse(url, encoding="utf-8")
top <- xmlRoot(doc)
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"),stringsAsFactors = FALSE)
df

id <- ifelse(df$busRouteNm=="360",df$busRouteId,"")
length <- ifelse(df$busRouteNm=="360",df$length,"")
start <- ifelse(df$busRouteNm=="360",df$stStationNm,"")
end <- ifelse(df$busRouteNm=="360",df$edStationNm,"")
term <- ifelse(df$busRouteNm=="360",df$term,"")

#문제4-1
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste0("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No)
doc <- xmlParse(url, encoding="utf-8")
# top <- xmlRoot(doc) 위에 encoding을 utf-8로하고 doc를 출력했을때
# 제대로 못읽어올 때 xmlRoot를 사용한다
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"),stringsAsFactors = FALSE)
df

a <- subset(df,df$busRouteNm=="360",select = c(busRouteId,length,stStationNm,edStationNm,term))

cat(" [360번 버스정보]", "\n","노선ID : ",a$busRouteId
    ,"\n","노선길이 : ",a$length,"\n"
    ,"기점 : ", a$stStationNm,"\n"
    ,"종점 : ", a$edStationNm,"\n"
    ,"배차간격 : " , a$term,"\n")

