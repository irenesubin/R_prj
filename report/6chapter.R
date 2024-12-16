#2카운트다운
install.packages("animation")
library(animation)

ani.options(interval = 1)
plot.new()

for(i in 10:0){
  rect(0, 0, 1, 1, col = "yellow")
  
  text_size = 11 - i
  text(0.5, 0.5, i, cex = text_size, col = rgb(0, 0, 1, 1))
  
  ani.pause()
}

#3랜덤막대그래프
ani.options(interval = 1)
while(TRUE){
  y <-runif(5, 0, 1)
  barplot(y, ylim = c(0,1), col = rainbow(5))
  ani.pause()
}

#4동전 던지기 확률의 변화 차트
plot.new()

count <- c(0, 0, 0)
for(n in 1:500){
  coin <- sample(c(0, 1), 2, replace = T)
  
  index <- sum(coin) + 1
  count[index] <-count[index] + 1
  
  probability <- count / n
  
  title <-paste("반복 수:", n,"/500")
  
  barplot(probability, names.arg = c(0, 1, 2), 
          xlab = "앞면이 나온 횟수", ylab = "확률", col = rainbow(3), main = title)
  Sys.sleep(0.05)
}

#5룰렛 돌리기
install.packages("imager")
library(imager)

img_path <-"D://Bigdata/roulette.png"
img <- load.image(img_path)
plot(img)

img <- resize(img, size_x = 400L, size_y = 400L)
plot(img, xlim = c(0,400), ylim = c(0,400))

plot(img, xlim = c(0,400), ylim = c(0,400), axes = FALSE)
rot.count <-sample(11:20,1)
rot.count

angle <-0
for( i in 1:rot.count){
  angle <- angle + 36
  title <- paste("룰렛 회전:", i, "/", rot.count)
  imrotate(img, angle, cx = 200, cy = 200) %>%
  draw_circle(x = 200, y = 30, radius = 30, color = c(1, 0, 0, 0), opacity = 0.5) %>%
  plot(axes = FALSE, main = title)
  Sys.sleep(0.2)
}

install.packages("dplyr")
library(dplyr)
a = c(1.11, 2.22, 3.33, 4.44, 5.55)
a_f = round(mean(a), 1)
a_f2 = a %>% round(1)
a_f3 = a %>% mean %>% round(1)

a_f2
a_f3


#6라이언 킹
install.packages("magick")
library(magick)

lion_bg <- image_read("D://Bigdata/lion_bg.png")
lion_1 <- image_read("D://Bigdata/lion_1.png")
lion_2 <- image_read("D://Bigdata/lion_2.png")

lion_bg <- image_scale(lion_bg, "600X300!")
lion_1 <- image_scale(lion_1, "100X50!")
lion_2 <- image_scale(lion_2, "100X50!")

print(lion_1)
print(lion_2) 
print(lion_bg)

img <-image_composite(lion_bg, lion_1, offset = "+100+200")
print(img)

moving <-0

x<- -100
y<- -150
while(TRUE){
  if(x < 0)
    position <- paste(x, "+", y, sep ="")
  else
    position <- paste("+", x, "+", y, sep = "")
  
  if(moving %% 2 == 0){
    img <-image_composite(lion_bg, lion_1, offset = position)
  }
  else{
    img <-image_composite(lion_bg, lion_2, offset = position)
  }
  print(img)
  
  Sys.sleep(0.3)
  
  if(x > 600)
    break
  moving <- moving + 1
  x <- x + 20
}
