# remover todos os objetos
rm(list=ls())

library(readr)
cadastro <- read_csv("fiap-mba-dts\\Statistics with R\\Paperwork\\Aula01\\cadastro.csv")
View(cadastro)
str(cadastro)

# Analise
summary(cadastro)

# Mudar o formato da variavel quantitativa para qualitativa
cadastro$CEP <- factor(cadastro$CEP)

str(cadastro$CEP)
summary(cadastro$CEP)
