#chp_5 차트프로그래밍
#3줄기-잎 그림
rivers
stem(rivers)
stem(rivers,scale = 2) #scale 줄기 크기

heigth <-c(152, 168, 173, 177, 179, 172, 170, 172 ,177, 170, 179, 181, 180, 180, 180, 183, 180, 185, 183, 190, 167)
stem(heigth)
stem(heigth, scale = 2)

#파이 차트
#디퐅트는 3시 방향에서 반시계방향으로 데이터가 나타남
#init.angle =90으로 기준선을 수직으로 설정
#round는 백분율 나타내는 함수
#clockwise = T로 데이터 시계방향으로 나타남
city <-c("서울", "부산", "대구","인천", "광주", "대전", "울산")
pm25 <-c(18, 21, 21, 17, 8, 11, 25)
colors <-c("red","orange","yellow", "green", "lightblue", "blue","violet")

pie(pm25, labels = city, col = colors, main = "지역별 초미세먼지 농도")
pie(pm25, labels= city, col = colors, main = "지역별 초미세먼지 농도", init.angle = 90, clockwise = T)

#-팔레트
x <-rep(1,12)
pie(x,labels = seq(1,12), col = rainbow(12), init.angle = 90, clockwise = T)
pie(x,labels = seq(1,12), col = heat.colors(12), init.angle = 90, clockwise = T)
pie(x,labels = seq(1,12), col = terrain.colors(12), init.angle = 90, clockwise = T)
pie(x,labels = seq(1,12), col = topo.colors(12), init.angle = 90, clockwise = T)
pie(x,labels = seq(1,12), col = cm.colors(12), init.angle = 90, clockwise = T)

install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

display.brewer.pal(9,name = "Greens")
display.brewer.pal(6,name = "Greens")

greens <-brewer.pal(7,"Greens")
pct <-round(pm25/sum(pm25)*100,0)
city_label <-paste(city, ",", pct, "%", sep = "")
pie(pm25, labels = city_label, col = greens, main = "지역별 초미세먼지 농도",
    init.angle = 90, clockwise = T)

#바 차트
dept <-c("영업 1팀", "영업 2팀","영업 3팀","영업 4팀")
sales01 <-c(4,12,5,8)

barplot(sales01, names.arg = dept, main = "부서별 영업 실적 (1분기)", 
        col =rainbow(length(dept)), xlab = "부서", ylab = "영업실적(억 원)",
        ylim = c(0,15))

abline(h=mean(sales01), col = "orange", lty = 2, lwd=10)

bp <-barplot(sales01, names.arg = dept, main = "부서별 영업 실적(1분기)",
             col = rainbow(length(dept)), xlab = "부서", ylab = "영업실적(억 원)",
             ylim = c(0,15))
text(x = bp, y = sales01,labels = sales01, pos = 3)

barplot(sales01,names.arg = dept, main = "부서별 영업 실적(1분기)",
        col = rainbow(length(dept)), ylab = "부서", xlab = "영업 실적(억 원)",
        xlim = c(0,15), horiz = TRUE)
abline (v = mean(sales01), col= "red", lty = 2, lwd = 3)

sales01 <-c(4,12,5,8)
sales02 <-c(12,8,8,4)
#row bind = rbind, 열을 묶어라
sales <-rbind(sales01,sales02)
sales

legend_lbl <-c("1분기", "2분기")
barplot(sales, main = "부서별 영업 실적(1~2분기)", names.arg = dept,
        xlab = "부서", ylab = "영업실적(억 원)",
        col = c("green","orange"), legend.text = legend_lbl, ylim = c(0,30),
        args.legend = list(x = "top", ncol = 2))

barplot(sales, main = "부서별 영업 실적(1~2분기)", names.arg = dept,
        xlab = "부서", ylab = "영업 실적(억 원)", col = c("green", "orange"),
        xlim = c(0,7), legend.text = legend_lbl, args.legend = list(x = "right"))

barplot(sales, main = "부서별 영업 실적(1~2분기)", names.arg = dept,
        xlab = "부서", ylab = "영업실적(억 원)", col = c("green", "orange"),
        xlim = c(0,17), legend.text = legend_lbl, args.legend = list(x = "right"),
        beside = TRUE)

# 동전 던지기 부분 잘보기!
# 코드 자세히 보기

#4X-Y플로팅
women

height <- women$height
weight <- women$weight

plot(x = height, y = weight, xlab = "키", ylab = "몸무게", 
     main = "키와 몸무게의 변화")

plot(x = height, y = weight, xlab = "키", ylab = "몸무게", 
     main = "키와 몸무게의 변화", 
     pch = 23, col = "blue", bg = "yellow", cex = 1.5)

plot(x = height, y = weight, xlab = "키", ylab = "몸무게", type = "h",
     main = "키와 몸무게의 변화")

plot(x = height, y = weight, xlab = "키", ylab = "몸무게", 
     type = "l", lty = 2, lwd = 3,  main = "키와 몸무게의 변화")

plot(x = height, y = weight, xlim = c(0,max(height)), ylim = c(0,max(weight)),
     xlab = "키", ylab = "몸무게", type = "h",
     main = "키와 몸무게의 변화")

#6히스토그램
quakes

mag <- quakes$mag
mag

hist(mag, main = "지진 발생 강도의 분포", xlab = "지진강도", ylab = "발생건수", col = rainbow(10))

hist(mag, main = "지진 발생 강도의 분포", xlab = "지진강도", ylab = "발생건수", col = rainbow(10),
     breaks = seq(4, 6.5, by = 0.5))

hist(mag, main = "지진 발생 강도의 분포", xlab = "지진강도", ylab = "확률밀도", col = rainbow(10),
     freq= FALSE)
lines(density(mag), lwd = 2)

#7박스 플롯
mag <-quakes$mag
boxplot(mag, main = "지진 발생 강도의 분포", xlab = "지진강도", ylab = "지진규모",
        col = "red")

min(mag)
max(mag)
median(mag)
Q <- quantile(mag)
Q
Q[3]-Q[1]
Q[4] - Q[2]
IQR(mag)
#상위 기준
fence.upper <-Q[4] + 1.5 *IQR(mag)
fence.upper
#하위 기준
fence.lower <-Q[2] - 1.5 * IQR(mag)
fence.lower
#극단값: 상위 기준 초과 데이터
mag[mag > fence.upper]
#극단값 제외 최댓값
max(mag[mag <= fence.upper])
#극단값: 하위 기준 초과 데이터 (결과는 없음)
mag[mag < fence.lower]
