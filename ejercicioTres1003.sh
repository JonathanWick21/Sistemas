#!/bin/bash


anyadir() {
    read -p "Introduce un nombre" nombre
    read -p "Introduce una direccion" direccion
    leerTelefono()

    	echo "$nombre,$direccion,$telefono" >> lista.txt


}

buscar() {

    echo "Buscar por nombre (1)"
    echo "Buscar por direccion (2)"
    echo "Buscar por telefono (3)"

    read -p "Elige" eleccion

    if [ $eleccion -eq 1 ]; then
        read -p "Introduce el nombre " nombre
        cat lista.txt | cut -d "," -f1 | egrep '^$nombre$'

    elif [ $eleccion -eq 2 ]; then
        read -p "Introduce la direccion " direccion
        cat lista.txt | cut -d "," -f2 | egrep '^$direccion$'

    elif [ $eleccion -eq 3]; then
        leerTelefono()
        cat lista.txt | cut -d "," -f3 | egrep '^$telefono$'

    else
        echo "DEL 1 AL 3"



}

listar() {

    resultado=$(find ./ -name 'lista.txt' -maxdepth 1)

    if [ ! -z $resultado ]; then
        cat lista.txt
    else
        echo "" >> lista.txt
        cat lista.txt
    fi
}

ordenar() {
    sort lista.txt
}

borrar() {
    rm lista.txt
}

leerTelefono() {
    correcto=0

    while [ correcto -eq 0 ]; do
        read -p "Introduce un telefono" telefono
        if [ echo $telefono | egrep "^[6789][0-9]{8}$" -eq $telefono 2>null ]; then
            correcto=1
        fi
}

opcion=99

while [ $opcion -ne 0 ]
do
    echo "Añadir(1)"
    echo "Buscar(2)"
    echo "Listar(3)"
    echo "Ordenar(4)"
    echo "Borrar(5)"
    echo "Salir(0)"

    read -p "Elige una opcion" opcion


    if [ $opcion -eq 1 ]; then
        anyadir
    elif [ $opcion -eq 2 ]; then
        buscar
    elif [ $opcion -eq 3 ]; then
        listar
    elif [ $opcion -eq 4 ]; then
        ordenar
    elif [ $opcion -eq 5 ]; then
        borrar
    elif [ $opcion -eq 0 ]; then
        exit
    fi

