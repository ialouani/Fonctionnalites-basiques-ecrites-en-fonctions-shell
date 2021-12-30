#!/bin/bash

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
