# 문제 1
v <- sample(1:26,10)
v

v_alphabet <- sapply(v,function(d) return(LETTERS[d]))
v_alphabet


# 문제 2
memo <- readLines('C:/Rexam/data/memo.txt',encoding="UTF-8")

memo[1] <- gsub("[[:punct:]]","",memo[1])
memo[2] <- gsub("[e]","E",memo[2])
memo[3] <- gsub("[[:digit:]]","",memo[3])
memo[4] <- gsub("[[:lower:][:upper:]]","",memo[4])
memo[5] <- gsub("[[:punct:][:digit:]]","",memo[5])
memo[6] <- gsub("[[:space:]]","",memo[6])
memo[7] <- gsub("([[:upper:]])",perl=TRUE,"\\L\\1",memo[7])
memo <- memo[1:7]

write(memo, file="memo_new.txt")
