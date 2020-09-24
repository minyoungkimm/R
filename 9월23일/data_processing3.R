# 문제1
BD <- as.POSIXlt("1996-02-07")
BD_W <- weekdays(BD)
paste(BD_W,'에 태어난 민영',sep='')


# 문제2
time <- Sys.Date()
year <- format(time,'%Y')
month <- format(time,'%m')
day <- format(time,'%d')
day_diff <- as.Date("2020/09/23") - as.Date("1996/02/07")

paste("오늘은 ",year,"년 ",month,"월 ",day,"일 이고 내가 태어난지 ",day_diff,"일째 되는 날입니다.",sep="")


# 문제3
time <- Sys.time()
format(time, "%Y년 %m월 %d일 %H시 %M분 %S초")


# 문제4
date <- data.frame(datetime=c('12/25/2020 23:59:59', '1/25/2021 23:59:59', '2/25/2021 23:59:59'))
date$datetime <- strptime(date$datetime,"%m/%d/%Y %H:%M:%S")
str(date)


# 문제5
d1 <- unclass(as.Date("2020-06-01"))
x1 <- seq(d1, d1 + 6)
x2 <- as.Date(x1,origin="1970-01-01")
format(x2,"%a-%m%d")


# 문제6
v1 <- c('Happy', 'Birthday', 'to', 'You')
length(v1) + sum(nchar(v1))


# 문제7
v2 <- paste(v1,collapse = " ")
length(v2) + nchar(v2)


# 문제8
alnum1 <- paste(LETTERS[1:10],1:10)
alnum1
alnum2 <- paste(LETTERS[1:10],1:10,sep="")
alnum2


# 문제9
txt <- "Good Morning"
txt_v <- unlist(strsplit(x= txt, split= " "))
txt_l <- list(txt_v[1],txt_v[2])
txt_l


# 문제10
kfpanda <-c("Yesterday is history, tommrrow is a mystery, today is a gift!", 
        "That's why we call it the present - from kung fu Panda")

kfpanda_sub <- gsub(",|-","",x10)
kfpanda_split <- unlist(strsplit(x = kfpanda_sub,split = " "))
kfpanda_split


# 문제11
ssn <- c("941215-1234567", "850605-2345678", "760830-1357913")
list <- unlist(strsplit(x = ssn, split = "-"))
b_list <- list[seq(1,length(list),2)]
replace_ssn <- paste(b_list,"*******",sep="-")
replace_ssn


# 문제12
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
#(1)
r1 <- gsub("[ㄱ-힣]","",s1)
#(2)
r2 <- gsub("[[:punct:]]","",s1)
#(3)
r3 <- gsub("[[:punct:]ㄱ-힣]","",s1)
#(4)
r4 <- gsub("100","백",s1)
