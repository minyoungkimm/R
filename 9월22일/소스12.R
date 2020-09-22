dbWriteTable(conn,"book",data.frame(bookname=c("파이썬 정복","하둡 완벽 입문","R 프로그래밍"),
                                     price=c(25000,25000,28000)))
dbGetQuery(conn, "SELECT * FROM book")


dbWriteTable(conn, "mtcars", mtcars[1:5, ])
dbReadTable(conn, "mtcars")

dbWriteTable(conn, "mtcars", mtcars[6:10, ], append = TRUE)
dbReadTable(conn, "mtcars")

dbWriteTable(conn, "mtcars", mtcars[1:2, ], overwrite = TRUE)
dbReadTable(conn, "mtcars")



dbWriteTable(conn,"cars",head(cars,3))
dbGetQuery(conn, "SELECT * FROM cars")


# 데이터 수정
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(1,1)")
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(2,2)")
dbReadTable(conn,"cars")
dbSendUpdate(conn,"UPDATE CARS SET DIST=DIST*100 WHERE SPEED =1")
dbReadTable(conn,"cars")
dbSendUpdate(conn,"UPDATE CARS SET DIST=DIST*3 WHERE SPEED =1")
dbReadTable(conn,"cars")

# 테이블 삭제
dbRemoveTable(conn,"cars")