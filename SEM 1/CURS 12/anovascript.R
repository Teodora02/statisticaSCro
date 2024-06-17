### ANOVA ONE-WAY ###

#instalarea pachetelor
install.packages("multcomp")
install.packages("dplyr")


#loading packages
library(psych)
library(car)
library(multcomp)
library(dplyr)

# încărcarea bazei de date - bdc12.xlsx

#definirea variabilei pets ca factor(variabila independnetă)
bdc12$pets<-as.factor(bdc12$pets)

#Statistica descriptivă și testarea condiției de normalitate

describeBy(bdc12$isolation, bdc12$pets)
# fără animale - skewness = -0.83; kurtosis = -0.51
# un animal - skewness = 0.35; kurtosis = -1.09
# cel puțin două animale - skewness = -0.20; kurtosis = -0.75

#homogeneity of variances

leveneTest(bdc12$isolation, bdc12$pets, center="mean")
# F = 0.23; p = .794.p > alpha -> varianțele sunt omogene

#Verificarea valorilor extreme
boxplot(bdc12$isolation~bdc12$pets, col=c("red", "blue", "green"),
        xlab="Număr animale", ylab="Percepția izolării")

#### Anova One-Way ####
anovaisolation<-aov(isolation ~ pets, data=bdc12)
summary(anovaisolation)

#F = 6.72, p = .003. Deoarece p < alpha (0.05) -> respingem ipoteza de nul
#În concluzie, cel puțin un eșantion face parte din altă populație.

#post-hoc analysis Bonferroni
pairwise.t.test(bdc12$isolation, bdc12$pets, p.adjust.method = "bonferroni")

#Analiza post-hoc cu testul Tukey
tukey_posthoc <- TukeyHSD(anovaisolation)
tukey_posthoc

#Analiza post hoc cu testul Dunnett (atunci când varianțele nu sunt omogene)
#solicită pachetul multcomp
dunnett_result <- glht(anovaisolation, linfct = mcp(pets = "Dunnett"))
summary(dunnett_result)


