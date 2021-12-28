#!/usr/bin/env bash



#ce n'est pas ici: /bin/sh env bash
#MAIS: /usr/bin/env bash

CMD=$( basename $0 ) #nom_du_fichier (comme argv*[]).
nbminparams=1

usage()
{
	echo "Usage: $CMD ..."
}

if [ $# -lt $nbminparams ]
then
	usage
	exit 1
fi
