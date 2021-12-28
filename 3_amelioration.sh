#!/bin/bash

function entete
{
    case $1 in
	"*")
	    echo -e "/*\c" >> $2.$3
	    ;;
	"#")
	    echo "#!/usr/bin/env bash" >> $2.$3
	    ;;
    esac
echo "$1
$1 @filename monfichier.tex
$1 @date 2019-10-18 15:13
$1 @author Prenom Nom <prenom.nom@enseirb-matmeca.fr>
$1 @brief ...
$1" >> $2.$3
    case $1 in
	"*")
	    echo "*/" >> $2.$3
	    ;;
    esac
}

CMD=$( basename $0 )

usage(){
    echo "Usage:$CMD..=>pas de fichier en argument (A PASSER!!)."
}

nbr_min_parameters=1
if [ "$#" -lt "$nbr_min_parameters" ];then
    usage
    exit 1
fi

function creation_squelette_C
{
    #c_s_C(mf,c)
    #$1=nom_fichier et $2 l'extension
    entete "*" $1 $2 #appel a la fct. entete avec
    #<=>entete("*",mf,c).
    #comme arguments: $1 "*" $2 =$1== nom_fichier et $3= $2 ==_sur__laligne
    #i.e. l'extension.
    ./3_1.sh $1 #creation (plutot ajout) de $1.c (..///)
}


function creation_squelette_TEX
{
     entete "%%" $1 $2
    ./3_2.sh $1
}


function creation_squelette_SHELL
{
     entete "#" $1 $2
    ./3_3.sh $1
}

case $2 in
    c)
	creation_squelette_C $1 $2
	;;
    tex)
	creation_squelette_TEX $1 $2
	;;

    sh)
	creation_squelette_SHELL $1 $2
	;;
esac
