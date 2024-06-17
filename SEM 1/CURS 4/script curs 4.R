#### Indicatorii statistici ####

#instalarea pachetelor


#încărcare pachetelor
library(psych)


#1 Media aritmetică
mean(bdcap4$ACE)

mean(bdcap4$ACE [bdcap4$Genul==2])

mean(bdcap4$ACE, trim=0.05)

#2 Mediana
median(bdcap4$ACE)

median(bdcap4$ACE [bdcap4$Genul==1])

#3 Modul

getmode <- function(Alexitimie) 
  {
  mod <- unique(Alexitimie)
  mod[which.max(tabulate(match(bdcap4$Alexitimie, mod)))]
  }

getmode(bdcap4$Alexitimie)

# Amplitudinea

range(bdcap4$Stres)

#Abaterea interquartilă

quantile(bdcap4$Stres)

#Abaterea standard

sd(bdcap4$ED)

#Skewness

skew(bdcap4$ACE)

#Kurtosis

kurtosi(bdcap4$Alexitimie)

#Funcția describe

describe(bdcap4$ACE)

describe(bdcap4[c("Stres", "ED")])

describe(bdcap4)

describeBy(bdcap4, bdcap4$Genul)