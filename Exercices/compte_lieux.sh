#!/bin/bash
if [ $# -ne 3 ]; then
	echo "ce programme demande 3 arguments"
	exit
fi

ANNEE=$1
MOIS=$2
NOMBRE=$3

FILES="/home/hxt/Exercice1/hxt/ann/$ANNEE/$MOIS/*.ann"
grep "Location" $FILES | cut -f 3 |uniq -c | sort -nr | head -n  $NOMBRE

