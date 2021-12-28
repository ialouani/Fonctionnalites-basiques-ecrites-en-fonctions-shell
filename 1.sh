#!/bin/bash
#$1 represente le nom du processus par exemple firefox
#./1.sh va permettre de tuer firefox par exemple.
#kill -KILL pid => chercher le pid.
pid_process=$(ps | grep $1 | awk -F " " '{print $1}') 
kill -KILL $pid_process
