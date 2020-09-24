library(showtext)
showtext_auto()
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

library(rJava)
library(RJDBC)
library(DBI)

drv <- JDBC(driverClass = 'org.mariadb.jdbc.Driver','mariadb-java-client-2.6.2.jar')
conn <- dbConnect(drv,'jdbc:mariadb://127.0.0.1:3306/work','scott','tiger')

productlog <- "select * from productlog"
productlog <- dbGetQuery(conn,productlog)
# dbReadTable(conn,'productlog') 도 가능함
head(productlog)

# 문제1
table(productlog$pid)
png("clicklog1.png", 700, 400)
barplot(table(productlog$pid), main="세로바 그래프 실습", 
        xlab="상품ID", ylab="클릭수",  col=terrain.colors(10))

dev.off()


# 문제2
par(mar=c(2,2,2,2), mfrow=c(1,1))

time <- productlog$clicktime
#time_class <- substr(time, nchar(time)-3, nchar(time)-2)
#table(time_class)
t <- as.character(time)
tt <- strptime(t, "%Y%m%d%H%M")  # 시간으로 변환
hour <- format(tt,"%H")  # 시간만 추출
labels <- names(table(hour))  # 빈도 확인하고, 변수명 추출
l_first <- NULL

#  0으로 시작하는 시간 수정
for(v in labels){
  if(substr(v,1,1)=="0"){
    m <- substr(v,2,2)
  }else{
    m <- v
  }
  l_first <- c(l_first,m) # 시간 하한 범위
}

# 시간 상한 범위
l_last <- as.character(as.numeric(l_first)+1)

# 사진으로 저장
png("clicklog2.png", 500, 500)
pie(table(hour), labels=paste(l_first,"~",l_last), cex=1,
    main="파이그래프 실습", col=rainbow(17))

dev.off()


# 문제3
score <- read.table("data/성적.txt", header=TRUE)
score

png("clicklog3.png", 500, 500)
par(mar=c(4,4,4,4), mfrow=c(1,1))
score2 <- score[,3:5]
boxplot(score2, axes=F,col=rainbow(3))
axis(1, at=1:3, lab=names(score2), family="maple")
axis(2, at=seq(2,10),family="maple")
title("과목별 성적 분포", family="maple", cex.main=1.3,col.main="orange")
box()
dev.off()
