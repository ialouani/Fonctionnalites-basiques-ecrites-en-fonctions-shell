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

echo  "
#include <stdlib.h>
#include <stdio.h>

#define _NB_MIN_PARAMS_ 1

void print_usage( char *argv[] ) {
	fprintf( stderr, \"Usage: %s ....\n\", argv[0] );
	return;
}

int main( int argc, char *argv[] )
{
	if ( argc < _NB_MIN_PARAMS_ ) {
		print_usage( argv );
		return EXIT_FAILURE;
	}

	return EXIT_SUCCESS;
}" >> $1.c
