# AULA 02 - 17/05/2023
# Incluir um ? antes do comando vai exibir a ajuda do comando no painel
?rm
?list
a = 10
b = a
a = 20
a + b

# Matriz
m1 <- array(1:200, dim=c(4,5))

# Selecionar a primeira linha da matriz
m1[1,]

# Selecionar a primeira coluna da matriz
m1[,1]

# Selecionar o elemento em uma linha e coluna específica
m1[2,2]

# Selecionar um intervalo de elementos
m1[2:3,2:3]

# Matriz 2
m2 <- array(c(1:4,1:4),dim=c(4,2))

# Juntar m1 e m2 com cbind (Column Bind)
m3 <- cbind(m1,m2)

# Matriz 4
m4 <- array(c(3:3,3:3), dim=c(2,2))
m4

# Não é possivel juntar as matrizes m3 e m4 porque elas tem quantidade de linhas diferentes
m5 <- cbind(m3,m4)

# Juntar duas matrizes com a mesma quantidade de colunas com rbind (Row Bind)
m5 <- rbind(m2,m4)
m5

1.4/21

a = c(3,3,3,3,5,5,5,5)
b = c(1,1,3,3,5,5,7,7)

sd(a)

library(readr)
cadastro <- read_csv("fiap-mba-dts/Statistics with R/Paperwork/Aula02/cadastro.csv")
View(cadastro)
str(cadastro)

summary(cadastro)

# Gráficos

# Histograma da variável RENDA_PRESUMIDA
View(cadastro$RENDA_PRESUMIDA)
hist(cadastro$RENDA_PRESUMIDA)

# Formatar as informações do gráfico
hist(cadastro$RENDA_PRESUMIDA,
     xlab = "Renda presumida (R$)",
     ylab = "Frequência absoluta",
     main = "Distribuição da variável Renda presumida")

# Gráfico BoxPlot para identificação de Outliers
boxplot(cadastro$RENDA_PRESUMIDA)

summary(cadastro$RENDA_PRESUMIDA)

# Criar variável outlier_renda
cadastro$outlider_renda <- ifelse(cadastro$RENDA_PRESUMIDA > 5492, "ponto extremo",
                                 ifelse(cadastro$RENDA_PRESUMIDA > 4208, "oulier",
                                 ifelse(cadastro$RENDA_PRESUMIDA > 784, "nao", "oulier")))

# Tabela de frequencia de variavel outlier renda
table(cadastro$outlider_renda)

# Media, Desvio padrao e coeficiente de variacao de variavel renda presumida
media_renda <- mean(cadastro$RENDA_PRESUMIDA)
dp_renda <- sd(cadastro$RENDA_PRESUMIDA)
cv_renda <- dp_renda/media_renda

media_renda
dp_renda
cv_renda

# Calcular a media, desvio padrao e coeficiente de variacao da renda sem outliers
renda_sem_out <- cadastro[cadastro$outlider_renda == "nao",]
media_renda <- mean(renda_sem_out$RENDA_PRESUMIDA)
dp_renda_sem_out <- sd(renda_sem_out$RENDA_PRESUMIDA)
cv_renda_sem_out <- dp_renda_sem_out/media_renda

media_renda
dp_renda_sem_out
cv_renda_sem_out
hist(renda_sem_out$RENDA_PRESUMIDA,
     xlab = "Renda presumida (R$)",
     ylab = "Frequência absoluta",
     main = "Distribuição da variável Renda presumida")

min <- min(cadastro$RENDA_PRESUMIDA)
max <- max(cadastro$RENDA_PRESUMIDA)
q1 <- quantile(cadastro$RENDA_PRESUMIDA, 0.25)
q2 <- quantile(cadastro$RENDA_PRESUMIDA, 0.5)
q3 <- quantile(cadastro$RENDA_PRESUMIDA, 0.75)
iqr <- q3 - q1
l1 = q3 + 3 * iqr
l2 = q3 + 1.5 * iqr
l3 = q1 - 1.5 * iqr
l4 = q1 - 3 * iqr

min
max
q1
q2
q3
iqr
l1
l2
l3
l4
