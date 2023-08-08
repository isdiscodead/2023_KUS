getwd()

# working dir에서 escape char인 \ 쓰면 오류남 \\ 또는 / 사용 
# Error in setwd(WORK_DIR) : file name conversion problem -- name too long?
WORK_DIR <- "/Users/isdiscodead/Library/Mobile Documents/com~apple~CloudDocs/2023/Fall/Convergence Infomatics"

setwd(WORK_DIR)


# R is case sensitive lang
a <- 10 # a = 10으로도 되지만 <- 사용 지향
A <- 20 

# remove var ... = clear memory
rm(a)
rm(A)


help(cbind) # Combine R Objects by Rows or Columns
?cbind


# R packages = functional units... 
# 1. set repositories
setRepositories(ind = 1:7) # 인자 없이 사용하면 커맨드에서 선택 
# 2. install package
install.packages("ggplot2")
# 3. load package
library(ggplot2)


# 0920 
A <- 10
B <- 20
C <- "Jiwon"

A+B

# concat...
paste0(sep=" ", A, C)
paste0(1:12) # 1~12까지의 리스트 문자열로 ... 

# binding
D <- 1:20
DD <- 20:1
cbind(D,DD) # column binding ( 옆으로 )
rbind(D,DD) # row binding ( 아래로 )

# string array ( vectorization )
E <- c("Car", "Apple")
E

logicalVector <- c("TRUE", "FALSE")
logicalVector


# R에서의 class ~= data type
class(A)
class(logicalVector)
class(D)


ls() # check vars ...


# load data
data(iris) # load data ... 매개변수 없이 쓰면 R cran에 올라온 open data 모두 
View(iris) # excel form ... 우측에서 iris data 눌러도 동일한 창 뜸 
?iris

dim(iris) # 150 samples * 5 variables
ncol(iris) # 5
nrow(iris) # 150

# indexing 
iris[3, 2]
iris[3, 5]
iris$Species[3] # vectorized value 사용하여 indexing

# data.frame을 사용해야 한다 !! 
# data = set of random variable ...
iris
class(iris) # data.frame


# data.frame & matrix
irisMat <- as.matrix(iris)
irisMat
class(irisMat)
View(irisMat) # 동일하게 생겼지만 $ 사용 불가능... matrix는 data def X, vectorization X 

iris$Species # vector 
iris[,5] # vector 
iris[2,] # vector 
class(iris[,2]) # numeric
class(iris[,5]) # factor -> categorical은 반드시 factor여야 함 !! 

irisMat[,5]
irisMat[2,]
class(irisMat[,2]) # character
class(irisMat[,5]) # character

iris$Species <- as.character(iris$Species)
iris$Species # character ... NOOOOOO



# QUIZ
# 1. 1,2,3,4,5를 변수로
A <- c(1, 2, 3, 4, 5)
A <- 1:5
A

# 2. copy
B <- A
B

# 3. length check
length(A)
length(B)

# 4. binding 
cbind(A, B)
rbind(A, B)

# 5~6. binding column by column
C <- cbind(A, B)
nrow(C)
ncol(C)
dim(C)

# to data.frame ... 
class(C)
C <- data.frame(C)
C
