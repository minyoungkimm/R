# 문제1
str(iris)


# 문제2
x <- seq(1,5)
y <- seq(2,10,2)
df1 <- data.frame(x,y)
df1


# 문제3
df2 <- data.frame(col1 = seq(1,5),
                  col2 = letters[1:5],
                  col3 = seq(6,10))
df2


# 문제4
df3 <- data.frame(제품명 = c('사과','딸기','수박'),
                    가격 = c(1800,1500,3000),
                  판매량 = c(24,38,13))
df3


# 문제5
mean(df3$가격)
mean(df3$판매량)


# 문제6
name <- c('Potter','Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math)
df4
# (a)
stat <- c(76, 73, 95, 82, 35)
df4 <- data.frame(df4,stat)
df4
# (b)
df4$score <- df4$math + df4$stat
# (c)
df4$grade <- ifelse(df4$score >= 150,'A',
                ifelse(df4$score >= 100,'B',
                       ifelse(df4$score >= 70,'C','D')))
df4


# 문제7
emp <- read.csv("data/emp.csv")
str(emp)


# 문제8
emp[3:5,]
emp[c(3,4,5),]


# 문제9
emp[,-4]


# 문제10
emp$ename
emp[,"ename"] 
emp[,2, drop=FALSE] 
emp[,"ename",drop=F] 
emp[2]
emp["ename"]


# 문제11
emp[,c("ename","sal")]
subset(emp,select = c(ename, sal))


# 문제12
emp[emp$job=="SALESMAN",c("ename","sal","job")]
subset(emp,select=,c("ename","sal","job"),subset=emp$job=="SALESMAN")
subset(emp,emp$job=="SALESMAN",c("ename","sal","job")) 


# 문제13
emp[emp$sal>=1000 & emp$sal <=3000, c("ename","sal","deptno")]
subset(emp, select=c("ename","sal","deptno"), subset=(sal>=1000 & sal<=3000))
subset(emp, emp$sal>=1000 & emp$sal<=3000, c("ename","sal","deptno"))

# 문제14
emp[emp$job!="ANALYST",c("ename","sal","job")]
subset(emp,select=,c("ename","sal","job"),subset=emp$job!="ANALYST")
subset(emp,emp$job!="ANALYST",c("ename","sal","job")) 


# 문제15
emp[emp$job=="SALESMAN"|emp$job=="ANALYST",c("ename","sal")]
subset(emp,select=,c("ename","sal"),subset=(emp$job=="SALESMAN"|emp$job=="ANALYST"))
subset(emp,emp$job=="SALESMAN"|emp$job=="ANALYST",c("ename","sal")) 


# 문제16
emp[is.na(emp$comm),c("ename","sal")]
subset(emp,is.na(emp$comm),c("ename","sal")) 


# 문제17
emp[order(emp$sal),]


# 문제18
dim(emp)
str(emp)

