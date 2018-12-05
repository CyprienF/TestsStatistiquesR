# Exemple avec deux valeurs



Pa <- 1/100 * (40+22)
Pe <- (1/(100^2)) * (61*57 + 39*43)

K <- (Pa - Pe) / (1 - Pe)
# Formule alternative
# K <- (2(40*22))/(61*43 + 39*57)
print(K)

# Exemple avec quatre valeurs
Pa <- 1/465 * (20+34+53+29)
Pe <- 1/465^2 * (124*72 + 99*165 + 155*144 + 87*84)

K <- (Pa - Pe) / (1 - Pe)
print(K)
