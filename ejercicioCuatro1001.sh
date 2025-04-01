#!/bin/bash

if [ $# -lt 1 ] || [ $# -gt 3 ]
then
    echo "Numero de parametros incorrecto"
else
    if [[ "$1" == *.txt ]]; then
        if [ "$2" == "ASC" ]; then
            sort "$1" >> "$3"
        elif [ "$2" == "DES" ]; then
            sort -r "$1" >> "$3"
        else
            echo "Se debe usar 'ASC' o 'DES'"
        fi
    else
        echo "Debes seleccionar un archivo de texto"
    fi    
fi
