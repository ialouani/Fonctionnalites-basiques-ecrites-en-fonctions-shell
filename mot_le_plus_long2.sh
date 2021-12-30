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
cat dico5.utf8 | awk -F " " '{print $1}' >> file.txt
for i in ${List[*]}
do
    cat file.txt | grep $i > file7.txt
    rm file.txt
    cat file7.txt > file.txt
done
echo -e "Mots contenant cet ensemble de lettres"
cat file.txt
echo -e "-------------------------------"
mot1=$(cat file.txt | head -1)
mot_length0=${#mot1};
export mot_cible=$mot1;
while read part
do
    mot=$part
    mot_length=${#mot}
    if [[ "$mot_length" -gt "$mot_length0" ]];then
	mot_cible=$mot
	mot_length0=$mot_length	
    fi
done<file.txt
echo -e "Le mot qui contient exactement un sous-emsemble(au sens large) de la liste de len max avec d'autres lettres possibles"
echo "$mot_cible : $mot_length0"
rm *.txt
