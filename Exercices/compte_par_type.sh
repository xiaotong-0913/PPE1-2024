#!/usr/bin/bash
if [ $# -ne 2 ]
then
	echo "ce programme demande 2 arguments"
	exit
fi

ANN=$1
TYPE=$2

count=$(grep -h "$TYPE" ~/Exercice1/hxt/ann/$ANN/*/*.ann | wc -l)

echo "$count" >> ~/Exercice1/hxt/compte_par_type.txt
