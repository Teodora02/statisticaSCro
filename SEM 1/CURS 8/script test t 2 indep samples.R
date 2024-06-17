#### TESTUL T PENTRU 2 EȘANTIOANE INDEPENDENTE ####

#încărcarea pachetelor
library(psych)
library(car)

#Grup 1 = adolescenți cu cel puțin un părinte plecat în străinătate
#Grup 2 = adolescenți care locuiesc cu ambii părinți

#Testarea normalității
skew(bdc8$WB [bdc8$Grup==1])      # 0,58
kurtosi(bdc8$WB [bdc8$Grup==1])   # -0,89

# Deoarece atât skewness cât și kurtosis sunt cuprinși între -1 și 1 concluzionăm că distribuția WB este 
# normală pentru eșantionul format din adolescenți care au cel puțin un părinte plecat la muncă în străinătate

skew(bdc8$WB [bdc8$Grup==2])    # -0,39
kurtosi(bdc8$WB [bdc8$Grup==2]) # -0,65

# Deoarece atât skewness cât și kurtosis sunt cuprinși între -1 și 1 concluzionăm că distribuția WB este 
# normală pentru eșantionul format din adolescenți care locuiesc cu ambii părinți

#Testarea condiției de omogenitate a varianțelor
leveneTest(bdc8$WB, bdc8$Grup, center=mean)

#p=0.261 > 0,05 -> varianțele sunt omogene

#Testul t pentru două eșantioane independente

var(bdc8$WB [bdc8$Grup==1])
var(bdc8$WB [bdc8$Grup==2])

t.test(bdc8$WB~bdc8$Grup, var.equal=TRUE, alternative="two.sided")

#t = -0.84
# p = 0.409 -> p > 0.05 -> acceptăm Ho și respingem H1 -> nu există diferențe semnificative la
# nivelul stării de bine a adolescenților în funcție de migrația părinților

#Dacă dorim să schimbăm alpha = 0.03; ipoteză unilaterală

#Adolescenții care au cel puțin un părinte plecat în altă țară prezintă un nivel al
# stării de bine mai mic decât cei care locuiesc cu ambii părinți

#Nivelul de încredere (Confindence interval) = 1 - alpha
#Dacă alpha = 0.03 -> CI = 0.97

t.test(bdc8$WB~bdc8$Grup, var.equal=TRUE, alternative="less", conf.level=.97)
