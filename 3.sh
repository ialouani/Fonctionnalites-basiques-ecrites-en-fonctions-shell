#!/bin/bash

CMD=$( basename $0 )

usage(){
    echo "Usage:$CMD..=>pas de fichier en argument (A PASSER!!)."
}

nbr_min_parameters=1
if [ "$#" -lt "$nbr_min_parameters" ];then
    usage
    exit 1
fi

creation_squelette_C(){
    ./3_1.sh $1
}


creation_squelette_TEX(){
    ./3_2.sh $1
}


creation_squelette_SHELL(){
    ./3_3.sh $1
}

case $2 in
    c)
	creation_squelette_C $1
	;;
    tex)
	creation_squelette_TEX $1
	;;

    sh)
	creation_squelette_SHELL $1
	;;
esac



    
