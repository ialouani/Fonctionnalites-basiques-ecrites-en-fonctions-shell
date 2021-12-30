#!/bin/bash

declare -a List=(Adj Adv Con Conj Det Int Ono Pre Pro QPro Abr)

sed '/^[a-z]*-/d' dico.utf8 > dico5.utf8



touch file2.txt
for i in ${List[*]};do
    if [ "$i" != "Abr" ];then
	cat dico5.utf8 | awk -F " " '{print $3}' | grep $i > file1.txt
	retvalue=$?
	if [ $retvalue == 0 ] ;then
	    cat dico5.utf8 | grep $i >> file2.txt
	fi
    fi
done

cat file2.txt > dico2.utf8


cat dico2.utf8 | grep 'Nom' | grep 'SG' > file3.txt
cat dico2.utf8 | grep 'Ver' | grep 'Inf'> file4.txt
cat dico2.utf8 | grep 'Ver' | grep 'PPas' | grep 'Mas' | grep 'SG' > file5.txt
touch dico3.utf8
cat file3.txt > dico3.utf8
cat file4.txt >> dico3.utf8
cat file5.txt >> dico3.utf8
declare -a List=(Adj Adv Con Conj Det Int Ono Pre Pro QPro)
declare -a List2=(Adj Adv Con Conj Det Int Ono Pre Pro QPro)
touch file6.txt
for i in ${List[*]}
do
    cat dico2.utf8 | grep $i | grep 'Mas' | grep 'SG' >> file6.txt
done
touch file11.txt
for i in ${List[*]};do
    mot_important=$(cat dico2.utf8 | grep $i)
    mot2=$(cat dico2.utf8 | grep $i | awk -F " " '{print $3}' | awk -F "+" '{print $2}')
    if [[ -z "$mot2" ]];then
	echo -e "$mot_important" >> file11.txt
    fi
done
cat file6.txt >> dico3.utf8
cat file11.txt >> dico3.utf8
sort dico3.utf8 > dico4.utf8
rm *.txt
var=$1
n=$(echo ${#var})
m=0
declare -a List=()
while((m<n))
do
    List[m]=$(echo ${var:$m:1})
    ((m=m+1))
done
cat dico4.utf8 | awk -F " " '{print $1}' > file.txt
for i in ${List[*]}
do
    cat file.txt | grep $i > file7.txt
    rm file.txt
    cat file7.txt > file.txt
done
echo -e "-------------------------------"
while read part
do
    mot_length=$(echo ${#part})
    l=0
    while((l<$mot_length));do
	ss_mot=$(echo ${part:$l:1})
	echo ${List[*]} | grep $ss_mot >> file10.txt
	retvalue=$?
	if [ $retvalue != 0 ];then
 	    sed '/^'$part'/d' file.txt > file9.txt
	    rm file.txt
	    cat file9.txt > file.txt
	fi
        ((l=l+1))
    done
done<file.txt
echo -e "Le mot qui contient exactement un sous-emsemble(sens large) de la liste de len max"

if [ -z $(head file.txt) ];then
    echo "Pas de solutions"
    fi
echo -e "  ************** :->    \c" && cat file.txt 
rm *.txt



