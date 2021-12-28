#!/bin/bash

cat dico2.utf8 | grep 'Nom' | grep 'SG' > file3.txt
cat dico2.utf8 | grep 'Inf' > file4.txt
cat dico2.utf8 | grep 'PPas' | grep 'Mas' | grep 'SG' > file5.txt
touch dico3.utf8
cat file3.txt > dico3.utf8
cat file4.txt >> dico3.utf8
cat file5.txt >> dico3.utf8
declare -a List=(Adj Adv Con Conj Det Int Ono Pre Pro QPro)
touch file6.txt
for i in ${List[*]}
do
    cat dico2.utf8 | grep $i | grep 'Mas' | grep 'SG' >> file6.txt
done
cat file6.txt >> dico3.utf8
sort dico3.utf8 > dico4.utf8
