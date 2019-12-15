#스타벅스 정보 크롤링

library(RSelenium)
library(XML)

remDr <- remoteDriver(remoteServerAddr = "localhost", port=4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
Sys.sleep(5)

seoul <- remDr$findElement(using = "css", "#container li:nth-child(1) > a")
seoul$clickElement()
Sys.sleep(3)

all_area <- remDr$findElement(using = "css", "#mCSB_2_container > ul > li:nth-child(1) > a")
all_area$clickElement()
Sys.sleep(3)

names <- NULL
tem2 <- NULL
addr1 <- NULL
tele1 <- NULL
names <- NULL
addrs <- NULL
teles <- NULL
longs <- NULL
lats <- NULL

for (i in 1:503){
  name1 <- remDr$findElements(using = "css selector",paste0('#mCSB_3_container > ul > li:nth-child(',i,') > strong'))
  name2 <- sapply(name1, function(x){x$getElementText()})
  names <- append(names, name2)
  
  tem1 <- remDr$findElements(using = "css selector",paste0('#mCSB_3_container > ul > li:nth-child(',i,') > p'))
  tem2 <- sapply(tem1, function(x){x$getElementText()})
  tem3 <- unlist(strsplit(as.character(tem2),split = "\n",fixed = T))
  
  addr1 <- tem3[1]
  addrs <- append(addrs, addr1)
  
  tele1 <- tem3[2]
  teles <- append(teles, tele1)
  
  location <- remDr$findElements(using = "css",paste0("#mCSB_3_container > ul > li:nth-child(",i,")"))
  long1 <- sapply(location, function(x){x$getElementAttribute("data-long")})
  longs <- append(longs, long1)
  
  lat1 <- sapply(location, function(x){x$getElementAttribute("data-lat")})
  lats <- append(lats, lat1)
  
  
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}

data <- data.frame(unlist(names),unlist(lats),unlist(longs),addrs,teles)
colnames(data) <- c("매장명(shopname)", "위도(lat)", "경도(lng)", "주소(addr)", "전화번호(telephone)")
write.csv(data,"starbucks.csv")
