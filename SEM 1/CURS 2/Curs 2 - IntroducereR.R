#Instalarea pachetelor
install.packages("psych")
install.packages("readxl")
install.packages("foreign")

#Încărcarea pachetelor
library(psych)
library(readxl)
library(foreign)

Nume <- c("Harry Potter", "Hermione Granger", "Ron Weasley", "Draco Malfoy", "Ernie MacMillan")
Casa <- c("Gryffindor", "Gryffindor", "Gryffindor", "Slytherin", "Hufflepuff")
DADA <- c(10, 9, 8, 9, 8)
Poțiuni <- c(8, 10, 8, 10, 9)
Farmece <- c(9, 10, 8, 9, 9)

Hogwarts <- data.frame(Nume, Casa, DADA, Poțiuni, Farmece)
View(Hogwarts)

Media <- (DADA+Poțiuni+Farmece)/3

Hogwarts <- data.frame(Hogwarts, Media)
View(Hogwarts)

