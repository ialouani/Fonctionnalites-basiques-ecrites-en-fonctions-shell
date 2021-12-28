#!/bin/bash

creation_squelette_C(){
    ./3_1.sh $1
}


creation_squelette_TEX(){
    ./3_2.sh $1
}


creation_squelette_SHELL(){
    ./3_3.sh $1
}

#test
creation_squelette_C $1 #mode arguments avec fonction sans
