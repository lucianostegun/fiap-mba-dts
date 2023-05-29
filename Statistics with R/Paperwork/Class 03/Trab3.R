library(readxl)
sal_lab1 <- read_excel("Documents/fiap-mba-dts/Statistics with R/Paperwork/Class 03/sal_lab1.xlsx")
View(sal_lab1)
sal_lab1$Zscore

hist(sal_lab1$Ingestao_Sal)
zscore = (sal_lab1$Ingestao_Sal - mean(sal_lab1$Ingestao_Sal)) / sd(sal_lab1$Ingestao_Sal)
hist(zscore)

