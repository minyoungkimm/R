# 문제9
test2 <- scan("data/iotest2.txt",what="")
test2 <- factor(test2)
test2
table(test2)
word_mode <- names(which.max(table(test2)))
cat("가장 많이 등장한 단어는",word_mode,"입니다.")

