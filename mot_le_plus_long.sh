#!/bin/bash
if [ -e file8.txt ];then
    rm file8.txt
fi
var=$1
n=$(echo ${#var})
m=0
declare -a List=()
while((m<n))
do
    List[m]=$(echo ${var:$m:1})
    ((m=m+1))
done
#echo ${List[@]}
cat dico4.utf8 | awk -F " " '{print $1}' > file.txt
for i in ${List[*]}
do
    cat file.txt | grep $i > file7.txt
    rm file.txt
    cat file7.txt > file.txt
done
while read part
do
    mot_length=${#part}
    mot=$part
    echo "$mot_length:$mot" >> file8.txt
done<file.txt
if [ ! -e file8.txt ];then
    echo "Pas de solutions"
else
cat file8.txt | sort -nr | head -1 | cut -d':' -f2
fi

