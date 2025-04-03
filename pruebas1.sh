#!/bin/bash



salir=0

while [ $salir = 0 ]; do

    echo "Elige una opcion"
    echo "1. Añadir usuario"
    echo "2. Listar usuarios"
    echo "3. Eliminar usuario"
    echo "4. Salir"
    read opcion

    read -p "Introduce el usuario" usuario
    existeUsuario=$(cat /etc/passwd | egrep "$usuario")
    existeUsuarioEnFichero=$(cat usuarios.txt | egrep "$usuario")

    if [ $opcion -eq 1 ]; then
        if [ -z $existeUsuario ]; then
            sudo useradd $usuario
            echo $usuario >> usuarios.txt
        else 
            echo "El usuario ya existe"
        fi
    elif [ $opcion -eq 2 ]; then
        cat usuarios.txt

    elif [ $opcion -eq 3 ]; then
        sudo userdel $usuario
    elif [ $opcion -eq 4 ]; then
        salir=1
    else
        echo "Debes introducir una opcion correcta"
    fi
done

