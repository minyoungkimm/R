library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url <- "https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2"
remDr$navigate(url)
Sys.sleep(3)
pageLink <- NULL
reple <- 0
curr_PageOldNum <- 0


repeat{
  doms <- remDr$findElements(using = "css selector", ".review_desc > p")
  Sys.sleep(1)
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  print(reple_v)
  un_v <- unlist(reple_v)
  if(reple[length(reple)] == un_v[length(un_v)]){
    break
  }
  reple <- append(reple, un_v)
  cat(length(reple), "\n")

  pageLink <- remDr$findElements(using='css','.review_ta.ng-scope > div.paginate > a.direction.next')
  remDr$executeScript("arguments[0].click();",pageLink)
}
cat(length(reple[-1]), "개의 댓글 추출\n")
write(reple[-1],"naverhotel.txt")

