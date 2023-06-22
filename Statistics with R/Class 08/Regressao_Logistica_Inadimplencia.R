# remover os objetos
rm(list=ls())


install.packages("tidyverse")
install.packages("summarytools")
install.packages("fastDummies")
install.packages("ROCit")


library(tidyverse)
library(tidyr) 
library(dplyr) 
library(ROCit)
library(readr)
library(summarytools)
library(fastDummies)

# nao mostrar os resultados na notacao cientifica
options(scipen = 999)


# importar os dados
library(readr)
df <- read_delim("fiap-mba-dts/Statistics with R/Class 08/arq_inadimplencia.csv", 
                                delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(df)


# verificar os tipos de variaveis
str(df)

# Preprocessamento da base dos df

# Mudar o formato da variavel para qualitativa
df$atrasos = factor(df$atrasos)
df$temporel = factor(df$temporel)
df$valorfatura = factor(df$valorfatura)
df$p_gastoalim = factor(df$p_gastoalim)
df$regiaorisco = factor(df$regiaorisco)
df$rendamensal = factor(df$rendamensal)

# selecionar as variaveis preditoras
var_preditoras <- subset(df,select = c(atrasos, temporel,
                              valorfatura,p_gastoalim,
                              regiaorisco,rendamensal))
# selecionar a variavel resposta
var_resposta <-  subset(df,select = c(Resposta))

# criar variaveis dummies das variaveis preditoras qualitativas
var_dummies <- dummy_cols(var_preditoras, select_columns = c("atrasos", "temporel",
                                  "valorfatura","p_gastoalim",
                                  "regiaorisco","rendamensal"),
           remove_first_dummy = TRUE,
           remove_selected_columns = TRUE)

# juntar as bases
df_modelo <- cbind(var_resposta, var_dummies)

#------------------------------------------- dividir a amostra em treino e validacao
set.seed(2019)

train <- sample(nrow(df_modelo), 0.7*nrow(df_modelo), replace = FALSE)
TrainSet <- df_modelo[train,]
ValidSet <- df_modelo[-train,]

# Tabela de frequencia da resposta na amostra treino
freq(TrainSet$Resposta)

# Tabela de frequencia da resposta na amostra treino
freq(ValidSet$Resposta)
#-------------------------------------------- Regressao Logistica

Mod_Log<- glm(Resposta ~ .,
              TrainSet, family=binomial(link=logit))
summary(Mod_Log)

# Calculo da probabilidade de inadimplencia
TrainSet$predito = fitted(Mod_Log)

(2339+8833)/18138

# Criar a variavel resposta do modelo
TrainSet_1 = TrainSet
TrainSet_1$resp_modelo1 = ifelse(TrainSet_1$predito > 0.501, 1, 0)
freq(TrainSet_1$resp_modelo1)

install.packages("gmodels")
library(gmodels)

CrossTable(TrainSet_1$Resposta, TrainSet_1$resp_modelo1)
(5339  + 8326) / 18189
(6413   + 7791 ) / 18189
(7376  + 7237 ) / 18189 # 50
(7376    + 7143    ) / 18189 # 51
(7559   + 6959   ) / 18189 # 52
(7559   + 6683  ) / 18189 # 55
(7654 + 6246 ) / 18189 #60
#----------------------------------------- Medidas de acuracia do modelo
# https://cran.r-project.org/web/packages/ROCit/vignettes/my-vignette.html
## rocit object
rocit_emp <- rocit(score = TrainSet$predito, 
                   class = TrainSet$Resposta, 
                   method = "emp")
rocit_bin <- rocit(score = TrainSet$predito, 
                   class = TrainSet$Resposta, 
                   method = "bin")
rocit_non <- rocit(score = TrainSet$predito, 
                   class = TrainSet$Resposta, 
                   method = "non")

summary(rocit_emp)
summary(rocit_bin) #maior AUC
summary(rocit_non)

## Plot ROC curve
plot(rocit_emp, col = c(1,"gray50"), 
     legend = FALSE, YIndex = FALSE)
lines(rocit_bin$TPR~rocit_bin$FPR, 
      col = 2, lwd = 2)
lines(rocit_non$TPR~rocit_non$FPR, 
      col = 4, lwd = 2)
legend("bottomright", col = c(1,2,4),
       c("Empirical ROC", "Binormal ROC",
         "Non-parametric ROC"), lwd = 2)

#AUC (Area Under the Curve) da curva ROC
ciAUC(rocit_emp)


# Estatistica KS
#https://pt.wikipedia.org/wiki/Teste_Kolmogorov-Smirnov
rocit = rocit(score=TrainSet$predito, TrainSet$Resposta)
ksplot =ksplot(rocit)


TrainSet$fx_predito <- cut(TrainSet$predito, breaks=c(0,0.50,1), right=F)

table (TrainSet$fx_predito)
table (TrainSet$Resposta)

MC_log_treino <- table(TrainSet$Resposta, TrainSet$fx_predito , deparse.level = 2) # montar a matriz de confus?o  
show(MC_log_treino) # mostra os resultados  
ACC_log = sum(diag(MC_log_treino))/sum(MC_log_treino)*100 # calcula a acur?cia  
show(ACC_log) # mostra a acur?cia  
print(prop.table(table(TrainSet$Resposta,TrainSet$fx_predito),1),digits=2)


#------------------------------------------------------------ Amostra de validacao
ValidSet$predito <- predict(Mod_Log,ValidSet,type = "response")
summary(ValidSet$predito)   

hist(predito)



ValidSet$fx_predito <- cut(ValidSet$predito, breaks=c(0, 0.50, 1), right=F)

### Matriz de confusao na amostra validacao

MC_test_log <- table(ValidSet$Resposta, ValidSet$fx_predito , deparse.level = 2) # montar a matriz de confus?o  
show(MC_test_log) # mostra os resultados  
ACC_test_log = sum(diag(MC_test_log))/sum(MC_test_log)*100 # calcula a acur?cia  
show(ACC_test_log) # mostra a acur?cia  
print(prop.table(table(ValidSet$Resposta,ValidSet$fx_predito),1),digits=2)

