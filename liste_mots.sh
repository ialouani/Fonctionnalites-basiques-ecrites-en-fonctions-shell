#!/bin/bash

cat dico.utf8 | grep 'Abr'  > file1.txt
cat dico.utf8 | grep '-'  > file2.txt 

if [ -e dico2.utf8 ];then
    rm dico2.utf8
fi
touch dico2.utf8
if [ -e dico3.utf8 ];then
    rm dico3.utf8
fi

touch dico3.utf8
cat dico.utf8 > dico2.utf8

while read part
do
    mot=$( echo $part | awk -F " " '{print $1}' )
    sed '/^'$mot'/d' dico2.utf8 > dico3.utf8
    rm dico2.utf8
    cat dico3.utf8 > dico2.utf8
done<file1.txt

while read part
do
    mot=$( echo $part | awk -F " " '{print $1}' | cut -d'-' -f1 )
    sed '/^'$mot'/d' dico2.utf8 > dico3.utf8
    rm dico2.utf8
    cat dico3.utf8 > dico2.utf8
done<file2.txt
	
rm dico3.utf8






    
	
