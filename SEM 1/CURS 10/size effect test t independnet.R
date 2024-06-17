### MĂRIMEA EFECTULUI ###

#instalarea pachetelor
install.packages("lsr")

#încărcarea pachetelor
library(lsr)
library(psych)
library(car)

#importarea bazei de date - bdc10v1

#Testul t pentru două eșantioane independente

#testarea condiției de normalitate
skew(bdc10v1$P1 [bdc10v1$Group==1]) # -0.11
kurtosi(bdc10v1$P1 [bdc10v1$Group==1]) # -1.01

skew(bdc10v1$P1 [bdc10v1$Group==2]) # -0.28
kurtosi(bdc10v1$P1 [bdc10v1$Group==2]) # -0.86

#testarea condiției de omogenitate a varianțelor
leveneTest(bdc10v1$P1, bdc10v1$Group, center=mean)
#F = 0.53; p = 0.465. p > alpha (0.05) -> acceptăm condiția de omogenitate a varianțelor

#H1: Studenții admiși în 2023 au o performanță semnificativ mai bună.
#H0: Studenții admiși în 2023 NU au o performanță semnificativ mai bună.

t.test(bdc10v1$P1~bdc10v1$Group, equal.var=TRUE, alternative="greater", conf.level=.95)

# t= 0.25, p = 0.400. p > alpha (0.05) -> acceptăm ipoteza de nul.
# Performanța obținută de studenții din 2023 nu este semnificativ mai bună decât cea
# obținută de studenții din 2022.

#calcularea mărimii efectului
cohensD(bdc10v1$P1~bdc10v1$Group)

# d = 0.05 -> rezultat ce indică o mărime a efectului foarte slabă.
# Putem concluziona că diferența este nesemnificativă și lipsită de intensitate.