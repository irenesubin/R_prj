#8웹스크래핑

install.packages("rvest")
library(rvest)

url <-"https://www.data.go.kr/tcs/dss/selectDataSetList.do?dType=API&keyword=&operator=&detailKeyword=&publicDataPk=&recmSe=&detailText=&relatedKeyword=&commaNotInData=&commaAndData=&commaOrData=&must_not=&tabId=&dataSetCoreTf=&coreDataNm=&sort=updtDt&relRadio=&orgFullName=&orgFilter=&org=&orgSearch=&currentPage=1&perPage=10&brm=&instt=&svcType=&kwrdArray=&extsn=&coreDataNmArray=&pblonsipScopeCode="
html <-read_html(url)
html

title <-html_nodes(html, "#apiDataList , title") %>%
        html_text()
title

desc <-html_nodes(html, "#apiDataList , ellipsis") %>%
       html_text()
desc

title <-gsub("[|\r|\n|\t]","",title)
title

api <- data.frame(title,desc)
api

#8.2영화리뷰
library(rvest)

url<-"https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EC%9A%B8%EC%9D%98+%EB%B4%84&x_csa=%7B%22mv_id%22%3A%22212101%22%7D&pkid=68"
html <- read_html(url)
html

review_cell <- html_nodes(html, "#old_content table tr .title")
review_cell

score <-html_nodes(review_cell, "em") %>%
  html_text()
score

review <- review_cell %>%
  html_text()
review

index.start <-regexpr("\t별점 - ", review)
index.start

index.end <- regexpr("\t신고", review)
index.end

review <-substring(review, index.start, index.end)
review

review <-substring(review, 10)
review

review <-gsub("[\n|\t]", "", review)
review

review<-trimws(review, "both")
review