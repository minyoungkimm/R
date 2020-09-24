library(dplyr)
library(rJava)
library(RJDBC)
library(DBI)

drv <- JDBC(driverClass = 'org.mariadb.jdbc.Driver','mariadb-java-client-2.6.2.jar')
conn <- dbConnect(drv,'jdbc:mariadb://127.0.0.1:3306/work','scott','tiger')


emp <- dbReadTable(conn,'emp')
head(emp)

# 문제0
emp$comm <- ifelse(emp$comm < 0, NA, emp$comm)

# 문제1
emp %>% filter(job == "MANAGER")

# 문제2
emp %>% select(empno,ename,sal)

# 문제3
emp %>% select(-empno)

# 문제4
emp %>% select(ename,sal)

# 문제5
emp %>% 
  group_by(job) %>% 
  summarise(n=n())

# 문제6
emp %>% 
  filter(sal >= 1000 & sal <= 3000) %>% 
  select(ename,sal,deptno)

# 문제7
emp %>%
  filter(job != "ANALYST") %>% 
  select(ename,job,sal)

# 문제8
emp %>% 
  filter(job == "SALESMAN" | job == "ANALYST") %>% 
  select(ename,job)

# 문제9
emp %>% 
  group_by(deptno) %>% 
  summarise(sal_sum=sum(sal))


# 문제10
emp %>% arrange(sal)

# 문제11
emp %>% arrange(desc(sal)) %>% head(1)

# 문제12
empnew <- emp %>% rename("salary"="sal","commrate"="comm")

# 문제13
emp %>% 
  group_by(deptno) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(1)

# 문제14
emp %>% 
  mutate(enamelength = nchar(ename)) %>% 
  arrange(enamelength)


# 문제15
emp %>% 
  filter(comm != "NA") %>% 
  summarise(comm_count=n())
