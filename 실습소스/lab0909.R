# 실습 1
# 문제1
v1 <- 1:10
v2 <- v1*2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]
v1;v2;v3;max_v;min_v;avg_v;sum_v

# 문제2
v4 <- seq(1,10,2)
v5 <- rep(1,5)
v6 <- rep(1:3,3)
v7 <- rep(1:3,each=2)
v4;v5;v6;v7

# 문제3
nums <- sample(1:100,10,replace=F)
(sort(nums))
(sort(nums, decreasing = T))
nums[nums > 50]
which(nums <= 50)
which.max(nums)
which.min(nums)

# 문제4
v8 <- seq(1,10,3)
names(v8) <- LETTERS[1:4]
names(v8);v8

# 문제5
score <- sample(1:20,5,replace=F)
myFriend <- c('둘리','또치','도우너','희동','듀크')
paste(score, myFriend, sep="-")
myFriend[which.max(score)]
myFriend[which.min(score)]
myFriend[which(score > 10)]

# 문제6
count <- sample(1:100,7,replace=F)
week.korname <- c('일요일','월요일','화요일','수요일','목요일','금요일','토요일')
paste(week.korname, count, sep=":", collapse=" ")
paste(week.korname, count, sep=":")
week.korname[which.max(count)]
week.korname[which.min(count)]
week.korname[which(count > 50)]


# 실습 2

# 문제 1

seq(10, 38, 2)

m1 <- matrix(seq(10, 38, 2), nrow = 3, byrow=T)
m2 <- m1 + 100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1, 1, max)
col_max <- apply(m1, 2, max)

print(m1)
print(m2)
print(m_max_v)
print(m_min_v)
print(row_max)
print(col_max)

# 문제 2

n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)
num <- c(n1,n2,n3)
mat2 <- cbind(n1,n2,n3) 
matrix(num, nrow = 3)

# 문제 3

m3 <- matrix(1:9, nrow = 3, byrow=T)


# 문제 4

m4 <- m3  
colnames(m4) <- c("col1","col2","col3")
rownames(m4) <- c("row1","row2","row3")


# 문제 5

alpha <- matrix(letters[1:6], nrow = 2)
alpha2 <- rbind(alpha, letters[24:26])
alpha3 <- cbind(alpha, letters[c(19,16)])

# 문제6
a <- array(1:24, dim=c(2,3,4))
a[2,3,4]     # (1) 2행3열4층
a[2,,]       # (2) 각 층마다 2행의 데이터 
a[,1,]       # (3) 각 층마다 1열의 데이터
a[,,3]       # (4) 3층의 모든 데이터
a + 100      # (5) a라는 배열을 구성하는 모든 데이터에 100을 + 연산하여 출력
a[,,4] * 100 # (6) 4층의 모든 데이터들에 100을 곱한 결과를 출력
a[1,-1,]; a[1,c(2,3),]     # (7) 각층의 1행, 2열과3열만 출력
a[2,,2] <- a[2,,2]+ 100      # (8) 2층의 2행 데이터들의 값을 100을 더한 값으로 변경
a[,,1] <- a[,,1] - 2         # (9) 1층의 모든 데이터들의 값에 2를 뺀 값으로 변경
a <- a * 10  # (10) a 배열의 모든 데이터 값들을 10을 곱한 값으로 변경
rm(a)

# 실습 3
#문제1
iris
str(iris) # 데이터프레임 구조 확인


#문제2
df1 <- data.frame(x=c(1,2,3,4,5), y=seq(2,10,2)); df1


#문제3
col1 <- c(1,2,3,4,5) # 1:5
col2 <- letters[1:5]
col3 <- c(6,7,8,9,10)
df2 <- data.frame(col1, col2, col3); df2


#문제4
제품명 <- c("사과", "딸기", "수박")
가격 <- c(1800, 1500, 3000)
판매량 <- c(24, 38, 13)
df3 <- data.frame(제품명, 가격, 판매량)
str(df3)


#문제5
mean(df3$가격) # 과일 가격 평균
mean(df3$판매량) # 과일 판매량 평균


#문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math); df4; str(df4)

df4$stat <- c(76, 73, 95, 82, 35); df4 #파생변수
df4$score <- df4$math + df4$stat; df4
df4$grade <- ifelse(df4$score>=150, "A",
                    ifelse(df4$score>=100, "B",
                           ifelse(df4$score>=70, "C", "D")))
df4;


#문제7
getwd()
emp <- read.csv("data/emp.csv"); str(emp)


#문제8
emp[c(3,4,5),] # 3,4,5 행만 출력
emp[3:5,]
emp[seq(3,5),]


#문제9 
emp[-4] # 4번열 제외


#문제10
emp$ename # ename열만 출력
emp[2]
emp["ename"]

emp[,2]
emp[,2, drop=F]
emp[,"ename"]
emp[,"ename", drop=F]


#문제11
emp[, c("ename", "sal")]
subset(emp, select=c("ename", "sal"))
subset(emp, select=c(ename, sal))


#문제12
emp
subset(emp, subset=(job=="SALESMAN"), select=c("ename", "sal", "job"))


#문제13
emp
subset(emp, subset=(emp$sal>=1000 & emp$sal<=3000), select=(c("ename", "sal", "deptno")))


#문제14
emp
emp[emp$job != "ANALYST", c("ename", "job", "sal")]


#문제15
emp
emp[emp$job == "SALESMAN" | emp$job == "ANALYST", c("ename", "job")]


#문제16
emp
emp[is.na(emp$comm), c("ename", "sal")]


#문제 17
emp[order(emp$sal),] # 데이터프레임에서는 sort대신 order(인덱스)
a <- emp[order(emp$sal),]
tail(emp[order(emp$sal),], 1)
emp[which.max(emp$sal),]
#문제 18
dim(emp)
?subset

# 실습 4

#문제1
L1 <- list(
  name = "scott",
  sal = 3000
)
print(L1)

result1 <- L1[["sal"]]*2; result1
result1 <- L1[[2]]*2; result1


#문제2
L2 <- list("scott", c(100,200,300)); L2


#문제3
L3 <- list(c(3,5,7), c("A","B","C")); L3
L3[[2]][1] <- "Alpha"; L3


#문제4
L4 <- list(
  alpha = 0:4,
  beta = sqrt(1:5),
  gamma = log(1:5)
)
print(L4)

L4[1] + 10 # 리스트로 담아와서 연산 불가
L4[[1]] + 10 # L4[["alpha"]] + 10 L4$alpha + 10
L4[[2]] + 10
L4[[3]] + 10


#문제5
L5 <- list(
  data1 = LETTERS,
  data2 = head(read.csv("data/emp.csv"), n=3),
  data3 = L4
)
print(L5)

L5[["data1"]][1] # "A"
L5[["data2"]]$ename # "SMITH" "ALLEN" "WARD"
L5$data2$ename
L5[["data3"]][[3]] # 리스트가 아닌 벡터로 반환
L5$data3$gamma

#문제6
L6 <- list(
  math = list(95,90),
  writing = list(90,85),
  reading = list(85,80)
)
print(L6)

midterm_avg <- sum(unlist(L6)[c(1,3,5)]) / length(L6) # 중간고사 평균
finals_avg <- sum(unlist(L6)[c(2,4,6)]) / length(L6) # 기말고사 평균
semester_avg <- (midterm_avg + finals_avg) / 2 # 전체 평균
midterm_avg; finals_avg; semester_avg


L6 <- list(
  math = list(95, 90),
  writing = list(90, 85),
  reading = list(85, 80)
)

print(sum(unlist(L6))/length(unlist(L6)))
print(mean(unlist(L6)))

# 실습 5

# 문제1
grade <- sample(1:6, 1)
if(grade >= 1 & grade <= 3){
  cat(grade, "학년은 저학년입니다.")
}else{
  cat(grade, "학년은 고학년입니다.")
}


if(grade >= 1 && grade <= 3){
  cat(grade, "학년은 저학년입니다.")
}else{
  cat(grade, "학년은 고학년입니다.")
}

# 문제2

choice <- sample(1:5,1)
x1 <- 300
y1 <- 50
myresult <- 0
if (choice == 1){
  myresult <- x1+y1
}else if (choice == 2){
  myresult <- x1-y1
}else if (choice == 3){
  myresult <- x1*y1
}else if (choice == 4){
  myresult <- x1/y1
}else if (choice == 5){
  myresult <- x1%%y1
}
cat('결과값:',myresult)


(choice <- sample(1:5, 1))

result <- switch(EXPR=choice,
                 300+50,300-50,300*50,300/50,300%%50)
cat("결과값 :", result, sep="")


result <- switch(EXPR=choice,
                 "1"=300+50,"2"=300-50,"3"=300*50,"4"=300/50,"5"=300%%50)
cat("결과값 :", result, sep="")


result <- switch(EXPR=as.character(choice),
                 "1"=300+50,"2"=300-50,"3"=300*50,"4"=300/50,"5"=300%%50)
cat("결과값 :", result, sep="")


# 문제3
count <- sample(3:10, 1)
deco <- sample(1:3, 1)
count; deco

for(num in 1:count){
  if(deco==1){
    cat("*", sep="")
  }else if(deco==2){
    cat("$", sep="")
  }else{
    cat("#", sep="")
  }
}

count <- sample(3:10, 1)
deco <- sample(1:3, 1)

if (deco == 1) {
  cat(rep('*',times=count),"\n")
}else if (deco == 2){
  cat(rep('$',times=count),"\n")
}else if (deco == 3){
  cat(rep('#',times=count),"\n")
}


# 문제4
score <- sample(0:100, 1)

if (score>=90 && score<=100){
  score_range <- 1
}else if(score>=80){
  score_range <- 2
}else if(score>=70){
  score_range <- 3
}else if(score>=60){
  score_range <- 4
}else{
  score_range <- 5
}

result <- switch(EXPR=as.character(score_range),
                 "1"="A", "2"="B", "3"="C", "4"="D", "5"="F")
cat(score, "점은", result, "등급입니다.")

result <- switch(EXPR=score_range,
                 "A", "B", "C", "D", "F")
cat(score, "점은", result, "등급입니다.")


score <- sample(0:100, 1)
temp <- score %/% 10
temp <- as.character(temp) 
cat(score,"점은", switch(EXPR = temp, 
                "10"=, "9"="A" ,"8"="B","7"="C","6"="D","F"),"등급 입니다.","\n")

score <- as.character(sample(0:100, 1))
level <- switch(EXPR=score,
                "100"=,"99"=,"98"=,"97"=,"96"=,"95"=,"94"=,"93"=,"92"=,"91"=,"90"="A",
                "89"=,"88"=,"87"=,"86"=,"85"=,"84"=,"83"=,"82"=,"81"=,"80"="B",
                "79"=,"78"=,"77"=,"76"=,"75"=,"74"=,"73"=,"72"=,"71"=,"70"="C",
                "69"=,"68"=,"67"=,"66"=,"65"=,"64"=,"63"=,"62"=,"61"=,"60"="D",
                "F")
cat(score, "점은", level, "등급입니다.")



# 문제5
alpha <- vector()

for(num in 1:26){
  alpha[num] <- paste(LETTERS[num],letters[num], sep="")
}
alpha

x <- LETTERS
y <- letters
print(paste(x,y,sep=""))


for(nums in 1:26){
  alpha = paste(LETTERS[nums],letters[nums],sep="")
  cat('"',alpha, '" ', sep="")
}

paste(LETTERS, letters, sep="")


