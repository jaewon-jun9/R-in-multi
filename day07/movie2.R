url <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
d_movies <- NULL
for (i in 1:20){
  site <- paste(url,i,sep="")
  text <- read_html(site, encoding = "utf-8")
  nodes <- html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
  score <- html_text(nodes)
  nodes <- html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p")
  review <- html_text(nodes)
  review <- gsub("\n","",review)
  review <- gsub(" ","",review)
  d_pages <- data.frame(score,review)
  d_movies <- rbind(d_movies, d_pages)
}
write.csv(d_movies, "daummovie2.csv")
