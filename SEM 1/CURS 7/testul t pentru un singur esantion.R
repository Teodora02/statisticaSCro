#încărcarea pachetelor
library(psych)

# Testul t pentru un singur eșantion

t.test(bdtestt$Matematica, mu=24.86, alternative="two.sided")

t.test(bdtestt$Română, mu=25.14, alternative="two.sided")

# Testul t pentru un eșantion pentru alpha = 0.02 și o ipoteză unilaterală
# (media eșantionului este mai mare decât media populației)

t.test(bdtestt$Matematica, mu=24.86, alternative="greater", conf.level=0.98)

#conf.level solicită valoarea intervalului de înceredere  (1-alpha)
# Atunci când presupunem că media eșantionului este mai mare decât media populației,
# alternative = "greater"

#  Atunci când presupunem că media eșantionului este mai mică decât media populației,
# alternative = "less"