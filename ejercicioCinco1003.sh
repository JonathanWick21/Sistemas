#!/bin/bash

salir=0
#Menu
while [ $salir -eq 0 ]; do
    echo "1. Mostrar los procesos"
    echo "2. Matar un proceso"
    read -p "3. Salir 
    " opcion

    if [ $opcion -eq 1 ]; then
        ps aux

    elif [ $opcion -eq 2 ]; then
        read -p "Cual es el id o el nombre del proceso " proceso
        #Para comprobar que existe
        estaProceso=$(ps aux | egrep $proceso)
        #Si si existe
        if [ -n estaProceso ]; then
            #Comprobamos si es un numero
            if [ $(echo $proceso | egrep "(^[0-9]+$)" -eq $proceso 2 > null /dev/null) ]; then
            kill $proceso
            else 
                killall $proceso
            fi
        else
            echo "No existe el proceso"
        fi

    elif [ $opcion -eq 3 ]; then
        echo "Saliendo"
        salir=1
    else
        echo "Debes elegir una de las 3 opciones"
    fi