#!/usr/bin/bash


for an in 2016 2017 2018
do
    
    local=$(grep "Location" /home/hxt/Exercice1/hxt/ann/$an/*/*.ann | wc -l)
    
    
    echo -e "Location en $an:\n$local"
done
