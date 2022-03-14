library(ggplot2)
library(readxl)
datas = read_excel("./Dados/covid_19_bauru_casos_geral.xlsx")

morte = datas$`total_mortes`[!is.na(datas$total_mortes)]
data1 = as.Date(datas$`data_boletim`)[!is.na(datas$total_mortes)]

df<- data.frame(morte,data1)

ggplot(datas[!is.na(datas$total_mortes), ], aes(x= morte, y = data1)) +
  geom_point(size=2, col="steelblue") + 
  theme_bw() +
  labs(x="Número de óbitos", y="Datas")

