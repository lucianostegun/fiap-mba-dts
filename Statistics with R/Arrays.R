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
