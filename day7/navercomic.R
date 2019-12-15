url <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
navercomic <- NULL
i <- 0
repeat{
  i <- i + 1
  site <- paste0(url,i)
  text <- read_html(site, encoding = "utf-8")
  node1 <- html_nodes(text,"#content  h6 > a")
  comicName <- html_text(node1,trim=T)
  comicName <- gsub("\r\n","",comicName)
  comicName <- gsub(" ","",comicName)
  node2 <- html_nodes(text,"#content div.challengeInfo > div.summary")
  comicSummary <- html_text(node2)
  node3 <- html_nodes(text,"#content div.challengeInfo > div.rating_type > strong")
  comicGrade <- html_text(node3)
  all_df <- data.frame(comicName,comicSummary,comicGrade)
  navercomic <- rbind(navercomic,all_df)
  if (length(comicName)<24)
    break;
}
write.csv(navercomic,"navercomic.csv")






#rm(page_num)


#base_url = "https://comic.naver.com/genre/bestChallenge.nhn?&page="

#results = NULL

#i = 1

#while (i) {

#  url = paste0(base_url, i)
#  html = read_html(url, encoding = "UTF-8")
#  
#  title_nodes = html_nodes(html, 'h6 > a')
#  title = html_text(title_nodes, trim = T)
#  title = gsub("\r\n", "", title)
#  
#  summary_nodes = html_nodes(html, ".summary")
#  summary = html_text(summary_nodes, trim = T)
  
#  star_nodes = html_nodes(html, ".rating_type > strong")
#  star = html_text(star_nodes)
  
#  page = data.frame(comicName = title, comicSummary = summary, comicGrade = star)
#  results = rbind(results, page)
  
# page_num_nodes = html_nodes(html, ".page")
# page_num = html_text(page_num_nodes)
# page_num = gsub(" 현재 페이지", "", page_num)
  
#if (i < as.numeric(tail(page_num,1))){
 # i = i + 1
#  }else{
 #   break
#  }
#}


# write.csv(results, "navercomic5.csv")









