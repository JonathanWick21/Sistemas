#!/bin/bash
diccionario="diccionario.txt"
if [ $# -eq 2 ]
then
    if [ $1 = "ingles" ]; then
        traduccion=$(cat $diccionario | egrep "^$2:" | cut -d ":" -f2)
        if [ $traduccion ]; then
            echo $traduccion
        else
            read -p "$2 no esta en el diccionario. ¿Quieres añadirla(Si)?" respuesta
            if [ $respuesta = "Si" ]; then
                read -p "Cual es su traduccion al ingles?" palabra
                echo "$2:$palabra" >> $diccionario
            else
                echo "XAO"
                exit
            fi
    fi
    elif [ $1 = "espanyol" ]; then
        traduccion=$(cat $diccionario | egrep ":$2:" | cut -d ":" -f1)
        if [ -n "$traduccion" ]; then
            echo $traduccion
        else
            read -p "$2 no esta en el diccionario. ¿Quieres añadirla?(Si)" respuesta
            if [ $respuesta = "Si" ]; then
                read -p "Cual es su traduccion al español?" palabra
                echo "$palabra:$2" >> $diccionario
            else
                echo "XAO"
                exit
            fi
        fi
    else
        echo "Debes elegir (ingles/español)"
    fi
else
    echo "Parametros incorrectos"
fi