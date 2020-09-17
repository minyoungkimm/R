library(rvest)

text <- NULL;comicName <- NULL; comicSummary <- NULL;
comicGrade <- NULL;comic.info <- NULL; check <- 1
site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="

i <- 1
while(TRUE){
  url <- paste(site, i, sep="")
  text <- read_html(url)
  
  # 제목
  nodes <- html_nodes(text, ".challengeInfo > h6 > a")
  comicName <- html_text(nodes, trim=TRUE)
  comicName
  
  if(check[length(check)] == comicName[length(comicName)]){
    break
  }
  check <- c(check,comicName)

  
  # 내용요약
  nodes <- html_nodes(text, ".summary")
  comicSummary <- html_text(nodes, trim=TRUE)
  comicSummary
  
  # 평점
  nodes <- html_nodes(text,".challengeInfo > .rating_type > strong")
  comicGrade <- html_text(nodes)
  comicGrade
  
  page <- data.frame(comicName,comicSummary,comicGrade)
  comic.info <- rbind(comic.info, page)
  i <- i + 1
}
comic.info
write.csv(comic.info, "navercomic.csv")
