#### Verificarea datelor parametrice ####

#instalarea pachetelor
install.packages("sur")
install.packages("ggpubr")

#încărcarea pachetelor
library(psych)
library(sur)
library(ggpubr)
library(car)

#încărcarea bazei de date bdcap6.xlsx

#1.1 Condiția de normalitate - skewness și kurtosis

skew(bdcap6$SR)

kurtosi(bdcap6$SR)

se.skew(bdcap6$SR) # din pachetul sur

sekurtosis <- sqrt(24/1200)
sekurtosis

zskewness <- 2.53/0.07
zskewness

zkurtosis <- 9.68/0.14
zkurtosis

#1.2 Condiția de normalitate - Shapiro-Wilk

shapiro.test(bdcap6$SR)

#1.3 Analiza vizuală a normalității

ggqqplot(bdcap6$SR)

hist(bdcap6$SR, xlab="SR", main="Histogram of SR")

#2.1 Analiza omogenității de varianță - Testul Levene

leveneTest(bdcap6$SR, bdcap6$Genul, center=mean)

#2.2 Raportul Hartley F Max

var(bdcap6$SR [bdcap6$Genul==1])

var(bdcap6$SR [bdcap6$Genul==2])

#3. Identificarea valorilor extreme

#3.1 Graficul boxplot

quantile(bdcap6$SR)

boxplot(bdcap6$SR, col ="cyan", main = "Valorile extreme ale variabilei SR")

boxplot(bdcap6$SR, bdcap6$Genul, col =c("cyan", "salmon"), main = "Valorile extreme ale variabilei SR")
