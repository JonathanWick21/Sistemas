#/bin/bash

salida=0

#Vamos a asumir que 0 es cruz
numeroRandom=$(((RANDOM % 2)))
while [ $salida -eq 0 ]
do
	read -p "Cuanto vas a apostar? " apuesta
	if [ $(echo $apuesta | egrep -x [0-9]+) -eq $apuesta 2>/dev/null ]
	then
		salida=1
	else
		echo "Debes introducir un numero entero"
	fi
done
	if [ $numeroRandom -eq 1 ]
	then
		echo "Enhorabuena has ganado $((apuesta * 2))"
	else
		echo "Has perdido todo borracho"
	fi

