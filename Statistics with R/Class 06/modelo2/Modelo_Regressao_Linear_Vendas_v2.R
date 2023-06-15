# remover os objetos 
rm(list=ls())

# Instalar os pacotes 
install.packages("ggplot2")
install.packages("tidyverse")

#carregar pacotes
library(ggplot2)
library(dbplyr)
library(tidyverse)

#pacotes de s?ries temporais
install.packages("forecast")

#carregar pacote
library(forecast)


# Modelo de Regressao Linear Simples

# Importar os dados
library(readr)
df <- read_delim("C:/Users/logonrmlocal/Documents/fiap-mba-dts/Statistics with R/Class 06/modelo2/Vendas_2016a2018.csv", 
                 delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(df)

# Formato das variaveis
str(df)

#----------------------------- Analise descritiva
# Medidas resumo
summary(df)



# Grafico de dispersao entre Vendas e Budget_Advertising
g1 <- ggplot(df,aes(x=Budget_Advertising,y=Vendas)) +
  geom_point() +
  geom_smooth(method = lm, se=FALSE)
g1


# selecao das variaveis quantitativas
Vendasquant=subset(df,select=c(Vendas,Budget_Advertising))

# Correlacao de Pearson
mc = cor(Vendasquant);mc

#------------------------------------------ Modelo de regressao linear

# nao mostrar os resultados na notacao cientifica
options(scipen = 999)

modelo <- lm(Vendas ~ Budget_Advertising,data=df)
summary(modelo)


# Calcular o predito, residuo e residuo padronizado
df$predito <- predict(modelo) 
df$residuo <- resid(modelo) 
df$residuop <- rstandard(modelo) 

#------------------------------- An?lise dos residuos
# Histograma dos residuos
par(mfrow=c(1,3))
par(mar=c(10,4,8,2))
hist(df$residuo)
hist(df$residuop)

# mostrar um grafico por linha
par(mfrow=c(1,1))

# Grafico para verificar se os residuos seguem uma uma distribuicao Normal
qqnorm(residuals(modelo), ylab="Res?duos",xlab="Quantis te?ricos",main="")
qqline(residuals(modelo))

# Teste de Normalidade
# H0: Distribui??o = Normal
# H1: Distribui??o <> Normal
# Se p-valor < 0.05 entao rejeito H0
# Se p-valor >= 0.05 entao nao rejeito H0

shapiro.test(residuals(modelo))


#---------------------------- Aplicacao do modelo ajustado

# Importar os Vendas
library(readr)
Budget_2019 <- read_csv("C:/Users/logonrmlocal/Documents/fiap-mba-dts/Statistics with R/Class 06/modelo2/Budget_2019.csv")


summary(Budget_2019)

Budget_2019$ano <- 2019

# aplicacao do modelo de regressao ajustado

# Calcular a previsao de Vendas estimadas pelo modelo ajustado
previsao <- predict(modelo, newdata=Budget_2019,interval = "confidence")

Budget_2019 <- cbind(Budget_2019,previsao)
Budget_2019 <- rename(Budget_2019,Vendas =fit)
Budget_2019 <-relocate(Budget_2019,Vendas, .before = Budget_Advertising)

# exemplo de aplicacao do modelo na base de 2019
Budget_2019$previsao_vendas <- 1060550.396 + 4.964*Budget_2019$Budget_Advertising

# lista os nomes das variaveis
names(Budget_2019)

# Adicionar a previsao de Vendas e o intervalo de confianca de 95% 



# Projecao de vendas (R$) para 2019
vendas_2019_regressao <- sum(Budget_2019$previsao_vendas)

 
# selecao das variaveis quantitativas
Vendas_1 <- select(df, 1:4)
Vendas_2 <- select(Budget_2019,1:4)
class(Vendas_2)

# juntar os dois arquivos
Vendas_hist <- rbind(Vendas_1, Vendas_2)

dev.off()

# time series
?ts
# criando uma serie temporal
serie = ts(Vendas_hist, start=c(2016,1),end=c(2019,12),frequency=12)
autoplot(serie)

class(serie)


serie_budget = ts(Vendas_hist[4], start=c(2016,1),end=c(2019,12),frequency=12)
autoplot(serie_budget)


