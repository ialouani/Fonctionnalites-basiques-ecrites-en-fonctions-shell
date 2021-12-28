#!/usr/bin/env bash

CMD=$( basename $0 )

usage(){
    echo "Usage:$CMD..=>pas de fichier en argument (A PASSER!!)."
}

nbr_min_parameters=1
if [ "$#" -lt "$nbr_min_parameters" ];then
    usage
    exit 1
fi


cat ./dossier/meme3.sh >> $1.sh
