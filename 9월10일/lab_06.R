# 문제1
exam1 <- function(){
  alpha <- paste(LETTERS,letters,sep="")
  return(alpha)
}
exam1()


# 문제2
exam2 <- function(num){
  sum <- 0
  for(i in 1:num){
    sum <- sum + i
  }
  return(sum)
}
exam2(10)



# 문제3
exam3 <- function(n1,n2){
  result <- abs(n1-n2)
  return(result)
}
exam3(10,20)
exam3(20,5)
exam3(5,30)
exam3(3,3)


# 문제4
exam4 <- function(n1,c,n2){
  if(c == "+"){
    result <- n1 + n2
  }else if(c == "-"){
    result <- n1 - n2
  }else if(c == "*"){
    result <- n1 * n2
  }else if(c == "%/%"){
    if(n1 == 0){
      result <- "오류1"
    }else if(n2 == 0){
      result <- "오류2"
    }else{
      result <- n1 %/% n2
    }
  }else if(c == "%%"){
    if(n1 == 0){
      result <- "오류1"
    }else if(n2 == 0){
      result <- "오류2"
    }else{
      result <- n1 %% n2
    }
  }else{
    result <- "규격의 연산자만 전달하세요."
  }
  return(result)
}
exam4(2,"*",4)
exam4(2,"%%",4)
exam4(2,"%/%",4)
exam4(0,"%%",4)
exam4(2,"%%",0)
exam4(2,"%/%",0)
exam4(3,"//",5)


# 문제5
exam5 <- function(num,p="#"){
  if(num < 1){
    cat()
  }else{
    for(i in 1:num){
      cat(p)
    }
  }
  #cat("\n")
  #return()
}
exam5(3)
exam5(3,"&")
exam5(-1)
exam5(0.3)
exam5(1)


# 문제6
exam6 <- function(...){
  score <- c(...)
  for(i in score){
    if(is.na(i)){
      print("NA 는 처리불가")
    }else{
      if(i >= 80){
        grade <- "상"
      }else if(i >= 70){
        grade <- "중"
      }else{
        grade <- "하"
      }
      print(paste(i,"점은 ",grade,"등급입니다.",sep=""))
    }
  }
  #return()
}
exam6(80, 50, 70, 66, NA, 35)

