### Analiza de frecvențe ###

#instalarea pachetelor
install.packages("readxl")
install.packages("psych")

#încărcarea pachetelor
library(psych)
library(readxl)

# Frecvența absolută
faconst<-table(bdcap3$constiinciozitate)
cbind(faconst)

# Frecența cumulată
fcumconst <- cumsum(faconst)
cbind(faconst, fcumconst)

# Frecvența relativă
frconst<-prop.table(faconst)
cbind(faconst, fcumconst, frconst)

#Frecvența relativă procentuală
frpconst <- frconst*100
cbind(faconst, fcumconst, frconst,frpconst)

#Frecvența relativă cumulată procentuală
frcpconst<-cumsum(frpconst)
cbind(faconst, fcumconst, frconst,frpconst,frcpconst)

quartconst<-quantile(bdcap3$constiinciozitate, probs = c(0.22,0.60,0.72, 0.84))
quartconst

#Graficul de tip plăcintă

optiuni<-c(17, 11, 13, 9)
etichete<-c("Psihoterapie", "Psihologie organizațională", "Securitate națională", "Psihologie educațională")
pie(optiuni, etichete, col = c("blue", "salmon", "green", "yellow"))

#Graficul de tip bară
barplot(optiuni, names.arg=etichete, xlab="Domeniul de activitate",
    ylab="Frecvența", col = c("blue", "salmon", "green", "yellow"))

#Histograma
hist(bdcap3$constiinciozitate, xlab="Scor Conștiinciozitate", ylab="Frecvența",
     col="cyan", border="red", main="Histogramă Conștiinciozitate")
