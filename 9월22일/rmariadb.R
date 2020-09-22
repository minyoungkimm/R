library(rJava)
library(RJDBC)
library(DBI)

drv <- JDBC(driverClass = 'org.mariadb.jdbc.Driver','mariadb-java-client-2.6.2.jar')
# JDBC URL
conn <- dbConnect(drv,'jdbc:mariadb://127.0.0.1:3306/work','scott','tiger')


#(1)
head(iris)

#(2)
names(iris) <- c('slength','swidth','plength','pwidth','species')
head(iris)

#(3)
dbWriteTable(conn, "iris",iris)

#(4)
iris_all <- dbGetQuery(conn, "select * from iris")
iris_all

#(5)
iris_setosa <- dbGetQuery(conn,"select * from iris where species = 'setosa'")
iris_setosa
  
#(6)
iris_versicolor <- dbGetQuery(conn,"select * from iris where species = 'versicolor'")
iris_versicolor

#(7)
iris_virginica <- dbGetQuery(conn,"select * from iris where species = 'virginica'")
iris_virginica


#(8)
productdb <- read.table("C:/Rexam/data/product_click.log")

#(9)
names(productdb) <- c("clicktime","pid")
str(productdb)

#(10)
dbWriteTable(conn,'productlog',productdb)

#(11)
p003 <- dbGetQuery(conn,"select * from productlog where pid = 'p003'")
p003


#(12)
emp <- read.csv("C:/Rexam/data/emp.csv")
str(emp)

#(13)
dbWriteTable(conn,'emp',emp)

#(14)
result1 <- dbGetQuery(conn,"select * from emp order by sal desc")
result1

#(15)
result2 <- dbGetQuery(conn,"select * from emp order by hiredate asc")
result2

#(16)
result3 <- dbGetQuery(conn,"select * from emp where sal >= 2000")
result3

#(17)
result4 <- dbGetQuery(conn,"select * from emp where sal >= 2000 and sal < 3000")
result4
