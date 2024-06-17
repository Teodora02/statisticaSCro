#### CORELAȚIA PEARSON ####

#instalarea pachetelor necesare
library(psych)
library(Hmisc)
library(ggpubr)


#încărcarea bazei de date - bdc11

#ipoteza cercetării

#H1: Există o corelație între dificultățile în reglarea emoțională(DERS) și stresul post-traumatic(PTSD)
#H0: NU există o corelație între dificultățile în reglarea emoțională(DERS) și stresul post-traumatic(PTSD)

#testarea normalității
skew(bdc11$DERS)      #0.43
kurtosi(bdc11$DERS)   #-0.73

skew(bdc11$PTSD)      #0.60
kurtosi(bdc11$PTSD)   #-0.66

#Identificarea valorilor extreme
boxplot(bdc11$DERS, bdc11$PTSD, col=c("green", "yellow"))

#Coeficientul de corelație Pearson
cor.test(bdc11$DERS, bdc11$PTSD, method="pearson", conf.level = 0.95)

#Graficul scatterplot - folosește pachetul ggpubr

ggscatter(bdc11, x = "DERS", y = "PTSD", add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "DERS", ylab = "PTSD", color="black")


# H1: Există o relație pozitivă între alexitimie și stresul post-traumatic.
#H0: NU există o relație pozitivă între alexitimie și stresul post-traumatic.

cor.test(bdc11$Alexitimie, bdc11$PTSD, alternative="greater", method="pearson", conf.level = 0.97)

#Matricea de corelații

#Crearea bazei de date cu variabilele pe care dorim să le corelăm
bdcorelatii<-data.frame(bdc11$DERS, bdc11$PTSD, bdc11$Alexitimie, bdc11$Stres)

#Calcularea matricei de corelații
rcorr(as.matrix(bdcorelatii))

