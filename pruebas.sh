#!/bin/bash

if [ $# -gt 0 ];then

    # Comprobamos si existe el archivo pasado como argumento en la misma carpeta
    encontrado=$(find ./ -maxdepth 1 -type f -name $1)

    if [ ! -z $encontrado ]; then
        
        # Comprobamos si existe el grupo de Alumnos
        existeAlumnos=$(cat /etc/group | egrep "^Alumnos")

        # Si no existe creamos el grupo
        if [ -z $existeAlumnos ]; then
            sudo addgroup --allow-bad-names Alumnos
            echo $? >> bitacora.txt
        fi

        for linea in $(cat $1); do

            echo "Operaciones de la linea numero: $linea" >> bitacora.txt

            # Recuperamos los campos que necesitamos
            nombre=$(echo $linea | cut -d , -f 1)
            echo $? >> bitacora.txt
            apellidos=$(echo $linea | cut -d , -f 2)
            echo $? >> bitacora.txt
            contrasena=$(echo $linea | cut -d , -f 3)
            echo $? >> bitacora.txt
            grupo=$(echo $linea | cut -d , -f 4)
            echo $? >> bitacora.txt
            usuario=$(echo $linea | cut -d , -f 6)
            echo $? >> bitacora.txt

            # Comprobamos si existe el grupo
            existeGrupo=$(cat /etc/group | egrep $grupo)
            echo $? >> bitacora.txt

            # Si el grupo no existe lo creamos
            if [ -z $existeGrupo ]; then
                sudo addgroup --allow-bad-names $grupo
                echo "anyadir grupo $?" >> bitacora.txt
            fi

            # Comprobamos si existe el usuario
            existeUsuario=$(cat /etc/passwd | egrep "^$usuario")
            echo $? >> bitacora.txt

            # Si no existe lo creamos indicando su nombre y apellidos y su home personalizado
            if [ ! -n "$existeUsuario" ]; then
                sudo useradd -c "$nombre $apellidos" -d "/home/$usuario" -g Alumnos --badname $usuario 
                echo "anyadir usuario $?" >> bitacora.txt
            fi

            # Cambiamos la contrasenya del usuario
            echo $usuario:$contrasena | sudo chpasswd
            echo $? >> bitacora.txt
            
            sudo usermod -aG Alumnos $usuario # Anyade al usuario a su grupo
            echo $? >> bitacora.txt

        done
    else
        echo "No se ha encontrado el fichero $1"
    fi

else
    echo "Introduce un parametro con el fichero de usuarios"
fi