# 데이터 전처리(2) - 날짜와 시간 관련 기능을 지원하는 함수들

(today <- Sys.Date())
format(today, "%Y년 %m월 %d일")
format(today, "%d일 %B %Y년")
format(today, "%y")
format(today, "%Y")
format(today, "%B")
format(today, "%a")
format(today, "%A")
weekdays(today) 
months(today) 
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.
Sys.Date()
Sys.time()
Sys.timezone()

as.Date('1/15/2018',format='%m/%d/%Y') # format 은 생략 가능
as.Date('4월 26, 2018',format='%B %d, %Y')
as.Date('11228',format='%d%b%y') # b는 월 앞에 0을 인식하지 않는다.
as.Date('110228',format='%d%m%y')


x1 <- "2019-01-10 13:30:41"
# 문자열을 날짜형으로
as.Date(x1, "%Y-%m-%d %H:%M:%S") 
# 문자열을 날짜+시간형으로
strptime(x1, "%Y-%m-%d %H:%M:%S")
strptime('2019-08-21 14:10:30', "%Y-%m-%d %H:%M:%S") #포맷을 필수로 입력해야한다.

x2 <- "20200601"
as.Date(x2, "%Y%m%d")
datetime<-strptime(x2, "%Y%m%d")
str(datetime)

#### 시간 차이만 계산 가능함 ###
# Date형은 시간 계산은 해주지 않는다
as.Date("2020/01/01 08:00:00") - as.Date("2020/01/01 05:00:00")
as.POSIXct("2020/01/01 08:00:00") - as.POSIXct("2020/01/01 05:00:00")
as.POSIXlt("2020/01/01 08:00:00") - as.POSIXlt("2020/01/01 05:00:00")

t<-Sys.time();str(t) #Sys.time은 POSIXct로 인식됨
ct<-as.POSIXct(t)
lt<-as.POSIXlt(t)
str(ct) 
str(lt) 
unclass(ct) # 1970-01-01부터 초시간이 얼마나 지났는지 알려줌 
unclass(lt) # 각각 지난 시간을 알려줌
lt$mon+1 # 월 정보는 1을 뺀 상태로 보관한다.
lt$hour
lt$wday
lt$year+1900
as.POSIXct(1449894438,origin="1970-01-01")
as.POSIXlt(1449894438,origin="1970-01-01")

# wday는 일요일이 0 이다
as.POSIXlt("2020/09/23")$wday
as.POSIXlt("2020/09/27")$wday
as.POSIXlt("2020/09/24")$wday
as.POSIXlt("2020/12/25")$wday
as.POSIXlt("2020/01/01")$wday


#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas2<-as.POSIXlt("2020-12-25")
weekdays(christmas2)
christmas2$wday
#2020년 1월 1일 어떤 요일
tmp<-as.POSIXct("2020-01-01")
weekdays(tmp)
#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
year<-format(tmp,'%Y')
month<-format(tmp,'%m')
day<-format(tmp,'%d')
weekday<-format(tmp,'%A')
paste("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday," 입니다.",sep="")

format(tmp,'오늘은 %Y년 %B %d일 %A입니다')

# 데이터 전처리(3) - 문자열 처리 관련 주요 함수들 

x <- "We have a dream"
nchar(x)
length(x)

y <- c("We", "have", "a", "dream")
length(y)
nchar(y)

letters
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says)
toupper(fox.says)

substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", 6, 14)
substring("Data Analytics", 6)

classname <- c("Data Analytics", "Data Mining", 
               "Data Visualization")
substr(classname, 1, 4)

countries <- c("Korea, KR", "United States, US", 
               "China, CN")
# 맨 뒤의 두개의 문자만 추출
substr(countries, nchar(countries)-1, nchar(countries))


head(islands)
landmesses <- names(islands)
landmesses
grep(pattern="New", x=landmesses) # 해당 인덱스를 추출

index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T) # 해당 원소값을 추출


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt)
gsub(pattern="Data", replacement="Business", x=txt)

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
gsub(".csv", "", x)

gsub("[ABC]","@","123AunicoBC98ABC")
gsub("ABC","@","123AunicoBC98ABC")
gsub("(AB)|C","@","123AunicoBC98ABC")
gsub("A|(BC)","@","123AunicoBC98ABC")
gsub("A|B|C","@","123AunicoBC98ABC")

words <- c("ct", "at", "bat", "chick", "chae", "cat", 
           "cheanomeles", "chase", "chasse", "mychasse", 
           "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T)
grep("at", words, value=T)
grep("[ch]", words, value=T) # c 또는 h
grep("[at]", words, value=T)
grep("ch|at", words, value=T) # ch 또는 at (괄호 사용해도됨)
grep("ch(e|i)ck", words, value=T)
grep("chase", words, value=T)
grep("chas?e", words, value=T) # ? : 0개 또는 1개 일때 추출
grep("chas*e", words, value=T) # * : 0개 이상
grep("chas+e", words, value=T) # + : 1개 이상
grep("ch(a*|e*)se", words, value=T)
grep("^c", words, value=T) # 단어 앞에 ^붙으면 그 문자로 시작하는 단어 추출
grep("t$", words, value=T) # $ : 앞에 붙은 문자로 끝나는 단어 추출
grep("^c.*t$", words, value=T) # c로 시작하면서 t로 끝나는 문자(.은 임의의 문자가 0개 이상)

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE)
grep("[[:alpha:]]", words2, value=TRUE)
grep("[[:digit:]]", words2, value=TRUE)
grep("[[:punct:]]", words2, value=TRUE)
grep("[[:space:]]", words2, value=TRUE)
grep("\\w", words2, value=TRUE)
grep("\\d", words2, value=TRUE);grep("\\D", words2, value=TRUE)
grep("\\s", words2, value=TRUE)



fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ") # LIST로 리턴함
strsplit(x= fox.said, split="")

fox.said.words <- unlist(strsplit(fox.said, " "))
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]] 
strsplit(littleprince, " ")[[3]][5]
