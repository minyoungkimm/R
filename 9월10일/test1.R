# 문제8
getwd()
test1 <- scan("data/iotest1.txt")
test1
cat("오름차순 :",sort(test1),"\n")
cat("내림차순 :",sort(test1,decreasing = T),"\n")
cat("합 :",sum(test1),"\n")
cat("평균 :",mean(test1),"\n")