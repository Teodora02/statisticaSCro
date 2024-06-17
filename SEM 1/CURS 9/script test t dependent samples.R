#### TESTUL t PENTRU DOUĂ EȘANTIOANE DEPENDENTE ####

#încărcarea pachetelor
library(psych)

#încărcarea bazei de date - bdc9.xlsx

#verificarea condiției de normalitate
skew(bdc9$inainte)      # -0.24
kurtosi(bdc9$inainte)   # -1.11

skew(bdc9$după)         # 0.31
kurtosi(bdc9$după)      # -0.67

#identificarea valorilor extreme
boxplot(bdc9$inainte, bdc9$după, col=c("blue", "green"), xlab="Înainte și După")

#  testul t pentru două eșantioane dependnete
#H1: Performanța cicliștilor se va modifica după administrarea vitaminelor.
#H0: Performanța cicliștilor NU se va modifica după administrarea vitaminelor.

t.test(bdc9$inainte, bdc9$după, paired=TRUE, alternative="two.sided")

#mărimea efectului
cohensD(bdc9$inainte, bdc9$după)

# ipoteza unilaterală
#H1: După administrarea vitaminelor performanța cicliștilor va fi mai bună.
#H0: După administrarea vitaminelor performanța cicliștilor NU va fi mai bună.

t.test(bdc9$după, bdc9$inainte, paired=TRUE, alternative="greater", conf.level = 0.99)
