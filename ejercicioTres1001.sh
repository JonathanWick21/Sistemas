#!/bin/bash
//Si se pasa mas de un parametro entramos en el codigo como tal
if [ $# -gt 0 ]
then
//Buscamos el archivo usando el parametro 1
archivo=$(find ~ -name $1)
//Comprobaciones
    if [ -d $archivo ]
    then

    echo "$archivo es un directorio"
    ls -l $archivo

    elif [ -f $archivo ]
    then

    echo "$archivo es un archivo común"
    cat "$archivo"

    else
        echo "No es un directorio ni un archivo común"
    fi
    
    else
        echo "Debes introducir un parametro"
fi