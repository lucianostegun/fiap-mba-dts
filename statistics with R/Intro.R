# Introdução ao R
# Aritimérica básica
2+2
10-10
10/5
10*9

# Atribuir valores a variáveis com o operador <-
# Com o pacote tydiverse o operador = passou a funcionar também

# Vetor x = 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
# Commando c() é para concatenar valores
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)

# Vai executar a operação aritimética sobre cada elemento do vetor
1/x
2*x

a <- sum(x)

# Equação
y = 2 * x^2 + 2*x + 1
10 * 9 *8*7*6*5*4*3*2*1*0

length(x)

z <- c(x,y); z

rm(list=ls())

# COMANDOS
x <- c(1:10) # Cria uma lista de 1 até 10
media_x <- mean(x)
