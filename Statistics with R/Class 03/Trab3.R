library(readxl)
sal_lab1 <- read_excel("fiap-mba-dts/Statistics with R/Paperwork/Class 03/sal_lab1.xlsx")
View(sal_lab1)
sal_lab1$Zscore

par(mfrow=c(1,3))
par(mar=c(10,4,8,2))
media = mean(sal_lab1$Ingestao_Sal)
desvio_padrao = sd(sal_lab1$Ingestao_Sal)
sal_lab1$zscore = (sal_lab1$Ingestao_Sal - media) / desvio_padrao
hist(sal_lab1$Ingestao_Sal, main = "Distribuição da ingestão de sal (g/dia)", ylab = "Fraquência", xlab="Ingestão de sal (g/dia)")
hist(sal_lab1$zscore, main = "Distribuição do z-score", ylab = "Fraquência", xlab="Z-score Ingestão de sal (g/dia)")

x_max = max(sal_lab1$Ingestao_Sal)
x_min = min(sal_lab1$Ingestao_Sal)
sal_lab1$ingest_norm = (sal_lab1$Ingestao_Sal - x_min) / (x_max - x_min)
hist(sal_lab1$ingest_norm, main = "Distribuição da ingestão normalizada", ylab = "Fraquência", xlab="Ingestão de sal (g/dia) normalizada")

