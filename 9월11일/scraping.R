library(rvest)
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text

# <h1> 태그의 컨텐츠
node1 <- html_nodes(text, "h1")
node1
title <- html_text(node1,trim=T)
title


# <a> 태그의 컨텐츠와 href속성값
node2 <- html_nodes(text,"a")
node2
html_text(node2,trim=T)
html_attr(node2,"href")



# <img> 태그의 src 속성값
node3 <- html_nodes(text,"img")
node3
html_attr(node3,"src")



# 첫 번째 <h2> 태그의 컨텐츠
node4 <- html_nodes(text,"h2:nth-of-type(1)")
node4
html_text(node4)



# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(text,"ul > [style$=green]"))



# 두 번째 <h2> 태그의 컨텐츠
node6 <- html_nodes(text,"h2:nth-of-type(2)")
node6
html_text(node6)


# <ol> 태그의 모든 자식 태그들의 컨텐츠 
node7 <- html_nodes(text,"ol > *")
node7
html_text(node7)


# <table> 태그의 모든 자손 태그들의 컨텐츠 
html_text(html_nodes(text,"table *"))


# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
node9 <- html_nodes(text,"tr.name")
node9
html_text(node9)


# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
node10 <- html_nodes(text,"td#target")
node10
html_text(node10)
