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

# desvio padrao
dp_x <- sd(x)

# vetor com missing
x <- c(1:10,NA) # Cria uma lista com númerode de 1 a 10 e mais um elemento faltante
mean(x) # Só retorna NA por causa do dado faltante
mean(x, na.rm=TRUE) # Remove os dados faltantes
x
# desvio padrao com dado faltante (missing)
dp_x <- sd(x, na.rm=TRUE);

# valor minimo
min_x = min(x, na.rm=TRUE)

# valor maximo
max_x = max(x, na.rm=TRUE)
ls(x, na.rm=TRUE)

# Criacao de funcao nao pode usar = para atribuir o valor
func_media <- function(vetor) {
  vetor_sem_na = na.exclude(vetor)
  soma <- sum(vetor_sem_na, na.rm=TRUE)
  num_ob <- length(vetor_sem_na)
  media <- soma / num_ob
  
  return(media)
}

func_media(x)

func_dp <- function(vetor) {
  n = na.exclude(vetor)
  media = mean(n)
  diferenca = (n - media) ^ 2
  soma_diferenca= sum(diferenca)
  nobs = length(n)
  desvio_padrao = sqrt(soma_diferenca / (nobs-1))
  
  return(desvio_padrao)
}

func_dp(x)
sd(x, na.rm = TRUE)
