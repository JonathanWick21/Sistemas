#!/bin/bash

if [ $# -eq 1 ]
then

    encontrado=$(find ./ -maxdepth 1 -type f -name $1)


    if [ ! -z $encontrado ]; then
        encontrarAlumnos=$(cat /etc/grupo | egrep "^Alumnos")
        
        if [ -z encontrarAlumnos ]; then
            sudo addgroup --allow-bad-names Alumnos
            echo $? >> bitacora.txt
        fi
        
        for i in $(cat $1); do

            nombre=$(echo $1 | cut -d ',' -f1)
            echo $? >> bitacora.txt
            apellido=$(echo $1 | cut -d ',' -f2)
            echo $? >> bitacora.txt
            clave=$(echo $1 | cut -d ',' -f3)
            echo $? >> bitacora.txt
            grupo=$(echo $1 | cut -d ',' -f4)
            echo $? >> bitacora.txt
            usuario=$(echo $1 | cut -d ',' -f6)
            echo $? >> bitacora.txt

            estaGrupo=$(cat /etc/grupo | egrep $grupo)

            if [ -z $estaGrupo ]; then
                sudo addgroup --allow-bad-names $grupo
                echo $? >> bitacora.txt
            fi

            estaUsuario=$(cat /etc/passwd | egrep $nombre)
            if [ -z $estaUsuario ]; then
                sudo useradd -c "$nombre $apellido" -d "/home/$nombre" -g $grupo --badname $nombre
                echo $? >> bitacora.txt    
            fi

            echo $usuario:$clave | sudo chpass

            echo $nombre:$clave | sudo chpasswd
            echo $? >> bitacora.txt

            sudo usermod -aG Alumnos $usuario
            echo $? >> bitacora.txt
    else
        echo "No se ha encontrado el fichero"
    fi
else    
    echo "Debes introducir un parametro"
fi