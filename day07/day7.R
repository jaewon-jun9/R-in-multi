install.packages("rvest")
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text

nodes <- html_nodes(text,"div")
nodes
title <- html_text(nodes)
title

node1 <- html_nodes(text,"div:nth-of-type(1)")
node1
html_text(node1)
html_attr(node1,"style")

node1 <- html_nodes(text,"div:nth-of-type(2)")
node1
html_text(node1)
html_attr(node1,"style")


url <- "https://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url)
a <- html_nodes(text, "#old_content > table > tbody > tr:nth-child(1) > td.title > a.movie")
html_text(a)

b <- html_nodes(text, "#old_content > table > tbody > tr > td.title > a.movie")
html_text(b)

-------------------------------------------------------------------------

url <- "https://movie.naver.com/movie/point/af/list.nhn"
text <- read_html(url, encoding = "CP949")
text

#영화제목
nodes <- html_nodes(text,".movie")
title <- html_text(nodes)
title

#영화리뷰
nodes <- html_nodes(text,".title")
review <- html_text(nodes, trim = TRUE)
review
review <- gsub("\t","",review)
review <- gsub("\r\n","",review)
review <- gsub("\n","",review)
review <- gsub("신고","",review)
review

page <- data.frame(title, review)
write.csv(page, "movie_reviews.csv")

#--------------------------------------------------------------------

#여러페이지
site <- "https://movie.naver.com/movie/point/af/list.nhn?page="
movie.review <- NULL
for (i in 1:100){
  url <- paste(site,i,sep = "")
  text <- read_html(url, encoding = "CP949")
#영화제목
  nodes <- html_nodes(text,".movie")
  title <- html_text(nodes)
#영화리뷰
  nodes <- html_nodes(text,".title")
  review <- html_text(nodes,trim = TRUE)
  review
  review <- gsub("\t","",review)
  review <- gsub("\r\n","",review)
  review <- gsub("\n","",review)
  review <- gsub("신고","",review)
  page <- data.frame(title, review)
  movie.review <- rbind(movie.review, page)
}
write.csv(movie.review, "movie_reviews3.csv")

