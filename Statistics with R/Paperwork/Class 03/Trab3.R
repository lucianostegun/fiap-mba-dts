library(readxl)
sal_lab1 <- read_excel("fiap-mba-dts/Statistics with R/Paperwork/Class 03/sal_lab1.xlsx")
View(sal_lab1)
sal_lab1$Zscore

hist(sal_lab1$Ingestao_Sal, main = "Distribuição da ingestão de sal (g/dia)", ylab = "Fraquência", xlab="Ingestão de sal (g/dia)")

media = mean(sal_lab1$Ingestao_Sal)
desvio_padrao = sd(sal_lab1$Ingestao_Sal)
sal_lab1$zscore = (sal_lab1$Ingestao_Sal - media) / desvio_padrao
hist(sal_lab1$zscore)
hist(zscore, main = "Distribuição da ingestão de sal (g/dia)", ylab = "Fraquência", xlab="Ingestão de sal (g/dia)")

