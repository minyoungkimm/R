# 문제1
grade <- sample(1:6,1)
if(grade <= 3){
  cat(grade,"학년은 저학년입니다.")
}else{
  cat(grade,"학년은 고학년입니다.")
}


# 문제2
choice <- sample(1:5,1)
result <- 0
if(choice == 1){
  result <- 300 + 50
}else if(choice == 2){
  result <- 300 - 50
}else if(choice == 3){
  result <- 300 * 50
}else if(choice == 4){
  result <- 300 / 50
}else if(choice == 5){
  result <- 300 %% 50
}
choice
cat("결과값 :",result)


# 문제3
count <- sample(3:10,1)
deco <- sample(1:3,1)
count;deco
if(deco == 1){
  for(n in 1:count){
    cat("*")
  }
}else if(deco == 2){
  for(n in 1:count){
    cat("$")
  }
}else if(deco == 3){
  for(n in 1:count){
    cat("#")
  }
}

#if(deco == 1){
#  cat(rep("*",times=count),"\n")
#}


# 문제4
score <- sample(1:100,1)
scale <- 0
if(score >= 90){
  scale <- 1
}else if(score >= 80){
  scale <- 2
}else if(score >= 70){
  scale <- 3
}else if(score >= 60){
  scale <- 4
}else{
  scale <- 5
}
level <- switch(EXPR = scale,"A 등급","B 등급",
       "C 등급","D 등급","F 등급")
score
cat(score,"점은 ",level,"입니다.",sep="")


# 문제5
alpha <- vector()
for(n in 1:length(letters)){
  low <- letters[n]
  up <- LETTERS[n]
  v <- paste(up,low,sep="")
  alpha <- c(alpha,v)
}
print(alpha)
