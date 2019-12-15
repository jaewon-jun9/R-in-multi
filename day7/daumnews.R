url <- "https://media.daum.net/ranking/popular/"
text <- read_html(url, encoding = "utf-8")
nodes <- html_nodes(text,"#mArticle div.cont_thumb > strong > a")
newstitle <- html_text(nodes)

nodes2 <- html_nodes(text,"#mArticle div.cont_thumb > strong > span")
newspapername <- html_text(nodes2)

daumnews <- data.frame(newstitle,newspapername)

write.csv(daumnews,"daumnews.csv")