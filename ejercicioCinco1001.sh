#!/bin/bash

read -p "Introduce el nombre de usuario " nombre

lineaUsuario=$(cat /etc/passwd | grep "^$nombre")

if [ ! -z $lineaUsuario ]; then

    home=$(echo $lineaUsuario | cut -d ':' -f6)
    echo $home

    conectado=$(who | egrep $"nombre")
    if [ ! -n $conectado ]; then
        echo "Esta conectado"
        ip=$(w | egrep $nombre | tr ' ' '/' | tr -s '/' -f3)
        echo $ip
    else
        echo "No esta conectado"
    fi

    grupos=$(cat /etc/group | egrep $nombre | cut -d ':' f1 | tr '\n' ' ')
    echo "Grupos: $grupos"

    else
        echo "No se ha encontrado al usuario"
    fi