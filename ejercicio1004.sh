#/bin/bash

#Comprobamos que solo haya un parametro
if [ $# -eq 1 ]
then

	archivo=$(find ./ -type f -name $1)
#Comprobamos que no sea null
	if [ ! -z $archivo ]
	then
		lineas=$(wc -l $1 | tr -s ' ' | cut -d ' ' -f1)
		echo "el numero de lineas es $lineas"
	else
		echo "No se encontro el archivo"
	fi
fi
