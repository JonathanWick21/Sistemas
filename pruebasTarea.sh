#!/bin/bash

salir=0

while [ $salir -eq 0 ]; do
    echo "Elige una opcion"
    echo "1. Añadir tarea"
    echo "2. Listar tareas"
    echo "3. Marcar tarea completada"
    echo "4. ELiminar tarea"
    echo "5. Salir"
    read opcion

    if [ $opcion -eq 1 ]; then
        read -p "Introduce la tarea" >> tareas.txt
    elif [ $opcion -eq 2 ]; then
        cat tareas.txt
    elif [ $opcion -eq 3 ]; then
        read -p "Que tarea has completado?" tarea
        estaTarea=$(cat tarea.txt | egrep "^$tarea$")
        if [ -n tarea ]; then
            sed -i "/^$tarea/$" tareas.txt
            echo "Tareas completada: $tarea" >> tareasCompletadas.txt
        else
            echo "La tarea no esta añadida"
        fi
    elif [ $opcion -eq 4 ]; then
        read -p "Que tarea quieres eliminar?" tarea
        estaTarea=$()