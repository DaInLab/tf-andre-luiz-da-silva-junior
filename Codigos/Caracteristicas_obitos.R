library(ggplot2)
library(tidyverse)
datas = read_excel("./Dados/covid_19_bauru_casos_geral.xlsx")
data1 = as.matrix(datas[,-1])
data1[is.na(data1)] <- 0

cormat <- round(cor(data1),2)
head(cormat)

heatmap(cormat,cexCol =0.5, cexRow = 0.5,margins = c(7,7))

  