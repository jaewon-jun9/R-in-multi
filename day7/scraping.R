url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text
#h1태그의 컨텐트
h1 <- html_nodes(text,"h1")
html_text(h1)

#<a>태그의 컨텐트와 href속성값
nodes <- html_nodes(text,"a")
nodes
html_attr(nodes,"href")

#<img>태그의 src속성값
img <- html_nodes(text,"img")
html_attr(img,"src")

#첫번째 h2태그의 컨텐트
h2_1 <- html_nodes(text,"h2:nth-of-type(1)")
html_text(h2_1)

#ul태그의 자식 태그들중 style 속성이 그린으로 끝나는 컨텐트
uls <- html_nodes(text,"ul > [style$=green]")
html_text(uls)

#두번째 h2태그의 컨텐트
h2_2 <- html_nodes(text,"h2:nth-of-type(2)")
html_text(h2_2)

#<ol> 태그의 모든 자식 태그들의 컨텐츠 
ol_childs <- html_nodes(text,"ol > *")
html_text(ol_childs)

#<table> 태그의 모든 자손 태그들의 컨텐츠 
table_d <- html_nodes(text,"table *")
html_text(table_d)

#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
tr_c <- html_nodes(text,"tr.name")
html_text(tr_c)

#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
td_c <- html_nodes(text,"#target")
html_text(td_c)

#teacher ver.
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text
#<h1> 태그의 컨텐츠
html_text(html_nodes(text, "h1"))
# <a> 태그의 컨텐츠
html_text(html_nodes(text, "a"))
# <a> 태그의 href 속성값
html_attr(html_nodes(text, "a"), "href")
# <img> 태그의 src 속성값
html_attr(html_nodes(text, "img"), "src")
# 첫 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(1)"))
# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(text, "ul > [style$=green]")) #"ul > li[style$=green]"
#두 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(2)"))
#<ol> 태그의 모든 자식 태그들의 컨텐츠 
html_text(html_nodes(text, "ol > *"))
#<table> 태그의 모든 자손 태그들의 컨텐츠 
html_text(html_nodes(text, "table *"))
#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(text, "[class=name]")) #tr[class=name] , #"tr.name"
#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
html_text(html_nodes(text, "td#target")) # "td[id=target]"

