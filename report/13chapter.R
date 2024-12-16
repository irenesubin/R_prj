install.packages("neuralnet")
install.packages("MASS")
library(neuralnet)
library(MASS)

head(Boston)

#분석 대상 데이터 할당
data<-Boston[,c(1,2,4,5,9,14)]
head(data)

#결측치 데이터 삭제
#1: 행, 2: 열
na <-apply(data, 2, is.na)
na

#결측치가 없는 것으로 나옴 
apply(na, 2, sum)

#!!데이터 정규화 (무조건 0~1 사이의 값으로 나옴)!!
#계산식 외우기
maxs <-apply(data, 2, max)
maxs

mins <-apply(data, 2, min)
mins

data.scaled <- scale(data, center = mins, scale = maxs - mins)
data.scaled

#학습용과 테스트 용 데이터 분리
n <- nrow(data.scaled)
n

set.seed(1234)
index <-sample(1:n, round(0.8*n))
index

train <-as.data.frame(data.scaled[index, ])
head(train)

test <-as.data.frame(data.scaled[-index, ])
head(test)

names.col <-colnames(train)
names.col

var.dependent <- names.col[6]
var.dependent

var.independent <- names.col[-6]
var.independent

f.var.independent <- paste(var.independent, collapse = "+")
f.var.independent

f <-paste(var.dependent,"~",f.var.independent)
f

model <- neuralnet(f, 
                   data = train, 
                   hidden = c(3,3,3), 
                   linear.output = T)
plot(model)

#predicted <- compute(nn, test[,-idx.var.dependent])
predicted <- compute(model, test)
predicted$net.result

predicted.real <-predicted$net.result *(maxs[6] - mins[6]) +mins[6]

test.real <- test$medv * (maxs[6] - mins[6]) + mins[6]
test.real

plot(test.real, predicted.real,
     xlim = c(0, 50), ylim = c(0,50),
     main = "실제 값 대비 예측 값 분포",
     xlab = "실제 값", ylab = "예측 값",
     col = "red",
     pch = 18, cex = 0.7)

abline(0,1,col = "blue", lty = 2)

MAPE.nn <-sum(abs(test.real - predicted.real) / test.real * 100) /nrow(test.real)
MAPE.nn


#6.4붓꽃

library("neuralnet")

iris
data <- iris

na <- apply(data, 2, is.na)
na

apply(na, 2, sum)

maxs <-apply(data[,1:4], 2, max)
maxs

mins <-apply(data[,1:4], 2, min)
min

data[, 1:4] <- scale(data[,1:4], center = mins, scale = maxs - mins)
data[, 1:4]

data$setosa <- ifelse(data$Species == "setosa", 1, 0)
data$versicolor <- ifelse(data$Species == "versicolor", 1, 0)
data$virginica <- ifelse(data$Species == "virginica", 1, 0)
head(data)

n <-nrow(data)
n

set.seed(2000)
index <-sample(1:n, round(n*0.8))
train <- as.data.frame(data[index,])
test <- as.data.frame(data[-index,])

f.var.independent <-"Sepal.Length + Sepal.Width + Petal.Length + Petal.Width"
f.var.dependent <- "setosa + versicolor + virginica"
f <- paste(f.var.dependent, "~", f.var.independent)
f

nn<- neuralnet(f, data = train, hidden = c(6,6), linear.output = F)
plot(nn)

predicted <- compute(nn, test[,-5:-8])
predicted$net.result

idx <- max.col(predicted$net.result)
idx

species <- c('setosa', 'versicolor', 'virginica')

predicted <- species[idx]
predicted

table(test$Species, predicted)
