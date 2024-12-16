##3.2 벡터와 연산자
#벡터 만들기
score<-70
score

score<-c(70,85,90)
score

score[4]<-100
score[3]<-95
score

name<-c("알라딘", "쟈스민", "지니")
name

#연속적인 값들의 벡터 만들기
x<- seq(1,10,by=3)
x

x<-1:10
x

x<-10:1
x

x<-seq(1,10,length.out =5)# 1-10까지 정수 범위에서 같은 간격 5개 숫자
x

#반복적인 값들의 벡터 만들기
x<-c(1,2,3)
y<-rep(x,times = 3) # 3번 반복
y

y<-rep(x, each =2) # 각각의 원소 2번 반복
y

#산술 연산
2^3 #2의 3제곱
2^10#2의 10제곱

#벡터와 사칙연산
x<-c(10, 20, 30, 40)
y<-c(2,4,6,8)
z<-c(2,4)
x+5
y+5
z+5
y+z
x+z

#비교 연산자
3<10

x<-c(10,20,30)
x <= 10
x > 20
x[x>15]

x<-c(10,20,30)
any(x <= 10) # x벡터에서 하나라도 10이하인 원소가 있는가?
all(x <= 10)# x벡터는 모든 원소가 10이하인가?
any(x < 25)
all(x > 5)

#논리 연산자
x<-c(TRUE, TRUE, FALSE, FALSE)
y<-c(TRUE, FALSE, TRUE, FALSE)
x & y
x | y
xor(x,y)

#견측지와 널
x<-NULL
is.null(x) #x벡터는 널인가?

v<-c(1,2,3,NA,5)# 4번째 원소가 비어있는 벡터
y # 4번째 벡터빼고 출력

z<-10/0
z # 무한대(불능) 출력

u<-0/0
u # 부정 출력

##3.3 요인
#요인 만들기
gender<-c("남", "여", "남")
gender

gender.factor <-factor(gender)
gender.factor

#3.4 배열과 행렬
##배열 만들기
x<-c(70, 80, 90)
arr<-array(x)
arr

z<-1:6
arr<-array(z, dim=c(2,3))
arr

#행과 열 이름 설정 및 데이터 수정
name <-list(c("국어", "음악"), c("알라딘", "자스민", "지니"))
score <-c(70, 80, 85, 90, 90, 75)
arr <-array(score, dim = c(2,3), dimnames = name)
arr

arr[2,3] <-77
arr[2,3]

arr[1,]
arr[2,]
arr[,2]

#행렬
name <-list(c("1행", "2행"), c("1열", "2열", "3열"))
x<-1:6
mtx<-matrix(x, nrow = 2) #nrow는 행
mtx

mtx<- matrix(x, nrow = 2, dimnames = name, byrow = TRUE)
mtx

mtx<- matrix(x, nrow = 2, dimnames = name, byrow = FALSE)
mtx

y<-c(7,8,9) 
mtx<-rbind(mtx,y)#mtx아래에 새로운 y벡터 행+열 추가
rownames(mtx)[3] <-"3행" #3번째 행의 이름 생성
mtx

z<-c(10,11,12)
mtx<-cbind(mtx,z)
colnames(mtx)[4]<-"4열"
mtx

## 3.5리스트
#리스트 만들기
x<-list("알라딘", 20, c(70, 80))
x

x[[1]]

x<-list(성명 = "알라딘", 나이 = 20, 성적 = c(70,80))
x

x[1]

x[[1]]

## 3.6 데이터 프레임
# 두 고객의 데이터 프레임 만들기
df <-data.frame(성명=c("알라딘", "쟈스민"), 나이=c(20, 19), 국어=c(70,85))
df

#열과 행 단위 추가
df<-cbind(df, 음악 = c(80,90))
df

df<-rbind(df,data.frame(성명 = "지니", 나이 = 30, 국어 = 90, 음악= 75))
df

#요소 값 보기
df[3,2]
df[3,]
df[,2]
df[-2,]
df[,-3]

#요소 값 수정
df <-data.frame(성명=c("알라딘", "쟈스민"), 나이=c(20,19), 국어=c(70,85))
str(df)

df[1,2] <-21
df[1,1]<-"Aladin"
df

df<- data.frame(성명=c("알라딘", "쟈스민"),
                나이=c(20,19),
                국어=c(70,85),
                stringsAsFactors =  F)
str(df)

df[1,1]<-"Aladin"
df

##3.7 데이터 파일 읽기
#데이터 세트 목록
data(package = "datasets")

#데이터 세트 보기
quakes
head(quakes)
tail(quakes, n=10)
names(quakes)
dim(quakes)
str(quakes)
summary(quakes)

#데이터 세트의 저장과 파일 읽기
write.table(quakes, "C:/Temp/quakes.csv", sep = ",")
df<-read.csv("C:/Temp/quakes.csv", header = T)
df

##3.8 함수
#함수 정의와 호출
getTriangleArea<- function(w,h){
  area<- w * h / 2
  return(area)
}
getTriangleArea(10,5)
getTriangleArea(10,10)
