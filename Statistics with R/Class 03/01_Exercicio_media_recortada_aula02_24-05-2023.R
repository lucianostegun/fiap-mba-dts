# remover objetos
rm(list=ls())

# nao mostrar os resultados na notacao cientifica
options(scipen = 999)

# importar o Data frame 
library(readr)
cadastro <- read_csv("C:/Users/regin/FIAP/DTSR/3DTSR/Aula01/cadastro.csv")
View(cadastro)

# verificar os tipos de variaveis
str(cadastro)



# Medidas resumo 1
summary(cadastro)

# mudar o formato da variavel numerica para texto
cadastro$NUM_CPF <- factor(cadastro$NUM_CPF)
cadastro$ CHAVE_CONTRATO <- factor(cadastro$ CHAVE_CONTRATO)
cadastro$CEP <- factor(cadastro$CEP)
cadastro$CEP_A <- factor(cadastro$CEP_A)
cadastro$NUMERO <- factor(cadastro$NUMERO)
cadastro$LATITUDE <- factor(cadastro$LATITUDE)
cadastro$LONGITUDE <- factor(cadastro$LONGITUDE)
cadastro$DDD_CELULAR <- factor(cadastro$DDD_CELULAR)
cadastro$CELULAR <- factor(cadastro$CELULAR)
cadastro$DDD_CELULAR_2 <- factor(cadastro$DDD_CELULAR_2)
cadastro$CELULAR_2 <- factor(cadastro$CELULAR_2)
cadastro$COD_BANCO <- factor(cadastro$COD_BANCO)
cadastro$NUM_AGENCIA <- factor(cadastro$NUM_AGENCIA)
cadastro$NUM_CONTA <- factor(cadastro$NUM_CONTA)
cadastro$CNPJ_CREDOR <- factor(cadastro$CNPJ_CREDOR)
cadastro$STATUS_CONSENTIMENTO <- factor(cadastro$STATUS_CONSENTIMENTO)

# verificar os tipos de variaveis
str(cadastro)



# Medidas resumo 
summary(cadastro)


#summarise 
# Apresenta as estatisticas: media, desvio padrao e coeficiente de variacao

media_renda <- mean(cadastro$RENDA_PRESUMIDA)
media_renda

dp_renda <- sd(cadastro$RENDA_PRESUMIDA)
dp_renda

cv_renda <- dp_renda/media_renda
cv_renda

# interpretacao: O desvio padrao é 10.7 vezes o valor da media. Indicacao de presenca de outliers.

media_divida <- mean(cadastro$VALOR_DIVIDA)
media_divida

dp_divida <- sd(cadastro$VALOR_DIVIDA)
dp_divida

cv_divida <- dp_divida/media_divida
cv_divida

# interpretacao:

media_idade <- mean(cadastro$IDADE)
media_idade

dp_idade <- sd(cadastro$IDADE)
dp_idade

#presenca de missing na variavel

media_idade <- mean(cadastro$IDADE, na.rm = TRUE)
media_idade

dp_idade <- sd(cadastro$IDADE,na.rm = TRUE)
dp_idade

cv_idade <- dp_idade/media_idade
cv_idade

# interpretacao:

#Graficos: histograma e box plot da RENDA_PRESUMIDA
hist(cadastro$RENDA_PRESUMIDA, xlab="Distribuicao da renda presumida (R$)",
     ylab = "Frequencia absolua",
     main = "Histograma da renda presumida (R$)")



## Deteccao de outliers

q1 <- quantile(cadastro$RENDA_PRESUMIDA, 0.25)
q2 <- quantile(cadastro$RENDA_PRESUMIDA, 0.5)
q3 <- quantile(cadastro$RENDA_PRESUMIDA, 0.75)

IQR = q3-q1


limite1 <- q3 + 3*IQR
limite2 <- q3 + 1.5*IQR
limite3 <- q1 - 1.5*IQR
limite4 <- q1 - 3*IQR



# criar a variavel outlier_renda

cadastro$outlier_renda <- ifelse(cadastro$RENDA_PRESUMIDA>=limite1,"ponto extremo",
                                ifelse(cadastro$RENDA_PRESUMIDA>= limite2 & cadastro$RENDA_PRESUMIDA < limite1,"outlier",
                                       ifelse(cadastro$RENDA_PRESUMIDA>= limite3 & cadastro$RENDA_PRESUMIDA< limite2,"não",
                                              ifelse(cadastro$RENDA_PRESUMIDA > limite4 & cadastro$RENDA_PRESUMIDA < limite3,"outlier", "ponto extremo"))))




# Quantos outliers? Quantos pontos extremos?

# Tabela de frequencia da variavel outlier_renda
table(cadastro$outlier_renda)

#(1) Apresente as medidas resumo da variavel renda presumida 

summary(cadastro$RENDA_PRESUMIDA)

# (2) Apresente as medidas resumo da variavel renda presumida sem os outliers
#Selecionar o conjunto de dados

renda_semout <- cadastro[cadastro$outlier_renda == "não",]



#Apresente o histograma sem os outliers
hist(renda_semout$RENDA_PRESUMIDA,xlab="Distribuicao da renda presumida (R$)",
     ylab = "Frequencia absolua",
     main = "Histograma da renda presumida (R$) sem os outliers")

# (3) Qual a precisao da media da RENDA_PRESUMIDA?

media_recortada_renda <- mean(renda_semout$RENDA_PRESUMIDA)
media_recortada_renda

dp_renda_semout <- sd(renda_semout$RENDA_PRESUMIDA)
dp_renda_semout

cv_renda_semout <- dp_renda_semout/media_recortada_renda
cv_renda_semout

# salvar o arquivo Cadastro no formato R

saveRDS(cadastro,file="C:/Users/regin/FIAP/DTSR/3DTSR/Aula01//cadastro.R")
