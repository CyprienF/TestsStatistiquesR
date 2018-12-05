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

#Algorithme avec une matrice carrée en entrée
kappaTest <- function(data){
  x<-dim(data)[1]
  y<-dim(data)[2]
  
  if(x==y){
    
    sommeDiag<-0
    productJudgementSum<-0
    totalLine<-rowSums(data)
    totalColumn<-colSums(data)
    sumLine<-sum(totalLine)
    sumColum<- sum(totalColumn)
    
    if(sumLine==sumColum){
      for(i in 1:(x)){
        sommeDiag<-sommeDiag+data[i,i]
        productJudgementSum<-productJudgementSum+(totalLine[i]*totalColumn[i])
      }
      
      
      Pa<-sommeDiag/sum(totalLine)
      Pe<-productJudgementSum/(sumLine)^2
      
      K <- (Pa - Pe) / (1 - Pe)
      print(paste("K = ",K))
      
      if ( K<0 ){
        print("Grand désaccord")
      }else if(K>=0 && K<0.21){
        print("Accord très faible")
      }else if(K>=0.21 && K<0.41){
        print("Accord faible")
      }else if(K>=0.41 && K<0.61){
        print("Accord moyen")
      }else if(K>=0.61 && K<0.81){
        print("Accord satisfaisant")
      }else if(K>=0.81 && K<=1){
        print("Accord excellent")
      }
      
    }else{
      print("Les totaux des jugement ne corresponde pas")  
    }
    
  }else{
    print("La matrice n'est pas une matrice carré")
  }
  
}
tab <- read.table("C:/Users/Epulapp/Documents/Projet_Poly/Stat/TestsStatistiquesR/testJuge1.txt",header=FALSE)

kappaTest(as.matrix(tab))

tab <- read.table("C:/Users/Epulapp/Documents/Projet_Poly/Stat/TestsStatistiquesR/testJuge2.txt",header=FALSE)
kappaTest(as.matrix(tab))
