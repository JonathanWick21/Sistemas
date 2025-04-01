#!/bin/bash

if [ $# -eq 1 ]
then

    encontrado=$(find ./ -maxdepth 1 -type f -name $1)


    if [ ! -z $encontrado ]; then
        encontrarAlumnos=$(cat /etc/grupo | egrep "^Alumnos")
        if [ -z encontrarAlumnos ]; then
            sudo addgroup Alumnos

        for i in $(cat $1); do
            nombre=$(echo $1 | cut -d ',' -f1)
            echo $? >> bitacora.txt
            grupo=$(echo $1 | cut -d ',' -f4)
            echo $? >> bitacora.txt
            apellido=$(echo $1 | cut -d ',' -f2)
            echo $? >> bitacora.txt
            clave=$(echo $1 | cut -d ',' -f3)
            echo $? >> bitacora.txt

            estaGrupo=$(cat /etc/grupo | egrep $grupo)

            if [ -z $estaGrupo ]; then
                sudo addgroup $grupo
                echo $? >> bitacora.txt
            fi

            estaUsuario=$(cat /etc/passwd | egrep $nombre)
            if [ -z $estaUsuario ]; then
                sudo useradd -c "$nombre $apellido" -d "/home/$nombre" -g Alumnos $nombre
                echo $? >> bitacora.txt    
            fi

            echo $nombre:$clave | sudo chpasswd
            echo $? >> bitacora.txt

else
    echo "Debes introducir un parametro"