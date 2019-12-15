#모든 댓글 뽑기
remDr$open()
remDr$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204")
#나중에하기 클릭하여 팝업메뉴 없애기
laterAction <- remDr$findElement(using = "css", '#SearchBoxContainer > div 
                                > div > div.Popup__container.Popup__container--garage-door 
                                > div > div > div.AlertMessage.CalendarAlertMessage > a')

if(length(laterAction) != 0){
  laterAction$clickElement()
}


remDr$executeScript("scrollBy(0, 8400)")
test <- remDr$findElement(using='css','#customer-reviews-panel > span')
test$clickElement()

comment <- remDr$findElements(using = "css selector", 'p.Review-comment-bodyText' )
a <- sapply(comment, function(x){x$getElementText()})
  
allcomment <- NULL
  repeat{
    nextpage <- remDr$findElement(using = "css selector", '#reviewSection > div:nth-child(4) > div > span:nth-child(3)')
    nextpage$clickElement()
    Sys.sleep(2)
    comment <- remDr$findElements(using = "css selector", 'p.Review-comment-bodyText' )
    pagecomment <- sapply(comment, function(x){x$getElementText()})
    allcomment <- c(allcomment,unlist(pagecomment))
    if(length(nextpage) == 0)
      break;
}

allcomment <- c(unlist(a),allcomment)

write(unlist(allcomment),"hotel.txt")
