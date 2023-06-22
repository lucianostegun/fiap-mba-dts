

# A partir de uma amostra de clientes ativos e 
# com as informa??es de Rec?ncia, Frequ?ncia e Valor 
# Crie clusters de clientes e estrat?gias para fideliza??o
# Ler arquivo csv

library(readr)
BaseRFV <- read_delim("C:/Users/regin/FIAP/DTS/DTS7/Aula09/BaseRFV.csv", 
                      delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(BaseRFV)


#Verificando o formato das vari?veis
str(BaseRFV )

#Estat?sticas descritivas
summary(BaseRFV)

#Vari?veis n?mericas sem vari?vel Target

#comando para gerar em 4 linhas e duas colunas os histogramas
par (mfrow=c(1,3))

hist(BaseRFV$compras)
hist(BaseRFV$recencia)
hist(BaseRFV$valor)


par (mfrow=c(1,3))

boxplot(BaseRFV$compras, main="compras")
boxplot(BaseRFV$recencia , main="recencia")
boxplot(BaseRFV$valor , main="valor")


par (mfrow=c(1,3))

plot(BaseRFV$compras, BaseRFV$recencia)
plot(BaseRFV$compras, BaseRFV$valor)
plot(BaseRFV$recencia, BaseRFV$valor)


qplot(recencia,valor, data=BaseRFV, color = compras)
qplot(recencia,valor, data=BaseRFV, shape =compras)
qplot(recencia,valor, data=BaseRFV, shape =compras, color =  compras)


# matriz de correlacao
matcor <- cor(BaseRFV)
print(matcor, digits = 2)

plot(BaseRFV$compras, BaseRFV$valor)
 
install.packages("corrgram")
library(corrgram)
corrgram(matcor, type = "cor", lower.panel = panel.shade, upper.panel = panel.pie)

panel.cor <- function(x, y, digits=2, prefix ="", cex.cor,
    ...)  {
    usr <- par("usr")
    on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r <- cor(x, y , use = "pairwise.complete.obs")
    txt <- format(c(r, 0.123456789), digits = digits) [1]
    txt <- paste(prefix, txt, sep = "")
    if (missing(cex.cor))
        cex <- 0.8/strwidth(txt)
# abs(r) ? para que na sa?da as correla??es ficam proporcionais
    text(0.5, 0.5, txt, cex = cex * abs(r))
}


#pdf(file = "grafico.pdf")
pairs(BaseRFV, lower.panel=panel.smooth, upper.panel=panel.cor)



### ######################################### ###
###                                           ###
### como criar grupos com esta base de BaseRFV ###
###                                           ###
### ######################################### ###


# criar grupos de BaseRFV de  acordo com o desempenho dos recoredes femininos.

attach(BaseRFV)

# Excluir o campo ID
BaseRFV$id_cliente = NULL

# Padronizar as vari?veis
Padr_BaseRFV <- data.frame(scale(BaseRFV))

View(Padr_BaseRFV)

summary(Padr_BaseRFV)

#m?todo hierarquico

par (mfrow=c(1,1))

hier_cluster<-hclust(dist(Padr_BaseRFV),method='ward')
d1 <- dist(Padr_BaseRFV, method = "euclidean") # distance matrix
plot(hier_cluster, ylab='distancia', cex=0.6)


groups <- cutree(hier_cluster, k=4) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters
rect.hclust(hier_cluster, k=5, border="red") 

groups <- cutree(hier_cluster, k=6) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters
rect.hclust(hier_cluster, k=6, border="blue") 

# Outros metodos que podem ser usados sao: "ward", "single", "complete", "average", "mcquitty", "median" ou "centroid".
# A definicao de qual metodo usar varia com o objetivo do estudo e com o tipo de matriz de distancia usada.

#metodo nao hierarquico

# Determine number of clusters - Meto Elbow
wss_BaseRFV <- (nrow(Padr_BaseRFV )-1)*sum(apply(Padr_BaseRFV ,2,var))
for (i in 2:15) wss_BaseRFV[i] <- sum(kmeans(Padr_BaseRFV ,iter.max=100,
                                     centers=i)$withinss)
plot(1:15, wss_BaseRFV, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares") 


# Gerando a quantidade de cluster com Kmeans
attach(Padr_BaseRFV)

#Semente 
set.seed(2019)

#base padronizada, sementes
output_cluster_1 <-kmeans(Padr_BaseRFV,3,iter=100)
output_cluster_1

# quantas entidade dentro de cada cluster
BaseRFV$segmento3<-output_cluster_1$cluster
table (BaseRFV$segmento3)


# arquivo com centroides dos clusters
centros<-output_cluster_1$centers
centros

# quantas rodadas ate chegar nos clusters
Qte_iter<-output_cluster_1$iter
Qte_iter


# Mostrando Resultados
aggregate(BaseRFV,by=list(segmento3),FUN=mean)

aggregate(BaseRFV,by=list(segmento3),FUN=sum)
# Mostrando Resultados em gr?ficos

# Cluster Plot against 1st 2 principal components
# vary parameters for most readable graph
install.packages("cluster")

library(cluster)
clusplot(Padr_BaseRFV, output_cluster_1$cluster, color=TRUE, shade=TRUE,
         labels=2, lines=0 , cex=0.75)
# Centroid Plot against 1st 2 discriminant functions

install.packages("fpc")
library(fpc)
plotcluster(Padr_BaseRFV, output_cluster_1$cluster) 


# junta os arquivos em colunas
matriz<-cbind(BaseRFV,Padr_BaseRFV,segmento)
View(matriz)

write.csv(BaseRFV,'BaseRFV_Cluster.csv')

#--------------------------------------------------------------------------
# Descricao do perfil de cada cluster
#--------------------------------------------------------------------------


# grafico de barra e coluna

aggr <- BaseRFV %>%
  group_by(segmento3) %>%
  summarise(media=mean(recencia), dp=sd(recencia))

g <- ggplot(aggr)
g +geom_col(aes(x=segmento3,y=media))
g +geom_line(aes(x=segmento3,y=media))

g +geom_linerange(aes(x=segmento3,ymin=media-dp, ymax=media+dp), linetype="dashed")
g +geom_errorbar(aes(x=segmento3,ymin=media-dp, ymax=media+dp), linetype="dashed")
g +geom_errorbar(aes(x=segmento3,ymin=media-dp, ymax=media+dp), linetype="longdash")

g +geom_pointrange(aes(x=segmento3,y=media,ymin=media-dp, ymax=media+dp), size=1) +
  labs(title= "Media da recencia por segmentacao",
       x= "Segmentacao", y="Media da recencia") 


aggr <- BaseRFV %>%
  group_by(segmento3) %>%
  summarise(media=mean(valor), dp=sd(valor))

g <- ggplot(aggr)
g +geom_col(aes(x=segmento3,y=media))
g +geom_line(aes(x=segmento3,y=media))

g +geom_linerange(aes(x=segmento3,ymin=media-dp, ymax=media+dp), linetype="dashed")
g +geom_errorbar(aes(x=segmento3,ymin=media-dp, ymax=media+dp), linetype="dashed")
g +geom_errorbar(aes(x=segmento3,ymin=media-dp, ymax=media+dp), linetype="longdash")

g +geom_pointrange(aes(x=segmento3,y=media,ymin=media-dp, ymax=media+dp), size=1) +
  labs(title= "Media do Valor por segmentacao",
       x= "Segmentacao", y="Media do Valor") 


aggr <- BaseRFV %>%
  group_by(segmento3) %>%
  summarise(media=mean(compras), dp=sd(compras))

g <- ggplot(aggr)
g +geom_col(aes(x=segmento3,y=media))
g +geom_line(aes(x=segmento3,y=media))

g +geom_linerange(aes(x=segmento3,ymin=media-dp, ymax=media+dp), linetype="dashed")
g +geom_errorbar(aes(x=segmento3,ymin=media-dp, ymax=media+dp), linetype="dashed")
g +geom_errorbar(aes(x=segmento3,ymin=media-dp, ymax=media+dp), linetype="longdash")

g +geom_pointrange(aes(x=segmento3,y=media,ymin=media-dp, ymax=media+dp), size=1) +
  labs(title= "Media de Compras por segmentacao",
       x= "Segmentacao", y="Media de Compras") 
