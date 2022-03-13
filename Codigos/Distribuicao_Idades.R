library(ggplot2)
library(readxl)

Idades = read_excel("./Dados/covid_19_bauru_mortes.xlsx")
x = Idades$`idade`

hist(x, main = "Distribuição das Idades", xlab = "Idades",ylab = "Quantidades", col = "Red", breaks = 20)



