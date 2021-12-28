/**
 *
 * @filename monfichier.c
 * @date 2019-10-18 15:13
 * @author Prenom Nom <prenom.nom@enseirb-matmeca.fr>
 * @brief ...
 *
 */
#include <stdlib.h>
#include <stdio.h>

#define _NB_MIN_PARAMS_ 1

void print_usage( char *argv[] ) {
	fprintf( stderr, "Usage: %s ....\n", argv[0] );
	return;
}

int main( int argc, char *argv[] )
{
	if ( argc < _NB_MIN_PARAMS_ ) {
		print_usage( argv );
		return EXIT_FAILURE;
	}

	return EXIT_SUCCESS;
}
