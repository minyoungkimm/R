# 문제1
countEvenOdd <-function(v){
  even <- 0
  odd <- 0
  for(data in v){
    if(!is.numeric(data)){
      return()
    }else{
      if(data > 0){
        if(data %% 2 ==0){
          even <- even +1
        }else if(data %% 2 ==1){
          odd <- odd +1
        }else{
          next
        }
      }else{
        next
      }
    }
  }
  l <- list(even=even,odd=odd)
  return(l)
}
countEvenOdd(1:9)
countEvenOdd(-1:5)
countEvenOdd(c(0.3,0.5,1,2,3))
countEvenOdd(c(-1,1,2,3,"a","b"))


# 문제2
vmSum <- function(x){
  if(!is.vector(x) | is.list(x)){
    return("벡터만 전달하세요!")
  }else{
    if(!is.numeric(x)){
      print("숫자 벡터를 전달하세요!") 
      return(0)
    }else{
      sum <- 0
      for(i in x){
        sum <- sum + i
      }
    }
  return(sum)
  }
}
vmSum(100)
vmSum(c(1,2,3,4,5))
vmSum(c(1,2,3,4,"a"))
vmSum(LETTERS)
vmSum(list(1,2,3,4,5))
vmSum(matrix(1,2,3,4))
vmSum(data.frame())
vmSum(array())
vmSum(mean)


# 문제3
vmSum2 <- function(x){
  if(!is.vector(x) | is.list(x)){
    stop("벡터만 전달하세요!")
  }else{
    if(!is.numeric(x)){
      warning("숫자 벡터를 전달하세요!") 
      return(0)
    }else{
      sum <- 0
      for(i in x){
        sum <- sum + i
      }
    }
    return(sum)
  }
}
vmSum2(100)
vmSum2(c(1,2,3,4,5))
vmSum2(LETTERS)
vmSum2(list(1,2,3,4,5))
vmSum2(matrix(1,2,3,4))
vmSum2(data.frame())
vmSum2(array())
vmSum2(mean)


# 문제4
mySum <- function(x){
  if(is.null(x)){
    return()
  }else if(!is.vector(x) | is.list(x)){
    stop("벡터만 전달하세요!")
  }else{
    if(any(is.na(x))){
      warning("NA를 최저값으로 변경하여 처리함!")
      x[which(is.na(x))] <- min(x,na.rm=T)
    }
    o <- x[seq(1,length(x),2)]
    e <- x[seq(0,length(x),2)]
    oddSum <- sum(o)
    evenSum <- sum(e)
    l <- list(oddSum=oddSum,evenSum=evenSum)
    return(l)
    }
  }

mySum(100)
mySum(c(1,2,3,4,5))
mySum(c(1,2,3,4,NA))
mySum(LETTERS)
mySum(list(1,2,3,4,5))
mySum(matrix(1,2,3,4))
mySum(data.frame())
mySum(array())
mySum(mean)
mySum(c())


# 문제5
myExpr <- function(f){
  if(!is.function(f)){
    stop("수행 에러")
  }else{
    num <- sample(1:45,6)
    return(f(num))
  }
}
myExpr(mean)
myExpr(mySum)
myExpr(vmSum2)
myExpr(vmSum)


# 문제6
createVector1 <- function(...){
  p <- c(...)
  if(is.null(p)){
    return()
  }else if(any(is.na(p))){
    return(NA)
  }else{
    return(p)
  }
}
createVector1(1,2,3,4,5)
createVector1()
createVector1(1,2,3,4,NA)
createVector1("a",2,3,4,5)


# 문제7
createVector2 <- function(...){
  p <- list(...)
  if(length(p) == 0){
    return()
  }else{
    numeric <- vector()
    character <- vector()
    logical <- vector()
    for(data in p){
      if(class(data) == "numeric"){
        numeric <- c(numeric,data)
      }else if(class(data) == "character"){
        character <- c(character,data)
      }else if(class(data) == "logical"){
        logical <- c(logical,data)
      }
    }
    result <- list(Numeric=numeric,Character=character,Logical=logical)
    return(result)
  }
}
createVector2(1,2,"a",NA,T,4,"R")
createVector2()


