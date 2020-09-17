library(rvest)

url <- "https://movie.daum.net/moviedb/grade?movieId=131576"
text <- read_html(url)
text



# 영화평점
node <- html_nodes(text, ".raking_grade em")
point <- html_text(node)
# 영화리뷰 
node <- html_nodes(text, ".desc_review")
#node <- html_nodes(text, xpath="//*[@id='mArticle']/div[2]/div[2]/div[1]/ul/li/div/p")
review <- html_text(node, trim=TRUE)

page <- data.frame(point,review)
write.csv(page, "daummovie1.csv")

