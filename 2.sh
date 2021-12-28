#!/bin/bash
#on a une sequence en parametre par exemple: 1 2 3
#on doit faire 1+2=3(rslt) puis rslt+3(le suivi de la sequence)
#rappels: $# est le nombre d'arguments
n=2
#normalement $#-1 affichages => boucle tours nombre: $#-2 (car affichage
#premier avant boucle) 
nbr_args=$# 
rslt=$(($1+$2))
echo "$1 + $2 = $rslt"
shift
shift
while((n<$nbr_args)) #<=>n<$nbr_args-2 avec n=0 au debut
     #mais celle-la plus securitaire.
do
    arg=$1
    rslt2=$(($rslt+$arg))
    echo "$rslt + $arg = $rslt2"
    ((n=n+1))
    rslt=$rslt2
    shift
done
#execution : ./2.sh $(seq 1 10)
    
