library(ggplot2)
library(readxl)
Tipos = read_excel("./Dados/covid_19_bauru_mortes.xlsx")
x = Tipos$`tipo_hosp`
y = Tipos$`sexo`
z1 = as.Date(Tipos$`data_obito`)
z2 = as.Date(Tipos$`inicio_sintoma`)
z3 = difftime(z1, z2, units = "days")
days1 = table(z3)
pub = table(x)
sex = table(y)

#Tipos por publico e privado
ggplot(as.data.frame(pub),aes(x=x,y=Freq,fill=x),) +
  labs(x = "Tipos", y = "Frequência", fill="Tipos") +
  ggtitle("Distribuicao de Óbitos Entre Hospitals Públicos e Privados") +
  geom_text(aes(label=Freq), vjust = -0.3) +
  geom_bar(stat="identity", position="stack") +
  geom_col(width=0.3)

#Tipos por sexo
ggplot(as.data.frame(sex),aes(x=y,y=Freq,fill=y),) +
  labs(x = "Tipos", y = "Frequência", fill="Tipos") +
  ggtitle("Óbitos por Sexo") +
  geom_text(aes(label=Freq), vjust = -0.3) +
  geom_bar(stat="identity", position="stack") +
  geom_col(width=0.3)


#Relação obito dias internados
ggplot(as.data.frame(days1),aes(x=z3,y=Freq,fill=z3),) +
  labs(x = "Dias Internados", y = "Mortes", fill="Dias") +
  ggtitle("Óbitos pela Quantidade de Dias Hospitalizado") +
  geom_bar(stat="identity", position="stack") +
  geom_col(width=0.3)+
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))+
  theme(legend.position="none")


