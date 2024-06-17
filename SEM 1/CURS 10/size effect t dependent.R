### MĂRIMEA EFECTULUI ###

#încărcarea pachetelor
library(psych)
library(lsr)

#încărcarea bazei de date - bdc10v2

#verificarea valorilor extreme
boxplot(bdc10v2$P1)