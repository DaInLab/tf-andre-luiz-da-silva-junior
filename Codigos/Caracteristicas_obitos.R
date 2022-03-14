library(ggplot2)
library(tidyverse)
datas = read_excel("./Dados/covid_19_bauru_casos_geral.xlsx")
morte = read_excel("./Dados/covid_19_bauru_mortes.xlsx")
com = c(morte$comorbidade[complete.cases(morte$comorbidade)])
uniq <- strsplit(com," e ")
com1 = unlist(uniq)


data1 = as.matrix(datas[,-1])
data1[is.na(data1)] <- 0

cormat <- round(cor(data1),2)
head(cormat)

heatmap(cormat,cexCol =0.5, cexRow = 0.5,margins = c(7,7))


tab1 <- as.data.frame(table(com1))
tab1 <- tab1[with(tab1,order(-Freq)),]
tab1 <- tab1[1:10,]
tab1
ggplot(tab1,aes(x=com1,y=Freq,fill=com1),) +
  labs(x = "Comorbidade", y = "Óbitos", fill="Comorbidades") +
  ggtitle("Óbitos X Comorbidades") +
  geom_text(aes(label=Freq), vjust = -0.3) +
  geom_bar(stat="identity", position="stack") +
  theme(axis.text.x = element_blank()) +
  geom_col(width=0.3)  
