#!/bin/bash
if [ $# -ne 4 ]
then
	echo "ce programme demande 4 arguments"
	exit
fi

ANN1=$1
ANN2=$2
ANN3=$3
TYPE=$4

for ann in "$ANN1" "$ANN2" "$ANN3"; do
	if [ "$ann" == "$ANN1" ]; then
	       count=$(grep -h "$TYPE" /home/hxt/Exercice1/hxt/ann/$1/*/*.ann | wc -l)
       echo -e "$TYPE en $ANN1:\n$count" >> /home/hxt/Exercice1/hxt/compte_par_type_par_an.txt
elif [ "$ann" == "$ANN2" ]; then
               count=$(grep -h "$TYPE" /home/hxt/Exercice1/hxt/ann/$2/*/*.ann | wc -l)  
       echo -e "$TYPE en $ANN2:\n$count" >> /home/hxt/Exercice1/hxt/compte_par_type_par_an.txt  
elif [ "$ann" == "$ANN3" ]; then
               count=$(grep -h "$TYPE" /home/hxt/Exercice1/hxt/ann/$3/*/*.ann | wc -l)  
       echo -e "$TYPE en $ANN3:\n$count" >> /home/hxt/Exercice1/hxt/compte_par_type_par_an.txt
	fi
done	
