library(dplyr)
library(stringr)
library(data.table)
library("RColorBrewer")
library(ggplot2)
df106 <- fread("106_students.csv", h = T, encoding = 'UTF-8')
df105 <- fread("105_students.csv", h = T, encoding = 'UTF-8')
df104 <- fread("104_students.csv", h = T, encoding = 'UTF-8')
df103 <- fread("103_students.csv", h = T, encoding = 'UTF-8')
df106s <- fread("106_sdata.csv", h = T, encoding = 'UTF-8')
df106 <- data.frame(df106)
df105 <- data.frame(df105)
df104 <- data.frame(df104)
df103 <- data.frame(df103)
df106s <- data.frame(df106s)

d106 = df106[df106$"等級別"=="B 學士"&df106$"學校代碼"=="7",]
d105 = df105[df105$"等級別"=="B 學士"&df105$"學校代碼"=="7",]
d104 = df104[df104$"等級別"=="B 學士"&df104$"學校代碼"=="7",]
d103 = df103[df103$"等級別"=="B 學士"&df103$"學校代碼"=="7",]
d106s = df106s[df106s$"學校名稱"=="國立交通大學"&df106s$"等級別"=="B 學士",]
l1 = d106s$"科系名稱"
pie(c(d106s$"學生數"),labels= l1,col=rainbow(10))

n106 = nrow(d106)
n105 = nrow(d105)
n104 = nrow(d104)
n103 = nrow(d103)
d1 = data.frame()
d11 = data.frame()
d12 = data.frame()
d13 = data.frame()
for (i in c(1:nrow(d106))){
a1 = d106[i,]$"延修生男生"
a2 = d106[i,]$"延修生女生"
a3 = d106[i,]$"一年級男生"
a4 = d106[i,]$"一年級女生"
if (a1 == "-"){a1 = "0"}
if (a2 == "-"){a2 = "0"}
a1 = as.numeric(a1)
a2 = as.numeric(a2)
if (a3 == "-"){a3 = "0"}
if (a4 == "-"){a4 = "0"}
a3 = as.numeric(a3)
a4 = as.numeric(a4)
res = 100*(a1+a2)/(a3+a4)
d1 = rbind(d1,res)
}

for (i in c(1:nrow(d105))){
a1 = d105[i,]$"延修生男生"
a2 = d105[i,]$"延修生女生"
a3 = d105[i,]$"一年級男生"
a4 = d105[i,]$"一年級女生"
if (a1 == "-"){a1 = "0"}
if (a2 == "-"){a2 = "0"}
a1 = as.numeric(a1)
a2 = as.numeric(a2)
if (a3 == "-"){a3 = "0"}
if (a4 == "-"){a4 = "0"}
a3 = as.numeric(a3)
a4 = as.numeric(a4)
res = 100*(a1+a2)/(a3+a4)
d11 = rbind(d11,res)
}
for (i in c(1:nrow(d104))){
a1 = d104[i,]$"延修生男生"
a2 = d104[i,]$"延修生女生"
a3 = d104[i,]$"一年級男生"
a4 = d104[i,]$"一年級女生"
if (a1 == "-"){a1 = "0"}
if (a2 == "-"){a2 = "0"}
a1 = as.numeric(a1)
a2 = as.numeric(a2)
if (a3 == "-"){a3 = "0"}
if (a4 == "-"){a4 = "0"}
a3 = as.numeric(a3)
a4 = as.numeric(a4)
res = 100*(a1+a2)/(a3+a4)
d12 = rbind(d12,res)
}
for (i in c(1:nrow(d103))){
a1 = d103[i,]$"延修生男生"
a2 = d103[i,]$"延修生女生"
a3 = d103[i,]$"一年級男生"
a4 = d103[i,]$"一年級女生"
if (a1 == "-"){a1 = "0"}
if (a2 == "-"){a2 = "0"}
a1 = as.numeric(a1)
a2 = as.numeric(a2)
if (a3 == "-"){a3 = "0"}
if (a4 == "-"){a4 = "0"}
a3 = as.numeric(a3)
a4 = as.numeric(a4)
res = 100*(a1+a2)/(a3+a4)
d13 = rbind(d13,res)
}
dd106 = df106[df106$"等級別"=="D 博士"&df106$"學校代碼"=="7",]
dd1061 = data.frame()
dd106$"一年級男生"[dd106$"一年級男生"=="-"] = "0"
dd106$"一年級女生"[dd106$"一年級女生"=="-"] = "0"
dd106$"二年級女生"[dd106$"二年級女生"=="-"] = "0"
dd106$"三年級女生"[dd106$"三年級女生"=="-"] = "0"
dd106$"四年級女生"[dd106$"四年級女生"=="-"] = "0"
dd106$"五年級女生"[dd106$"五年級女生"=="-"] = "0"
dd106$"六年級女生"[dd106$"六年級女生"=="-"] = "0"
dd106$"七年級女生"[dd106$"七年級女生"=="-"] = "0"
dd106$"二年級男生"[dd106$"二年級男生"=="-"] = "0"
dd106$"三年級男生"[dd106$"三年級男生"=="-"] = "0"
dd106$"四年級男生"[dd106$"四年級男生"=="-"] = "0"
dd106$"五年級男生"[dd106$"五年級男生"=="-"] = "0"
dd106$"六年級男生"[dd106$"六年級男生"=="-"] = "0"
dd106$"七年級男生"[dd106$"七年級男生"=="-"] = "0"

d = (as.numeric(dd106$"一年級男生")+as.numeric(dd106$"一年級女生")+as.numeric(dd106$"二年級女生")*2+as.numeric(dd106$"三年級女生")*3+as.numeric(dd106$"四年級女生")*4+as.numeric(dd106$"五年級女生")*5+as.numeric(dd106$"六年級女生")*6+as.numeric(dd106$"七年級女生")*7+as.numeric(dd106$"二年級男生")*2+as.numeric(dd106$"三年級男生")*3+as.numeric(dd106$"四年級男生")*4+as.numeric(dd106$"五年級男生")*5+as.numeric(dd106$"六年級男生")*6+as.numeric(dd106$"七年級男生")*7)/ (as.numeric(dd106$"一年級男生")+as.numeric(dd106$"一年級女生")+as.numeric(dd106$"二年級女生")+as.numeric(dd106$"三年級女生")+as.numeric(dd106$"四年級女生")+as.numeric(dd106$"五年級女生")+as.numeric(dd106$"六年級女生")+as.numeric(dd106$"七年級女生")+as.numeric(dd106$"二年級男生")+as.numeric(dd106$"三年級男生")+as.numeric(dd106$"四年級男生")+as.numeric(dd106$"五年級男生")+as.numeric(dd106$"六年級男生")+as.numeric(dd106$"七年級男生"))

dd1 = data.frame(d)

dd106 = cbind(dd106,dd1)
ggplot(dd106[1:5,], aes(x = dd106[1:5,]$"科系名稱", y = d)) + geom_line() + geom_point(col = "red")

dx =(as.numeric(dd106$"一年級男生")+as.numeric(dd106$"一年級女生")+as.numeric(dd106$"二年級女生")+as.numeric(dd106$"三年級女生")+as.numeric(dd106$"四年級女生")+as.numeric(dd106$"五年級女生")+as.numeric(dd106$"六年級女生")+as.numeric(dd106$"七年級女生")+as.numeric(dd106$"二年級男生")+as.numeric(dd106$"三年級男生")+as.numeric(dd106$"四年級男生")+as.numeric(dd106$"五年級男生")+as.numeric(dd106$"六年級男生")+as.numeric(dd106$"七年級男生"))

dx1 = cbind(dd106,dx) 
setnames(d1, c('106延畢率'))
setnames(d11, c("105延畢率"))
setnames(d12, c("104延畢率"))
setnames(d13, c("103延畢率"))

d1 = cbind(d106,d1)
d22 = cbind(d1,d12,d13)
d11 = cbind(d105,d11)
d12 = cbind(d104,d12)
d13 = cbind(d103,d13)
d2 = d1[1:10,]
d3 = d1[11:20,]
col1 = heat.colors(10)
col2 = topo.colors(10)
ggplot(data=d2, aes(x=d2$"科系名稱", y=d2$"106延畢率")) +geom_bar(stat="identity",fill = col1)
ggplot(data=d3, aes(x=d3$"科系名稱", y=d3$"106延畢率")) +geom_bar(stat="identity",fill = col2)

d23 = data.frame(c(106,105,104,103),c(25,20.75,14,12.72))
d24 = data.frame(c(106,105,104,103),c(9.58,11.59,6.94,3.03))
setnames(d23, c('year',"延畢率"))
setnames(d24, c('year',"延畢率"))
ggplot(data=d23, aes(x=d23$year, y=d23$"延畢率"))+geom_bar(stat="identity",fill = "green")+scale_x_continuous("年分")+scale_y_continuous("延畢率")
ggplot(data=d24, aes(x=d24$year, y=d24$"延畢率"))+geom_bar(stat="identity",fill = "blue")+scale_x_continuous("年分")+scale_y_continuous("延畢率")

