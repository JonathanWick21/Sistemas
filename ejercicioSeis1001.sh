#!/bin/bash

if [ $# -eq 2 ]; then

    informe=$1
    ubicacion=$2

else
    read -p "Introduce el nombre del informe" informe
    read -p "Introduce su ubicacion" ubicacion


for i in $(ping $ubicacion); do 
    $i >> $informe
    
    ip=$(echo $i | cut -d ' ' -f4)
    
    if [ $ip =~  ^(1[0-2][0-6]|[1-9]?[0-9])\..* ]; then
        echo "Tipo A" >> $informe
    elif [ $ip =~ ^(12[8-9]|1[3-9][0-1]\..*) ]; then
        echo "Tipo B" >> $informe
    else
        echo "Tipo C" >> $informe

        
    