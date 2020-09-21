library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url <- "http://gs25.gsretail.com/gscvs/ko/products/event-goods"
remDr$navigate(url)

twotoone <- remDr$findElements(using='css', '#TWO_TO_ONE')
remDr$executeScript("arguments[0].click();",twotoone)

goodsname <- NULL;goodsprice <- NULL;PageOldNum <- 1

repeat{
  # 상품명
  dom_name <- remDr$findElements(using = "css", "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit")
  Sys.sleep(1)
  name <- sapply(dom_name, function (x) {x$getElementText()})
  print(name)
  name <- unlist(name)
  goodsname <- append(goodsname, name)
  cat(length(goodsname), "\n")
  # 상품 가격
  dom_price <- remDr$findElements(using = "css", "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span")
  Sys.sleep(1)
  price <- sapply(dom_price, function (x) {x$getElementText()})
  price <- gsub("[^0-9]", "", price)
  print(price)
  goodsprice <- append(goodsprice, price)
  cat(length(goodsprice), "\n")
  
  pageLink <- remDr$findElements(using='css','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next')
  remDr$executeScript("arguments[0].click();",pageLink)
  Sys.sleep(1)
  curr_PageElem <- remDr$findElement(using='css','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a.on')
  PageNewNum <- as.numeric(curr_PageElem$getElementText())
  if(PageNewNum == PageOldNum)  {
    cat("종료\n")
    break; 
  }
  PageOldNum <- PageNewNum
}

df <- data.frame(goodsname, goodsprice)
write.csv(df, file='gs25_twotoone.csv')
