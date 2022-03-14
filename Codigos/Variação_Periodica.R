library(ggplot2)
library(tidyverse)
datas = read_excel("./Dados/covid_19_bauru_casos_geral.xlsx")
morte = datas$`total_mortes`
data1 = as.Date(datas$`data_boletim`)

ggplot(datas, aes(x= morte, y = data1)) +
  geom_point(size=2, col="steelblue") + 
  theme_bw() +
  labs(x="Número de óbitos", y="Datas")

