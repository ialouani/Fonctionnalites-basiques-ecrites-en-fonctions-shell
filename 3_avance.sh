#!/bin/bash

function entete
{
    export modele=$2
    touch $modele
    #fichier d'entete via une variable portant le meme nom.
    case $1 in
	"*")
	    echo -e "/*\c" >> $modele
	    ;;
	"#")
	    echo "#!/usr/bin/env bash" >> $modele
	    ;;
    esac
echo "$1
$1 @filename monfichier.tex
$1 @date $(date)
$1 @author Prenom Nom <prenom.nom@enseirb-matmeca.fr>
$1 @brief ...
$1" >> $modele
    case $1 in
	"*")
	    echo "*/" >> $modele
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
    entete "*" $1 #creation de la variable modele en globale
    #portant le meme nom que $1 ici.
    cat $modele >> $1.$2
    ./3_1.sh $1
}


function creation_squelette_TEX
{
    entete "%%" $1
    cat $modele >> $1.$2
    ./3_2.sh $1
}


function creation_squelette_SHELL
{
      entete "#" $1
    cat $modele >> $1.$2
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
