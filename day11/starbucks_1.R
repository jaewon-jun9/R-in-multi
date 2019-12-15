library(XML)
library(httr)
library(rvest)
install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445,
                      browserName = "chrome")
remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")

Sys.sleep(5)
seoul <- remDr$findElement(using = "css", '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
seoul$clickElement()
Sys.sleep(5)
seoul_all <- remDr$findElement(using="css",'#mCSB_2_container > ul > li:nth-child(1) > a')
seoul_all$clickElement()

Sys.sleep(5)
#매장명(shopname)
shopnames <- NULL
for (i in 1:503){
shopcss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
shopnamecss <- remDr$findElements(using = "css", shopcss)
shopname <- sapply(shopnamecss, function(x){x$getElementText()})
shopnames <- c(shopnames,unlist(shopname))
  if (i%%3==0){
  remDr$executeScript(
    "var su=arguments[0]; var dom = document.querySelectorAll(
    '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}

#위도(lat)
lat <- NULL
for (i in 1:503){
  latcss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
  lat_css <- remDr$findElements(using="css", latcss)
  lats <- sapply(lat_css, function(x){x$getElementAttribute("data-lat")})
  lat <- c(lat, unlist(lats))
    if (i%%3){
      remDr$executeScript(
        "var su=arguments[0]; var dom = document.querySelectorAll(
    '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}

lat

#경도(lng)
lng <- NULL
for (i in 1:503){
  lngcss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
  lng_css <- remDr$findElements(using="css", lngcss)
  lngs <- sapply(lng_css, function(x){x$getElementAttribute("data-long")})
  lng <- c(lng, unlist(lngs))
  if (i%%3){
    remDr$executeScript(
      "var su=arguments[0]; var dom = document.querySelectorAll(
    '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}

lng





#주소(addr) & 전화번호(telephone) 추출
addr <- NULL
for (i in 1:503){
  addrcss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,")  p[class^=result]")
  adresscss <- remDr$findElements(using = "css", addrcss)
  addrs <- sapply(adresscss, function(x){x$getElementText()})
  addr <- c(addr,unlist(addrs))
  if (i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom = document.querySelectorAll(
    '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
  }
}


#주소(addr) & 전화번호(telephone) 분리
#주소
addrphones <- strsplit(addr,"[\n]")
addrphones <- unlist(addrphones)

addrs<- NULL
addr<- NULL
for(i in 1:1006){
  if (i%%2==1){
    addr <- addrphones[i]
    addrs <- c(addrs,addr)
  }
}
addrs

#전화번호
phones<- NULL
phone<- NULL
for(i in 1:1006){
  if (i%%2==0){
    phone <- addrphones[i]
    phones <- c(phones,phone)
  }
}

phones



starbucks <- list(shopname=shopnames,lat=lat,lng=lng,addr=addrs,telephone=phones)
write.csv(starbucks,"starbucks.csv")

