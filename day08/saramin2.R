saramin_url <- read_html("http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST")

#tech_name구하기
tech_name <- html_nodes(saramin_url,"[for^=check_] > span.txt")
tech_name <- html_text(tech_name)
tech_name <- gsub("#","",tech_name)

#info_count구하기
info_count <- html_nodes(saramin_url,"[for^=check_] > span.count")
info_count <- html_text(info_count)
info_count <- gsub("[()]","",info_count)
info_count

#두 개 합쳐서 데이터프레임 만들기
data_scientist <- data.frame(tech_name,info_count)
data_scientist

#저장
write.csv(data_scientist, "saramin.csv")
