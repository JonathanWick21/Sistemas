#!/bin/bash

if [[ $# -gt 0 && $# -lt 10 ]]
then
    
correcto=1

for ((i=1; i <= $#; i++))
do
    archivo=$(find ~ -name $1)
    if [ -z archivo ]; then
    correcto = 0
    fi
done

    if [ $correcto -eq 1 ]
    then
        read -p "Seguro que quieres borrar(Escribe 'Si' para confirmar) " respuesta
        if [ $respuesta = "Si" ]; then
            echo "Borrando..."
            for ((i=1; i <= $#; i++)); do
                if [ -f $i ]; then
                    rm $i
                else
                    rmdir $1
                fi
            done
        else
            echo "Cancelando operacion..."
        fi
    fi
elif [ $# -gt 9 ]
then
    echo "Error demasiados parametros, maximo 9"
else
    echo "Error faltan parametros"
fi