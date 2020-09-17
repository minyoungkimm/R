library(rvest)
text <- NULL; title <- NULL; name <- NULL; page <- NULL

url <- "http://media.daum.net/ranking/popular/"
text <- read_html(url)
text

# 뉴스제목
nodes <- html_nodes(text, ".rank_news>ul>li>.cont_thumb>strong>a")
newstitle <- html_text(nodes)
#newstitle

# 신문사
nodes <- html_nodes(text, ".cont_thumb>strong>span")
newspapername <- html_text(nodes)
#newpapername

page <- data.frame(newstitle, newspapername)
write.csv(page, "daumnews.csv")


