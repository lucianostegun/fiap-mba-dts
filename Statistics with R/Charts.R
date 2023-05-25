# Apaga todos os objetos
rm(list=ls())

# importar a base de dados
library(readxl)
Cartola_FC2018 <- read_excel("fiap-mba-dts/Statistics with R/Paperwork/Class 03/Cartola_FC2018.xlsx")
View(Cartola_FC2018)

# calcular a media de gols
media = mean(Cartola_FC2018$gols)
media

# help
?dpois

dpois(c(0:7),media)

install.packages("tidyverse")
library(tydiverse)
library(ggplot2)

# grafico da variavel de gols

g <- ggplot(Cartola_FC2018) + 
  geom_bar(aes(gols)) + 
  labs(x="Número de gols", y="Frequência de partidas",
       title = "Distribuição de gols no Campeonato Brasileiro de 2018") +
      scale_fill_manual(c("skyblue", "royalblue","blue","navy"))

g
