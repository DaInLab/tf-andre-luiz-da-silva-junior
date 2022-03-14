library(ggplot2)
library(readxl)

Tipos = read_excel("./Dados/covid_19_bauru_mortes.xlsx", guess_max = 1005)
x = Tipos$`doses_vacina`
x[is.na(x)] <- 0
tab = table(x)
y= as.Date(Tipos$data_obito)

ggplot(as.data.frame(tab),aes(x=x,y=Freq,fill=x),) +
  labs(x = "Número de Doses", y = "Frequência", fill="Número de doses") +
  ggtitle("Óbitos por quantidades de vacina") +
  geom_text(aes(label=Freq), vjust = -0.3) +
  geom_bar(stat="identity", position="stack") +
  geom_col(width=0.3)

ggplot(Tipos,aes(x=y,y=x)) +
  geom_point(size=2, col="steelblue") + 
  theme_bw() +
  labs(x="Número de óbitos", y="Doses")
