library(rvest)

site <- "https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen&page="
page <- NULL;movie.review <- NULL
for(i in 1:5){
  url <- paste(site, i, sep="")
  text <- read_html(url)
  # 영화평점
  node <- html_nodes(text, ".raking_grade em")
  point <- html_text(node)
  # 영화리뷰 
  node <- html_nodes(text, ".desc_review")
  imsi <- html_text(node, trim=TRUE)
  review <- imsi[nchar(imsi) > 0] 
  if(length(review) == 10){
  page <- data.frame(point, review)
  movie.review <- rbind(movie.review, page)
  }
}

movie.review
write.csv(movie.review, "daummovie2.csv")



